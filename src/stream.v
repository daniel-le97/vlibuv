module vuv

fn C.uv_stream_get_write_queue_size(const_stream &C.uv_stream_t) usize

// pub fn stream_get_write_queue_size(const_stream &C.uv_stream_t) usize {
// 	return C.uv_stream_get_write_queue_size(const_stream)
// }

fn C.uv_listen(stream &C.uv_stream_t, backlog int, cb Connection_cb) int

// pub fn listen(stream &C.uv_stream_t, backlog int, cb Connection_cb) int {
// 	return C.uv_listen(stream, backlog, cb)
// }

fn C.uv_accept(server &C.uv_stream_t, client &C.uv_stream_t) int

// pub fn accept(server &C.uv_stream_t, client &C.uv_stream_t) int {
// 	return C.uv_accept(server, client)
// }

fn C.uv_read_start(stream &C.uv_stream_t, alloc_cb Alloc_cb, read_cb Read_cb) int

// pub fn read_start(stream &C.uv_stream_t, alloc_cb Alloc_cb, read_cb Read_cb) int {
// 	return C.uv_read_start(stream, alloc_cb, read_cb)
// }

fn C.uv_read_stop(stream &C.uv_stream_t) int

// pub fn read_stop(stream &C.uv_stream_t) int {
// 	return C.uv_read_stop(stream)
// }

pub enum StreamType {
	tcp
	pipe
	tty
}

// stream is a subclass of handle,
// stream is a parent class of tcp, pipe, tty
pub struct Stream {
	Handle
}

// pub type Handler = C.uv_tcp_t | C.uv_pipe_t | C.uv_tty_t

@[typedef]
pub struct C.uv_stream_t {
	// 	loop &C.uv_loop_t
	// pub mut:
	// 	write_queue_size usize
	// 	alloc_cb         Alloc_cb
	// 	read_cb          Read_cb
	// 	data             voidptr
}

pub fn (s Stream) listen(backlog int, callback fn (stream Stream, status int)) !int {
	// return error_checker(C.uv_listen(s.to_stream(), backlog, callback))
	return error_checker(C.uv_listen(s.to_stream(), backlog, fn [callback] (stream &C.uv_stream_t, status int) {
		callback(Stream{Handle{stream}}, status)
	}))
}

pub fn (s Stream) accept(client &Stream) !int {
	return error_checker(C.uv_accept(s.to_stream(), client.to_stream()))
}

pub fn (s Stream) read_start(alloc_cb fn (handle &C.uv_handle_t, suggested_size usize, buf &C.uv_buf_t), read_cb fn (stream Stream, nread isize, buf &C.uv_buf_t)) !int {
	callback := fn [read_cb] (stream &C.uv_stream_t, nread isize, buf &C.uv_buf_t) {
		read_cb(Stream{Handle{stream}}, nread, buf)
	}
	return error_checker(C.uv_read_start(s.to_stream(), alloc_cb, callback))
}

pub fn (s Stream) read_stop() int {
	return C.uv_read_stop(s.to_stream())
}

pub fn (s Stream) write(buf &C.uv_buf_t, nbufs usize, callback fn (write_req &C.uv_write_t, status int)) {
	write_req := &C.uv_write_t{}
	C.uv_write(write_req, s.to_stream(), buf, nbufs, callback)
}

pub fn (s Stream) write_client(resp string, callback fn (write_req &C.uv_write_t, status int)) {
	write_req := &C.uv_write_t{}
	buf := buf_init(resp.str, usize(resp.len))
	C.uv_write(write_req, s.to_stream(), &buf, 1, callback)
}

pub fn (s Stream) is_readable() bool {
	return C.uv_is_readable(s.to_stream()) == 1
}

pub fn (s Stream) is_writable() bool {
	return C.uv_is_writable(s.to_stream()) == 1
}

pub fn (s Stream) set_blocking(blocking bool) {
	C.uv_stream_set_blocking(s.to_stream(), bool_to_int(blocking))
}

// pub fn listen_refl[T]() {
// 	$for field in T.fields {
// 		println(field)
// 	}
// }

pub fn (s Stream) to_stream() &C.uv_stream_t {
	unsafe {
		return &C.uv_stream_t(s.handle)
	}
}

@[inline]
pub fn to_stream(ptr voidptr) &C.uv_stream_t {
	unsafe {
		return &C.uv_stream_t(ptr)
	}
	// return &C.uv_stream_t(ptr)
}
