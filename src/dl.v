module vuv

// dl functions

// fn C.uv_dlopen(const_filename &char, lib &C.uv_lib_t) int

// pub fn dlopen(const_filename &char, lib &C.uv_lib_t) int {
// 	return C.uv_dlopen(const_filename, lib)
// }

// fn C.uv_dlclose(lib &C.uv_lib_t)

// pub fn dlclose(lib &C.uv_lib_t) {
// 	C.uv_dlclose(lib)
// }

// fn C.uv_dlsym(lib &C.uv_lib_t, const_name &char, ptr &voidptr) int

// pub fn dlsym(lib &C.uv_lib_t, const_name &char, ptr &voidptr) int {
// 	return C.uv_dlsym(lib, const_name, ptr)
// }

// fn C.uv_dlerror(const_lib &C.uv_lib_t) &char

// pub fn dlerror(const_lib &C.uv_lib_t) string {
// 	unsafe {
// 		return cstring_to_vstring(C.uv_dlerror(const_lib))
// 	}
// }

// struct Dl {
// 	lib C.uv_lib_t
// }

// pub fn dlopen(filename &string) Dl {
// 	l := &C.uv_lib_t{}
// 	C.uv_dlopen(vstring_to_cstring(filename), l)
// 	return Dl{l}
// }

// pub fn (l &Dl) close() {
// 	C.uv_dlclose(l.lib)
// }

// pub fn (l &Dl) sym(name &string) voidptr {
// 	ptr := &voidptr{}
// 	C.uv_dlsym(l.lib, vstring_to_cstring(name), ptr)
// 	return *ptr
// }
