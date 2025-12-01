module vlibuv

import vlibuv.uv

// Callback types for idiomatic API
pub type AllocationCb = fn (handle Handle, suggested_size usize, buf &Buffer)

pub type ReadCb = fn (stream Stream, nread isize, buf &Buffer)

// DataCb is a simpler callback for reading data - just provides the data bytes
// This is the recommended callback type for most use cases
pub type DataCb = fn (stream Stream, data []u8)

// ErrorCb handles read errors
pub type ErrorCb = fn (stream Stream, error_code int)

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

// listen starts listening for connections
// backlog: maximum number of connections that can be pending
// callback: called when a new connection is available or on error
// error codes: 0 = success, <0 = error code
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

// read_start initiates reading from the stream with automatic buffer management
// data_cb: called when data arrives with the actual data bytes
// error_cb: called on errors (optional - if none, errors are ignored)
// This is the recommended way to read from streams - much simpler than manual allocation
pub fn (s Stream) read_start_simple(data_cb DataCb, error_cb ?ErrorCb) !int {
	// Store stream reference in handle for callback access
	s.Handle.set_data(unsafe { &s })!

	// Create a simple buffer allocator that doesn't expose complexity to users
	c_alloc_callback := fn (handle &uv.Uv_handle_t, suggested_size usize, mut buf uv.Uv_buf_t) {
		// Allocate buffer internally and set it
		allocated := unsafe { malloc(suggested_size) }
		unsafe {
			buf.base = &char(allocated)
			buf.len = suggested_size
		}
	}

	// Wrap the user's data callback
	c_read_callback := fn [data_cb, error_cb, s] (stream &uv.Uv_stream_t, nread isize, buf &uv.Uv_buf_t) {
		if nread > 0 {
			unsafe {
				// Convert C buffer (char*) to V byte slice
				// Create a V byte array and copy data from C buffer
				mut data := []u8{len: int(nread)}
				C.memcpy(data.data, buf.base, usize(nread))
				data_cb(s, data)
			}
		} else if nread < 0 {
			// Handle errors - call error callback if provided
			if error_cb != none {
				error_cb(s, int(nread))
			}
			// Stop reading on error
			unsafe { C.uv_read_stop(stream) }
		}
		// Free the buffer that was allocated in c_alloc_callback
		unsafe {
			if !isnil(buf.base) {
				free(buf.base)
			}
		}
	}

	return error_checker(C.uv_read_start(s.to_stream(), c_alloc_callback, c_read_callback))
}

// read_start initiates reading from the stream (low-level - use read_start_simple instead)
// alloc_cb: called to allocate buffer space for incoming data
// read_cb: called when data arrives or on error (nread: bytes read, <0 on error)
// Common errors: UV_EOF (-4095) for end of stream
// NOTE: This is a low-level API. For most use cases, use read_start_simple() instead.
pub fn (s Stream) read_start(alloc_cb AllocationCb, read_cb ReadCb) !int {
	// Store stream reference in handle for callback access
	s.Handle.set_data(unsafe { &s })!

	// Wrap the user's allocation callback to convert raw handle and buf to wrapper types
	c_alloc_callback := fn [alloc_cb, s] (handle &uv.Uv_handle_t, suggested_size usize, mut buf uv.Uv_buf_t) {
		unsafe {
			user_buf := &Buffer{
				base: []u8{}
				buf:  *buf
			}
			alloc_cb(s.Handle, suggested_size, user_buf)
			// IMPORTANT: Update the underlying C buffer to use the allocated data
			// This is the critical fix - we must sync the V Buffer back to C
			if user_buf.base.len > 0 {
				buf.base = &char(user_buf.base.data)
				buf.len = usize(user_buf.base.len)
			}
		}
	}

	// Wrap the user's read callback to convert raw stream and buf to wrapper types
	c_read_callback := fn [read_cb, s] (stream &uv.Uv_stream_t, nread isize, buf &uv.Uv_buf_t) {
		unsafe {
			// Create a proper buffer from the C data
			mut data_slice := []u8{}
			if nread > 0 {
				// Copy data from C buffer to V slice
				data_slice = []u8{len: int(nread)}
				C.memcpy(data_slice.data, buf.base, usize(nread))
			}
			user_buf := &Buffer{
				base: data_slice
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
// status: 0 on success, <0 on error
pub type WriteCb = fn (stream Stream, status int)

// write sends data from a single buffer over the stream
// Callback is invoked when write completes (or fails)
pub fn (s Stream) write(buffer &Buffer, callback WriteCb) !int {
	write_req := &uv.Uv_write_t{}

	// Wrap user callback - convert C callback signature to V callback
	c_write_callback := fn [callback, s] (req &uv.Uv_write_t, status int) {
		callback(s, status)
	}

	raw_buf := buffer.get_raw()
	return error_checker(C.uv_write(write_req, s.to_stream(), &raw_buf, 1, c_write_callback))
}

// write_string sends a string as data over the stream
// The string is copied, so it can be freed or modified after this call
pub fn (s Stream) write_string(data string, callback WriteCb) !int {
	buffer := buffer_from_string(data)
	return s.write(&buffer, callback)
}

// write_bytes sends byte data over the stream
// The data is copied, so it can be freed or modified after this call
pub fn (s Stream) write_bytes(data []u8, callback WriteCb) !int {
	buffer := buffer_from_bytes(data)
	return s.write(&buffer, callback)
}

// write_buffers sends multiple buffers over the stream in a single operation
// This is more efficient than multiple write() calls as it's atomic from the socket perspective
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

	// Wrap user callback - convert C callback signature to V callback
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

// Helper methods for data management

// set_data stores arbitrary data associated with this stream (accessible in callbacks)
// This is useful for associating user state with stream operations
pub fn (s Stream) set_data(data voidptr) ! {
	s.Handle.set_data(data)!
}

// get_data_raw retrieves raw voidptr data associated with this stream
pub fn (s Stream) get_data_raw() voidptr {
	return uv.handle_get_data(s.Handle.to_handle())
}

// get_data_as retrieves typed data associated with this stream
// Usage: if user_state := stream.get_data_as[MyUserState]() { ... }
pub fn (s Stream) get_data_as[T]() ?&T {
	ptr := s.get_data_raw()
	if isnil(ptr) {
		return none
	}
	return unsafe { &T(ptr) }
}
