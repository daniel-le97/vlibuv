module vlibuv

import vlibuv.uv
// // key functions

// fn uv.key_create(key &uv.Uv_key_t) int
// fn uv.key_delete(key &uv.Uv_key_t)
// fn uv.key_get(key &uv.Uv_key_t) voidptr
// fn uv.key_set(key &uv.Uv_key_t, value voidptr)

// // key struct

pub struct Key {
	key &uv.Uv_key_t
}

pub fn Key.new() Key {
	return new_key()
}

pub fn new_key() Key {
	k := &uv.Uv_key_t{}
	uv.key_create(k)
	return Key{k}
}

pub fn (k &Key) delete() {
	uv.key_delete(k.key)
}

pub fn (k &Key) set(value voidptr) {
	uv.key_set(k.key, value)
}

pub fn (k &Key) get[T]() &T {
	return uv.key_get(k.key)
}
