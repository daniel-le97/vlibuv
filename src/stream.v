module vlibuv

import vlibuv.uv

// Callback types for idiomatic API
// These are low-level C callbacks - high-level wrappers convert types
pub type AllocationCb = fn (mut handle Handle, suggested_size usize, buf &uv.Uv_buf_t)

pub type ReadCb = fn (mut stream Stream, nread isize, buf &uv.Uv_buf_t)

pub type WriteCb = fn (mut stream Stream, status int)

// pub enum StreamType {
// 	tcp
// 	pipe
// 	tty
// }

// stream is a subclass of handle,
// stream is a parent class of tcp, pipe, tty
pub struct Stream {
	Handle
}

pub struct Request {
	data   []u8
	stream Stream
}

pub struct Response {
mut:
	stream Stream
}

pub fn (mut r Response) write(data string) ! {
	r.stream.write_string(data)!
}

pub fn (mut r Response) end(data string) ! {
	r.stream.write_string(data)!
	r.stream.close()!
}

pub fn (mut s Stream) read_start_simple(read_cb fn (stream Stream, data []u8)) ! {
	// Internally manage buffer allocation/deallocation using malloc/free
	// This ensures libuv has control over the memory lifetime
	c_alloc_callback := fn (mut handle Handle, suggested_size usize, buf &uv.Uv_buf_t) {
		unsafe {
			// Use malloc directly for C interop - V won't touch this memory
			buf.base = &char(malloc(suggested_size))
			buf.len = suggested_size
		}
	}

	c_read_callback := fn [read_cb, mut s] (mut stream Stream, nread isize, buf &uv.Uv_buf_t) {
		unsafe {
			if nread > 0 {
				// Create a V slice from the allocated buffer
				// buf.base is &char, convert to []u8 via pointer
				ptr := &u8(buf.base)
				data := []u8{len: int(nread), cap: int(nread)}
				// Manually set the data pointer
				(&data).data = ptr
				read_cb(s, data)
			}
			if nread != 0 { // 0 means read again, <0 means error
				// Free the malloc'd memory when done reading
				free(buf.base)
			}
		}
	}

	s.read_start(c_alloc_callback, c_read_callback)!
}

// On Stream/TCP
pub fn (mut s Stream) listen_simple(backlog int, callback fn (mut req Request, mut res Response)) ! {
	// Wrap the complex callback logic internally
	s.listen(backlog, fn [callback, mut s] (stream Stream, status int) {
		if status < 0 {
			eprintln('Listen error: ${status}')
			return
		}

		loop := stream.get_loop() or { return }
		mut client := Tcp.new(loop) or { return }

		stream.accept(client.Stream)

		// Create allocation callback that allocates buffers
		alloc_cb := fn (mut handle Handle, suggested_size usize, buf &uv.Uv_buf_t) {
			unsafe {
				buf.base = &char(malloc(suggested_size))
				buf.len = suggested_size
			}
		}

		// Create read callback that handles incoming data
		read_cb := fn [callback] (mut stream Stream, nread isize, buf &uv.Uv_buf_t) {
			unsafe {
				if nread > 0 {
					// Convert buffer to V slice
					ptr := &u8(buf.base)
					data := []u8{len: int(nread), cap: int(nread)}
					(&data).data = ptr

					req := Request{
						data:   data
						stream: stream
					}
					res := Response{
						stream: stream
					}
					callback(mut req, mut res)
				}
				if nread != 0 {
					free(buf.base)
				}
			}
		}

		mut client_stream := client.Stream
		client_stream.read_start(alloc_cb, read_cb) or {}
	})!
}

pub fn (s Stream) listen(backlog int, callback fn (stream Stream, status int)) !int {
	return error_checker(C.uv_listen(s.to_stream(), backlog, fn [callback, s] (stream &uv.Uv_stream_t, status int) {
		unsafe {
			callback(s, status)
		}
	}))
}

pub fn (s Stream) accept(client &Stream) int {
	return uv.accept(s.to_stream(), client.to_stream())
}

