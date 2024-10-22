module vlibuv

// import os




struct Fs {
	Handle
}

pub fn fs_init(l &Loop) Fs {
	f := &C.uv_fs_t{}
	return Fs{Handle{f}}
}

// pub fn (f Fs) open(path string, flags int, mode int, callback fn (req &C.uv_fs_t)) {
// 	C.uv_fs_open(f.get_loop().loop, f.handle, path.str, flags, mode, callback)
// 	// return error_checker(r)
// }
