module main

fn init() {
	// im not sure if vcalloc is implemented right, i dont normally do manual memory management
	C.uv_replace_allocator(malloc, v_realloc, fn (count isize, size isize) &u8 {
		return vcalloc(size)
	}, free)
}
