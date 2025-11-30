module vlibuv

import vlibuv.uv
// // mutex functions

// fn uv.mutex_init(handle &uv.Uv_mutex_t) int
// fn uv.mutex_init_recursive(handle &uv.Uv_mutex_t) int
// fn uv.mutex_destroy(handle &uv.Uv_mutex_t)
// fn uv.mutex_lock(handle &uv.Uv_mutex_t)
// fn uv.Uv_mutex_trylock(handle &uv.Uv_mutex_t) int
// fn uv.mutex_unlock(handle &uv.Uv_mutex_t)

struct Mutex {
	mutex &uv.Uv_mutex_t
}

pub fn Mutex.new() Mutex {
	return new_mutex()
}

pub fn Mutex.new_recursive() Mutex {
	return new_mutex_recursive()
}

pub fn new_mutex() Mutex {
	m := &uv.Uv_mutex_t{}
	uv.mutex_init(m)
	return Mutex{m}
}

pub fn new_mutex_recursive() Mutex {
	m := &uv.Uv_mutex_t{}
	uv.mutex_init_recursive(m)
	return Mutex{m}
}

pub fn (m &Mutex) destroy() {
	uv.mutex_destroy(m.mutex)
}

// lock is a reserved word in V, @ before a reserved word escapes it,
pub fn (m &Mutex) @lock() {
	uv.mutex_lock(m.mutex)
}

pub fn (m &Mutex) trylock() {
	uv.mutex_trylock(m.mutex)
}

pub fn (m &Mutex) unlock() {
	uv.mutex_unlock(m.mutex)
}
