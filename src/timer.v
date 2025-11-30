module vlibuv

// fn C.uv_timer_init(loop &C.uv_loop_t, handle &C.uv_timer_t) int
// fn C.uv_timer_start(handle &C.uv_timer_t, cb fn (handle &C.uv_timer_t), timeout u64, repeat u64) int
// fn C.uv_timer_stop(handle &C.uv_timer_t) int
// fn C.uv_timer_again(handle &C.uv_timer_t) int
// fn C.uv_timer_set_repeat(handle &C.uv_timer_t, repeat u64)
// fn C.uv_timer_get_repeat(handle &C.uv_timer_t) u64
// fn C.uv_timer_get_due_in(const_handle &C.uv_timer_t) u64

// @[typedef]
// pub struct C.uv_timer_t {
// }

// pub struct Timer {
// pub mut:
// 	handle &C.uv_timer_t
// mut:
// 	stopped bool
// }

// // Create a new timer
// pub fn Timer.new(loop Loop) !Timer {
// 	c_loop := loop.get_c_loop()
// 	if isnil(c_loop) {
// 		return error('loop is nil')
// 	}

// 	handle := unsafe { malloc(sizeof(C.uv_timer_t)) }
// 	if isnil(handle) {
// 		return error('failed to allocate timer')
// 	}

// 	timer_handle := unsafe { &C.uv_timer_t(handle) }
// 	result := C.uv_timer_init(c_loop, timer_handle)
// 	if result < 0 {
// 		unsafe { free(handle) }
// 		return error('failed to initialize timer')
// 	}

// 	return Timer{timer_handle, false}
// }

// pub fn (mut t Timer) start(timeout u64, repeat u64, callback fn()) ! {
// 	if isnil(t.handle) || t.stopped {
// 		return error('timer is invalid or stopped')
// 	}

// 	cb := fn [callback] (handle &C.uv_timer_t) {
// 		callback()
// 	}

// 	result := C.uv_timer_start(t.handle, cb, timeout, repeat)
// 	if result < 0 {
// 		return error('failed to start timer')
// 	}
// }

// pub fn (mut t Timer) stop() ! {
// 	if isnil(t.handle) || t.stopped {
// 		return error('timer is invalid or stopped')
// 	}

// 	result := C.uv_timer_stop(t.handle)
// 	if result < 0 {
// 		return error('failed to stop timer')
// 	}
// 	t.stopped = true
// }

// pub fn (t Timer) again() ! {
// 	if isnil(t.handle) || t.stopped {
// 		return error('timer is invalid or stopped')
// 	}
// 	result := C.uv_timer_again(t.handle)
// 	if result < 0 {
// 		return error('failed to retry timer')
// 	}
// }

// pub fn (t Timer) set_repeat(repeat u64) ! {
// 	if isnil(t.handle) {
// 		return error('timer is nil')
// 	}
// 	C.uv_timer_set_repeat(t.handle, repeat)
// }

// pub fn (t Timer) get_repeat() !u64 {
// 	if isnil(t.handle) {
// 		return error('timer is nil')
// 	}
// 	return C.uv_timer_get_repeat(t.handle)
// }

// pub fn (t Timer) get_due_in() !u64 {
// 	if isnil(t.handle) {
// 		return error('timer is nil')
// 	}
// 	return C.uv_timer_get_due_in(t.handle)
// }

// @[unsafe]
// pub fn (mut t Timer) free() {
// 	if !isnil(t.handle) && !t.stopped {
// 		C.uv_timer_stop(t.handle)
// 		t.stopped = true
// 	}
// }
