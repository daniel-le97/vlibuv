module vlibuv

@[typedef]
pub struct C.uv_loop_t {
pub mut:
	data           voidptr
	active_handles usize
}

fn C.uv_default_loop() &C.uv_loop_t
fn C.uv_loop_init(loop &C.uv_loop_t) int
fn C.uv_loop_close(loop &C.uv_loop_t) int
fn C.uv_loop_new() &C.uv_loop_t
fn C.uv_loop_delete(loop &C.uv_loop_t)
fn C.uv_loop_size() usize
fn C.uv_loop_alive(const_loop &C.uv_loop_t) int
fn C.uv_loop_configure(loop &C.uv_loop_t, option int, ...voidptr) int
fn C.uv_loop_fork(loop &C.uv_loop_t) int
fn C.uv_run(loop &C.uv_loop_t, mode int) int
fn C.uv_stop(loop &C.uv_loop_t)
fn C.uv_now(const_loop &C.uv_loop_t) u64
fn C.uv_loop_get_data(const_loop &C.uv_loop_t) voidptr
fn C.uv_loop_set_data(loop &C.uv_loop_t, data voidptr)
fn C.uv_backend_fd(loop &C.uv_loop_t) int
fn C.uv_backend_timeout(loop &C.uv_loop_t) int
fn C.uv_update_time(loop &C.uv_loop_t)

pub struct Loop {
	loop &C.uv_loop_t = unsafe { nil }
	// mut:
	// 	initialized bool
}

pub fn new_loop() Loop {
	loop := &C.uv_loop_t{}
	return Loop{loop}
}

pub fn default_loop() Loop {
	loop := C.uv_default_loop()
	return Loop{loop}
}

pub fn (l &Loop) get_data[T]() &T {
	return C.uv_loop_get_data(l.loop)
}

pub fn (l &Loop) set_data(data voidptr) {
	C.uv_loop_set_data(l.loop, data)
}

pub fn (l &Loop) close() !int {
	r := C.uv_loop_close(l.loop)
	return error_checker(r)
}

pub fn (l &Loop) run(mode Mode) !int {
	// run(l.loop, mode)
	r := C.uv_run(l.loop, mode.str().int())
	return error_checker(r)
}

pub fn (l &Loop) now() u64 {
	return C.uv_now(l.loop)
}

pub fn (l &Loop) fork() {
	C.uv_loop_fork(l.loop)
}

pub fn (l &Loop) init() {
	C.uv_loop_init(l.loop)
}

pub fn (l &Loop) stop() {
	C.uv_stop(l.loop)
}

// pub fn (l &Loop) queue_work(mut w Work, work_cb fn (mut work Work), after_work_cb fn (mut work Work, status int)) {
// 	new_work_cb := fn [work_cb, mut w] (work &C.uv_work_t) {
// 		work_cb(mut w)
// 	}
// 	new_after_work_cb := fn [after_work_cb, mut w] (work &C.uv_work_t, status int) {
// 		after_work_cb(mut w, status)
// 	}
// 	C.uv_queue_work(l.loop, w.to_work(), new_work_cb, new_after_work_cb)
// }

pub fn (l &Loop) queue_work(mut w Work, work_cb fn (mut work Work), after_work_cb fn (mut work Work, status int)) {
	new_work_cb := fn [work_cb] (work &C.uv_work_t) {
		mut wrk := Work{Req{work, unsafe { nil }}}
		work_cb(mut wrk)
	}
	new_after_work_cb := fn [after_work_cb] (work &C.uv_work_t, status int) {
		mut wrk := Work{Req{work, unsafe { nil }}}
		after_work_cb(mut wrk, status)
	}
	C.uv_queue_work(l.loop, w.to_work(), new_work_cb, new_after_work_cb)
}

// pub fn (l &Loop) size() usize {
// 	return C.uv_loop_size()
// }

pub fn (l &Loop) alive() bool {
	return C.uv_loop_alive(l.loop) == 0
}

pub fn (l &Loop) configure(option Uv_loop_option, args ...voidptr) {
	C.uv_loop_configure(l.loop, option.str().int(), ...args)
}

pub fn (l &Loop) backend_fd() int {
	return C.uv_backend_fd(l.loop)
}

pub fn (l &Loop) backend_timeout() int {
	return C.uv_backend_timeout(l.loop)
}

pub fn (l &Loop) update_time() {
	C.uv_update_time(l.loop)
}
