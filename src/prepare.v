module vlibuv

// prepare functions

fn C.uv_prepare_init(loop &C.uv_loop_t, handle &C.uv_prepare_t) int
fn C.uv_prepare_start(handle &C.uv_prepare_t, cb fn (handle &C.uv_prepare_t)) int
fn C.uv_prepare_stop(handle &C.uv_prepare_t) int

pub struct Prepare {
	Handle
}

pub fn prepare_init(l &Loop) Prepare {
	p := &C.uv_prepare_t{}
	C.uv_prepare_init(l.loop, p)
	return Prepare{Handle{p}}
}

pub fn (p Prepare) start(callback fn (handle &C.uv_prepare_t)) !int {
	r := C.uv_prepare_start(p.handle, callback)
	return error_checker(r)
}

pub fn (p Prepare) stop() !int {
	r := C.uv_prepare_stop(p.handle)
	return error_checker(r)
}