pub fn (s Stream) read_start(alloc_cb AllocationCb, read_cb ReadCb) !int {
	// Wrap the user's allocation callback to convert raw handle and buf to wrapper types
	c_alloc_callback := fn [alloc_cb, s] (handle &uv.Uv_handle_t, suggested_size usize, buf &uv.Uv_buf_t) {
		unsafe {
			// user_buf := &Buffer{
			// 	base: []u8{}
			// 	buf:  *buf
			// }
			mut new_handle := &Handle{
				handle: handle
				closed: s.closed
			}
			alloc_cb(mut new_handle, suggested_size, buf)
		}
	}

	// Wrap the user's read callback to convert raw stream and buf to wrapper types
	c_read_callback := fn [read_cb, s] (stream &uv.Uv_stream_t, nread isize, buf &uv.Uv_buf_t) {
		unsafe {
			// user_buf := &Buffer{
			// 	base: []u8{}
			// 	buf:  *buf
			// }
			read_cb(mut s, nread, buf)
		}
	}
	return error_checker(uv.read_start(s.to_stream(), c_alloc_callback, c_read_callback))
}

pub fn (s Stream) read_stop() int {
	return uv.read_stop(s.to_stream())
}

// write sends data from a single buffer over the stream
pub fn (mut s Stream) write(buffer &Buffer, callback WriteCb) !int {
	write_req := &uv.Uv_write_t{}

	// Wrap user callback - just pass the captured Stream instead of reconstructing
	c_write_callback := fn [callback, mut s] (req &uv.Uv_write_t, status int) {
		callback(mut s, status)
	}

	raw_buf := buffer.get_raw()
	return error_checker(C.uv_write(write_req, s.to_stream(), &raw_buf, 1, c_write_callback))
}

// response := 'HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\nContent-Length: 13\r\n\r\nHello, World!'

// write_req := &uv.Uv_write_t{}
// write_buf := uv.buf_init(response.str, usize(response.len))
// uv.write(write_req, client, &write_buf, 1, on_write)

struct WriteContext {
mut:
	req &uv.Uv_write_t
	buf uv.Uv_buf_t
}

pub fn (mut s Stream) write_string(data string) ! {
	ctx := &WriteContext{
		req: &uv.Uv_write_t{}
		buf: uv.buf_init(data.str, usize(data.len))
	}

	result := uv.write(ctx.req, s.to_stream(), &ctx.buf, 1, fn [ctx] (writer &uv.Uv_write_t, status int) {
		if status < 0 {
			eprintln('Write error: ${status}')
		}
		unsafe { free(ctx.req) }
		unsafe { free(ctx) }
	})
	error_checker(result)!
}

// write_bytes sends byte data over the stream
pub fn (mut s Stream) write_bytes(data []u8, write_cb fn (&uv.Uv_write_t, int)) {
	write_req := &uv.Uv_write_t{}
	write_buf := uv.buf_init(data.data, usize(data.len))
	uv.write(write_req, s.to_stream(), &write_buf, 1, write_cb)
}

// write_buffers sends multiple buffers over the stream in a single operation
pub fn (mut s Stream) write_buffers(buffers []&Buffer, callback WriteCb) !int {
	if buffers.len == 0 {
		return error('cannot write 0 buffers')
	}

	write_req := &uv.Uv_write_t{}

	// Convert Buffer wrappers to raw uv buffers
	mut raw_bufs := []uv.Uv_buf_t{len: buffers.len}
	for i, buf in buffers {
		raw_bufs[i] = buf.get_raw()
	}

	// Wrap user callback - just pass the captured Stream instead of reconstructing
	c_write_callback := fn [callback, mut s] (req &uv.Uv_write_t, status int) {
		callback(mut s, status)
	}

	return error_checker(C.uv_write(write_req, s.to_stream(), raw_bufs.data, usize(buffers.len),
		c_write_callback))
}

pub fn (s Stream) is_readable() bool {
	return uv.is_readable(s.to_stream()) == 1
}

pub fn (s Stream) is_writable() bool {
	return uv.is_writable(s.to_stream()) == 1
}

pub fn (s Stream) set_blocking(blocking bool) {
	uv.stream_set_blocking(s.to_stream(), bool_to_int(blocking))
}

pub fn (s Stream) to_stream() &uv.Uv_stream_t {
	unsafe {
		return &uv.Uv_stream_t(s.handle)
	}
}

@[inline]
pub fn to_stream(ptr voidptr) &uv.Uv_stream_t {
	unsafe {
		return &uv.Uv_stream_t(ptr)
	}
	// return &uv.Uv_stream_t(ptr)
}
