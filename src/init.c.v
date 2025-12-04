module vlibuv

// // #define GC_THREADS 2
// // patch to get http imported without errors, it provides C.addrinfo
// // import net.http as _

// // typedef void* (*uv_malloc_func)(size_t size);
// pub type Malloc_fn = fn (size isize) voidptr

// // typedef void* (*uv_realloc_func)(void* ptr, size_t size);
// pub type Realloc_fn = fn (ptr voidptr, size isize) voidptr

// // typedef void* (*uv_calloc_func)(size_t count, size_t size);
// pub type Calloc_fn = fn (count usize, size usize) voidptr

// // typedef void (*uv_free_func)(void* ptr);
// pub type Free_fn = fn (ptr voidptr) voidptr

// fn C.uv_replace_allocator(malloc Malloc_fn, realloc Realloc_fn, calloc Calloc_fn, free Free_fn) int
// pub fn replace_allocator(malloc_fn Malloc_fn, realloc_cb Realloc_fn, calloc_cb Calloc_fn, free_cb Free_fn) int {
// 	return C.uv_replace_allocator(malloc_fn, realloc_cb, calloc_cb, free_cb)
// }

// fn C.uv_setup_args(argc int, argv &&char) &&char

// pub fn setup_args(argc int, argv &&char) &&char {
// 	return C.uv_setup_args(argc, argv)
// }

// fn init() {
// 	C.uv_replace_allocator(malloc, v_realloc, calloc_fn, free)
// 	C.uv_setup_args(g_main_argc, g_main_argv)
// }

// @[inline]
// fn calloc_fn(count usize, size usize) &u8 {
// 	return vcalloc(isize(count))
// }
