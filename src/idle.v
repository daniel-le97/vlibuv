module vlibuv

import vlibuv.uv
// // idle functions

// fn uv.idle_init(loop &uv.loop_t, handle &uv.Uv_idle_t) int
// fn uv.idle_start(handle &uv.Uv_idle_t, cb fn (handle &uv.Uv_idle_t)) int
// fn uv.idle_stop(handle &uv.Uv_idle_t) int

pub struct Idle {
pub mut:
	handle &uv.Uv_idle_t
}

pub fn Idle.new(l &Loop) Idle {
	return new_idle(l)
}

pub fn new_idle(l &Loop) Idle {
	i := &uv.Uv_idle_t{}
	uv.idle_init(l.loop, i)
	return Idle{i}
}

pub fn (i Idle) start(callback fn (idle Idle)) !int {
	c_callback := fn [callback, i] (handle &uv.Uv_idle_t) {
		callback(i)
	}
	r := uv.idle_start(i.handle, c_callback)
	return error_checker(r)
}

pub fn (i Idle) stop() !int {
	r := uv.idle_stop(i.handle)
	return error_checker(r)
}
