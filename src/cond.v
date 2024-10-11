module vlibuv

// condition functions

fn C.uv_cond_init(handle &C.uv_cond_t) int
fn C.uv_cond_destroy(handle &C.uv_cond_t)
fn C.uv_cond_signal(handle &C.uv_cond_t)
fn C.uv_cond_broadcast(handle &C.uv_cond_t)
fn C.uv_cond_wait(handle &C.uv_cond_t, mutex &C.uv_mutex_t)
fn C.uv_cond_timedwait(handle &C.uv_cond_t, mutex &C.uv_mutex_t, timeout u64)

struct Condition {
	cond &C.uv_cond_t
}

pub fn cond_init() Condition {
	c := &C.uv_cond_t{}
	C.uv_cond_init(c)
	return Condition{c}
}

pub fn (c &Condition) destroy() {
	C.uv_cond_destroy(c.cond)
}

pub fn (c &Condition) wait(m Mutex) {
	C.uv_cond_wait(c.cond, m.mutex)
}

pub fn (c &Condition) signal() {
	C.uv_cond_signal(c.cond)
}

pub fn (c &Condition) broadcast() {
	C.uv_cond_broadcast(c.cond)
}

pub fn (c &Condition) timed_wait(m Mutex, timeout u64) {
	C.uv_cond_timedwait(c.cond, m.mutex, timeout)
}
