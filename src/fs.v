module vuv

// import os

struct Fs {
	Handle
}

pub fn fs_init(l &Loop) Fs {
	f := &C.uv_fs_t{}
	return Fs{Handle{f}}
}

// pub fn (f Fs) open(path string, flags int, mode int, callback fn (req &C.uv_fs_t)) !int {
// 	r := C.uv_fs_open(f.loop, f.handle, path.str, flags, mode, callback)
// 	return error_checker(r)
// }
