module vlibuv
import vlibuv.uv

// fn uv.timer_init(loop &uv.loop_t, handle &uv.Uv_timer_t) int
// fn uv.timer_start(handle &uv.Uv_timer_t, cb fn (handle &uv.Uv_timer_t), timeout u64, repeat u64) int
// fn uv.timer_stop(handle &uv.Uv_timer_t) int
// fn uv.timer_again(handle &uv.Uv_timer_t) int
// fn uv.timer_set_repeat(handle &uv.Uv_timer_t, repeat u64)
// fn uv.timer_get_repeat(handle &uv.Uv_timer_t) u64
// fn uv.timer_get_due_in(const_handle &uv.Uv_timer_t) u64

// @[typedef]
// pub struct uv.Uv_timer_t {
// }

pub struct Timer {
pub mut:
	handle &uv.Uv_timer_t
mut:
	stopped bool
}

// Create a new timer
pub fn Timer.new(loop Loop) !Timer {
	c_loop := loop.get_c_loop()
	if isnil(c_loop) {
		return error('loop is nil')
	}

	handle := unsafe { malloc(sizeof(uv.Uv_timer_t)) }
	if isnil(handle) {
		return error('failed to allocate timer')
	}

	timer_handle := unsafe { &uv.Uv_timer_t(handle) }
	result := uv.timer_init(c_loop, timer_handle)
	if result < 0 {
		unsafe { free(handle) }
		return error('failed to initialize timer')
	}

	return Timer{timer_handle, false}
}

pub fn new_timer(loop Loop) !Timer {
	return Timer.new(loop)
}

pub fn (mut t Timer) start(timeout u64, repeat u64, callback fn(timer Timer)) ! {
	if isnil(t.handle) || t.stopped {
		return error('timer is invalid or stopped')
	}

	cb := fn [callback, t] (handle &uv.Uv_timer_t) {
		callback(Timer{
			handle: unsafe { handle }
			stopped: t.stopped
		})
	}

	result := uv.timer_start(t.handle, cb, timeout, repeat)
	if result < 0 {
		return error('failed to start timer')
	}
}

pub fn (mut t Timer) stop() ! {
	if isnil(t.handle) || t.stopped {
		return error('timer is invalid or stopped')
	}

	result := uv.timer_stop(t.handle)
	if result < 0 {
		return error('failed to stop timer')
	}
	t.stopped = true
}

pub fn (t Timer) again() ! {
	if isnil(t.handle) || t.stopped {
		return error('timer is invalid or stopped')
	}
	result := uv.timer_again(t.handle)
	if result < 0 {
		return error('failed to retry timer')
	}
}

pub fn (t Timer) set_repeat(repeat u64) ! {
	if isnil(t.handle) {
		return error('timer is nil')
	}
	uv.timer_set_repeat(t.handle, repeat)
}

pub fn (t Timer) get_repeat() !u64 {
	if isnil(t.handle) {
		return error('timer is nil')
	}
	return uv.timer_get_repeat(t.handle)
}

pub fn (t Timer) get_due_in() !u64 {
	if isnil(t.handle) {
		return error('timer is nil')
	}
	return uv.timer_get_due_in(t.handle)
}

@[unsafe]
pub fn (mut t Timer) free() {
	if !isnil(t.handle) && !t.stopped {
		uv.timer_stop(t.handle)
		t.stopped = true
	}
}
