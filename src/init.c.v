module vlibuv

// patch to get http imported without errors, it provides C.addrinfo
// import net.http as _

fn init() {
	// im not sure if vcalloc is implemented right, i dont normally do manual memory management
	C.uv_replace_allocator(malloc, v_realloc, calloc_fn, free)
	C.uv_setup_args(g_main_argc, g_main_argv)
}

@[inline]
fn calloc_fn(count usize, size usize) &u8 {
	return vcalloc(isize(size))
}
