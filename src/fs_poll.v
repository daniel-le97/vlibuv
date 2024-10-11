module vlibuv

// fs poll functions

fn C.uv_fs_poll_init(loop &C.uv_loop_t, handle &C.uv_fs_poll_t) int
fn C.uv_fs_poll_start(handle &C.uv_fs_poll_t, cb fn (handle &C.uv_fs_poll_t, status int, prev &C.uv_stat_t, curr &C.uv_stat_t), path &char, interval u32) int
fn C.uv_fs_poll_stop(handle &C.uv_fs_poll_t) int
fn C.uv_fs_poll_getpath(handle &C.uv_fs_poll_t, path &char, size &usize) int

pub struct FsPoll {
	Handle
}

pub fn fs_poll_init(l &Loop) FsPoll {
	f := &C.uv_fs_poll_t{}
	C.uv_fs_poll_init(l.loop, f)
	return FsPoll{Handle{f}}
}

pub fn (f FsPoll) start(path string, interval u32, callback fn (handle &C.uv_fs_poll_t, status int, prev &C.uv_stat_t, curr &C.uv_stat_t)) !int {
	r := C.uv_fs_poll_start(f.handle, callback, charptr(path.str), interval)
	return error_checker(r)
}

pub fn (f FsPoll) stop() !int {
	r := C.uv_fs_poll_stop(f.handle)
	return error_checker(r)
}

pub fn (f FsPoll) getpath() string {
	buf, size := new_buffer(path_max)
	C.uv_fs_poll_getpath(f.handle, buf, &size)
	unsafe {
		return cstring_to_vstring(buf)
	}
}
