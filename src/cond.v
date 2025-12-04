module vlibuv

import vlibuv.uv

// // condition functions

// fn uv.cond_init(handle &uv.Uv_cond_t) int
// fn uv.cond_destroy(handle &uv.Uv_cond_t)
// fn uv.cond_signal(handle &uv.Uv_cond_t)
// fn uv.cond_broadcast(handle &uv.Uv_cond_t)
// fn uv.cond_wait(handle &uv.Uv_cond_t, mutex &uv.mutex_t)
// fn uv.Uv_cond_timedwait(handle &uv.Uv_cond_t, mutex &uv.mutex_t, timeout u64)

pub struct Condition {
	cond &uv.Uv_cond_t
}

pub fn Condition.new() Condition {
	return new_condition()
}

pub fn new_condition() Condition {
	c := &uv.Uv_cond_t{}
	uv.cond_init(c)
	return Condition{c}
}

pub fn (c &Condition) destroy() {
	uv.cond_destroy(c.cond)
}

pub fn (c &Condition) wait(m Mutex) {
	uv.cond_wait(c.cond, m.mutex)
}

pub fn (c &Condition) signal() {
	uv.cond_signal(c.cond)
}

pub fn (c &Condition) broadcast() {
	uv.cond_broadcast(c.cond)
}

pub fn (c &Condition) timed_wait(m Mutex, timeout u64) {
	uv.cond_timedwait(c.cond, m.mutex, timeout)
}

pub fn (c &Condition) raw() &uv.Uv_cond_t {
	return c.cond
}
