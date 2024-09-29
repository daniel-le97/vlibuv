module vuv

fn init() {
	// im not sure if vcalloc is implemented right, i dont normally do manual memory management
	C.uv_replace_allocator(malloc, v_realloc, fn (count usize, size usize) &u8 {
		return vcalloc(isize(size))
	}, free)
}
