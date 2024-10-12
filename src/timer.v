module vlibuv

// timer functions

fn C.uv_timer_init(loop &C.uv_loop_t, handle &C.uv_timer_t) int
fn C.uv_timer_start(handle &C.uv_timer_t, cb fn (handle &C.uv_timer_t), timeout u64, repeat u64) int
fn C.uv_timer_stop(handle &C.uv_timer_t) int
fn C.uv_timer_again(handle &C.uv_timer_t) int
fn C.uv_timer_set_repeat(handle &C.uv_timer_t, repeat u64)
fn C.uv_timer_get_repeat(handle &C.uv_timer_t) u64
fn C.uv_timer_get_due_in(const_handle &C.uv_timer_t) u64

pub struct Timer {
	Handle
}

@[typedef]
pub struct C.uv_timer_t {
	// 	loop &C.uv_loop_t
	// pub mut:
	// 	data voidptr
}

pub fn timer_init(l &Loop) Timer {
	t := &C.uv_timer_t{}
	C.uv_timer_init(l.loop, t)

	return Timer{Handle{t}}
}

pub fn (t Timer) start(timeout u64, repeat u64, callback fn (handle Timer)) !int {
	cb := fn [callback] (handle &C.uv_timer_t) {
		callback(Timer{Handle{handle}})
	}
	r := C.uv_timer_start(t.handle, cb, timeout, repeat)
	return error_checker(r)
}

pub fn (t Timer) stop() !int {
	r := C.uv_timer_stop(t.handle)
	return error_checker(r)
}

pub fn (t Timer) again() {
	C.uv_timer_again(t.handle)
}

pub fn (t Timer) set_repeat(repeat u64) {
	C.uv_timer_set_repeat(t.handle, repeat)
}

pub fn (t Timer) get_repeat() u64 {
	return C.uv_timer_get_repeat(t.handle)
}

pub fn (t Timer) get_due_in() u64 {
	return C.uv_timer_get_due_in(t.handle)
}
