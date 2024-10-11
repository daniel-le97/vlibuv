module vlibuv

// poll functions

fn C.uv_poll_init(loop &C.uv_loop_t, handle &C.uv_poll_t, fd int) int
fn C.uv_poll_init_socket(loop &C.uv_loop_t, handle &C.uv_poll_t, socket int) int

// pub fn poll_init_socket(loop &C.uv_loop_t, handle &C.uv_poll_t, socket int) int {
// 	$if compile_static {
// 		return C.uv_poll_init_socket(loop, handle, socket)
// 	} $else {
// 		panic('uv_poll_init_socket is not available when building from source')
// 		return -1
// 	}
// }

fn C.uv_poll_start(handle &C.uv_poll_t, events int, cb fn (handle &C.uv_poll_t, status int, events int)) int
fn C.uv_poll_stop(handle &C.uv_poll_t) int

pub struct Poll {
	Handle
}

pub fn poll_init(l &Loop, fd int) Poll {
	p := &C.uv_poll_t{}
	C.uv_poll_init(l.loop, p, fd)
	return Poll{Handle{p}}
}

pub fn (p Poll) start(events int, callback fn (handle &C.uv_poll_t, status int, events int)) !int {
	r := C.uv_poll_start(p.handle, events, callback)
	return error_checker(r)
}

pub fn (p Poll) stop() !int {
	r := C.uv_poll_stop(p.handle)
	return error_checker(r)
}
