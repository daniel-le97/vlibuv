module vuv

// check functions

fn C.uv_check_init(loop &C.uv_loop_t, handle &C.uv_check_t) int
fn C.uv_check_start(handle &C.uv_check_t, cb fn (handle &C.uv_check_t)) int
fn C.uv_check_stop(handle &C.uv_check_t) int

pub struct Check {
	Handle
}

pub fn check_init(l &Loop) Check {
	c := &C.uv_check_t{}
	C.uv_check_init(l.loop, c)
	return Check{Handle{c}}
}

pub fn (c Check) start(callback fn (handle &C.uv_check_t)) !int {
	r := C.uv_check_start(c.handle, callback)
	return error_checker(r)
}

pub fn (c Check) stop() !int {
	r := C.uv_check_stop(c.handle)
	return error_checker(r)
}
