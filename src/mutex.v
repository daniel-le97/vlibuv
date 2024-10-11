module vlibuv

// mutex functions

fn C.uv_mutex_init(handle &C.uv_mutex_t) int
fn C.uv_mutex_init_recursive(handle &C.uv_mutex_t) int
fn C.uv_mutex_destroy(handle &C.uv_mutex_t)
fn C.uv_mutex_lock(handle &C.uv_mutex_t)
fn C.uv_mutex_trylock(handle &C.uv_mutex_t) int
fn C.uv_mutex_unlock(handle &C.uv_mutex_t)

struct Mutex {
	mutex &C.uv_mutex_t
}

pub fn mutex_init() Mutex {
	m := &C.uv_mutex_t{}
	C.uv_mutex_init(m)
	return Mutex{m}
}

pub fn mutex_init_recursive() Mutex {
	m := &C.uv_mutex_t{}
	C.uv_mutex_init_recursive(m)
	return Mutex{m}
}

pub fn (m &Mutex) destroy() {
	C.uv_mutex_destroy(m.mutex)
}

// lock is a reserved word in V, @ before a reserved word escapes it,
pub fn (m &Mutex) @lock() {
	C.uv_mutex_lock(m.mutex)
}

pub fn (m &Mutex) trylock() {
	C.uv_mutex_trylock(m.mutex)
}

pub fn (m &Mutex) unlock() {
	C.uv_mutex_unlock(m.mutex)
}
