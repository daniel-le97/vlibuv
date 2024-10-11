module vuv

// key functions

fn C.uv_key_create(key &C.uv_key_t) int
fn C.uv_key_delete(key &C.uv_key_t)
fn C.uv_key_get(key &C.uv_key_t) voidptr
fn C.uv_key_set(key &C.uv_key_t, value voidptr)

// // key struct

// pub struct Key {
// 	key &C.uv_key_t
// }

// pub fn key_init() Key {
// 	k := &C.uv_key_t{}
// 	C.uv_key_create(k)
// 	return Key{k}
// }

// pub fn (k &Key) delete() {
// 	C.uv_key_delete(k.key)
// }
// pub fn (k &Key) set(value voidptr) {
// 	C.uv_key_set(k.key, value)
// }
// pub fn (k &Key) get[T]() &T {
// 	return C.uv_key_get(k.key)
// }
