module vlibuv

import vlibuv.uv
// // check functions

// fn uv.check_init(loop &uv.loop_t, handle &uv.Uv_check_t) int
// fn uv.check_start(handle &uv.Uv_check_t, cb fn (handle &uv.Uv_check_t)) int
// fn uv.check_stop(handle &uv.Uv_check_t) int

pub struct Check {
pub mut:
	handle &uv.Uv_check_t
}

pub fn Check.new(l &Loop) Check {
	return new_check(l)
}

pub fn new_check(l &Loop) Check {
	c := &uv.Uv_check_t{}
	uv.check_init(l.loop, c)
	return Check{c}
}

pub fn (c Check) start(callback fn (check Check)) !int {
	c_callback := fn [callback, c] (handle &uv.Uv_check_t) {
		callback(c)
	}
	r := uv.check_start(c.handle, c_callback)
	return error_checker(r)
}

pub fn (c Check) stop() !int {
	r := uv.check_stop(c.handle)
	return error_checker(r)
}

pub fn (c &Check) raw() &uv.Uv_check_t {
	return c.handle
}
