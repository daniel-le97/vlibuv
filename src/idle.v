module vlibuv

// // idle functions

// fn C.uv_idle_init(loop &C.uv_loop_t, handle &C.uv_idle_t) int
// fn C.uv_idle_start(handle &C.uv_idle_t, cb fn (handle &C.uv_idle_t)) int
// fn C.uv_idle_stop(handle &C.uv_idle_t) int

// pub struct Idle {
// pub mut:
// 	handle &C.uv_idle_t
// }

// pub fn idle_init(l &Loop) Idle {
// 	i := &C.uv_idle_t{}
// 	C.uv_idle_init(l.loop, i)
// 	return Idle{i}
// }

// pub fn (i Idle) start(callback fn (handle &C.uv_idle_t)) !int {
// 	r := C.uv_idle_start(i.handle, callback)
// 	return error_checker(r)
// }

// pub fn (i Idle) stop() !int {
// 	r := C.uv_idle_stop(i.handle)
// 	return error_checker(r)
// }
