module vlibuv

import vlibuv.uv

// Callback types for idiomatic API
pub type AllocationCb = fn (handle Handle, suggested_size usize, buf &Buffer)

pub type ReadCb = fn (stream Stream, nread isize, buf &Buffer)

// pub enum StreamType {
// 	tcp
// 	pipe
// 	tty
// }

// stream is a subclass of handle,
// stream is a parent class of tcp, pipe, tty
pub struct Stream {
	Handle
pub mut:
	stream &uv.Uv_stream_t
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
			user_buf := &Buffer{
				base: []u8{}
				buf:  *buf
			}
			alloc_cb(s.Handle, suggested_size, user_buf)
		}
	}

	// Wrap the user's read callback to convert raw stream and buf to wrapper types
	c_read_callback := fn [read_cb, s] (stream &uv.Uv_stream_t, nread isize, buf &uv.Uv_buf_t) {
		unsafe {
			user_buf := &Buffer{
				base: []u8{}
				buf:  *buf
			}
			read_cb(s, nread, user_buf)
		}
	}
	return error_checker(C.uv_read_start(s.to_stream(), c_alloc_callback, c_read_callback))
}

pub fn (s Stream) read_stop() int {
	return uv.read_stop(s.to_stream())
}

// WriteCb callback type for idiomatic write operations
// status: 0 on success, error code on failure
pub type WriteCb = fn (stream Stream, status int)

// write sends data from a single buffer over the stream
pub fn (s Stream) write(buffer &Buffer, callback WriteCb) !int {
	write_req := &uv.Uv_write_t{}

	// Wrap user callback - just pass the captured Stream instead of reconstructing
	c_write_callback := fn [callback, s] (req &uv.Uv_write_t, status int) {
		callback(s, status)
	}

	raw_buf := buffer.get_raw()
	return error_checker(C.uv_write(write_req, s.to_stream(), &raw_buf, 1, c_write_callback))
}

// write_string sends a string as data over the stream
pub fn (s Stream) write_string(data string, callback WriteCb) !int {
	buffer := buffer_from_string(data)
	return s.write(&buffer, callback)
}

// write_bytes sends byte data over the stream
pub fn (s Stream) write_bytes(data []u8, callback WriteCb) !int {
	buffer := buffer_from_bytes(data)
	return s.write(&buffer, callback)
}

// write_buffers sends multiple buffers over the stream in a single operation
pub fn (s Stream) write_buffers(buffers []&Buffer, callback WriteCb) !int {
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
	c_write_callback := fn [callback, s] (req &uv.Uv_write_t, status int) {
		callback(s, status)
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
		return &uv.Uv_stream_t(s.stream)
	}
}

@[inline]
pub fn to_stream(ptr voidptr) &uv.Uv_stream_t {
	unsafe {
		return &uv.Uv_stream_t(ptr)
	}
	// return &uv.Uv_stream_t(ptr)
}

// ============================================================================
// Context-based API for better ergonomics with libuv callbacks
// ============================================================================

// StreamContext is a helper for managing stream read/write operations with state
pub struct StreamContext {
pub mut:
	stream    &Stream
	user_data voidptr
}

// read_start_ctx starts reading with context-based callbacks
// This approach stores the context in handle->data and uses stateless C callbacks
pub fn (s Stream) read_start_ctx(user_data voidptr, alloc_fn fn (ctx voidptr, suggested_size usize) []u8, read_fn fn (ctx voidptr, nread isize, data []u8)) !int {
	// Store user data in handle for callbacks to retrieve
	s.Handle.set_data(user_data)!

	// For now, return error - this needs more careful implementation
	// The challenge is that we need to bridge V closures with C callbacks
	return error('Context-based API is WIP - use low-level wrapper for now')
}

// set_data stores arbitrary data associated with this stream
pub fn (s Stream) set_data(data voidptr) ! {
	s.Handle.set_data(data)!
}

// get_data_raw retrieves raw voidptr data associated with this stream
pub fn (s Stream) get_data_raw() voidptr {
	return uv.handle_get_data(s.Handle.to_handle())
}
