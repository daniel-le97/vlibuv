module vlibuv

import vlibuv.uv

pub struct Fs {
pub mut:
	handle &uv.Uv_fs_t
	loop   uv.Uv_loop_t
}

// pub fn fs_init(l &Loop) Fs {
// 	f := &uv.Uv_fs_t{}

// 	return Fs{f, l}
// }

pub fn new_fs(l uv.Uv_loop_t) Fs {
	f := &uv.Uv_fs_t{}

	return Fs{f, l}
}

fn (f Fs) open(path string, open_cb fn (req Fs)) ! {
	flags := 0
	mode := 0
	uv.fs_open(f.loop, f.handle, path.str, flags, mode, fn [f, open_cb] (req &uv.Uv_fs_t) {
		open_cb(f)
	})
	return error('')
}

// fs helper functions

pub fn fs_get_type(const_fs &uv.Uv_fs_t) uv.Uv_fs_type {
	unsafe {
		return uv.Uv_fs_type(uv.fs_get_type(const_fs))
	}
}

pub fn fs_get_result(const_fs &uv.Uv_fs_t) int {
	return uv.fs_get_result(const_fs)
}

pub fn fs_get_system_error(const_fs &uv.Uv_fs_t) int {
	return uv.fs_get_system_error(const_fs)
}

pub fn fs_get_ptr(const_fs &uv.Uv_fs_t) &voidptr {
	return uv.fs_get_ptr(const_fs)
}

pub fn fs_get_path(const_fs &uv.Uv_fs_t) string {
	unsafe {
		return cstring_to_vstring(uv.fs_get_path(const_fs).str)
	}
}

pub fn fs_get_statbuf(fs_handle &uv.Uv_fs_t) &uv.Uv_stat_t {
	return uv.fs_get_statbuf(fs_handle)
}

pub fn fs_req_cleanup(fs &uv.Uv_fs_t) {
	uv.fs_req_cleanup(fs)
}

pub fn fs_close(loop &uv.Uv_loop_t, req &uv.Uv_fs_t, file int, cb fn (req &uv.Uv_fs_t)) {
	uv.fs_close(loop, req, file, cb)
}

pub fn fs_open(loop &uv.Uv_loop_t, req &uv.Uv_fs_t, path &char, flags int, mode int, cb fn (req &uv.Uv_fs_t)) {
	uv.fs_open(loop, req, path, flags, mode, cb)
}

pub fn fs_read(loop &uv.Uv_loop_t, req &uv.Uv_fs_t, file int, bufs &uv.Uv_buf_t, nbufs u32, offset i64, cb fn (req &uv.Uv_fs_t)) {
	uv.fs_read(loop, req, file, bufs, nbufs, offset, cb)
}

pub fn fs_unlink(loop &uv.Uv_loop_t, req &uv.Uv_fs_t, path &char, cb fn (req &uv.Uv_fs_t)) {
	uv.fs_unlink(loop, req, path, cb)
}

pub fn fs_write(loop &uv.Uv_loop_t, req &uv.Uv_fs_t, file int, bufs &uv.Uv_buf_t, nbufs u32, offset i64, cb fn (req &uv.Uv_fs_t)) {
	uv.fs_write(loop, req, file, bufs, nbufs, offset, cb)
}

// --------

pub fn fs_copyfile(loop &uv.Uv_loop_t, req &uv.Uv_fs_t, const_path &char, const_new_path &char, flags int, cb fn (req &uv.Uv_fs_t)) int {
	return uv.fs_copyfile(loop, req, const_path, const_new_path, flags, cb)
}

pub fn fs_mkdir(loop &uv.Uv_loop_t, req &uv.Uv_fs_t, path &char, mode int, cb fn (req &uv.Uv_fs_t)) {
	uv.fs_mkdir(loop, req, path, mode, cb)
}

pub fn fs_mkdtemp(loop &uv.Uv_loop_t, req &uv.Uv_fs_t, const_tpl &char, cb fn (req &uv.Uv_fs_t)) int {
	return uv.fs_mkdtemp(loop, req, const_tpl, cb)
}

pub fn fs_mkstemp(loop &uv.Uv_loop_t, req &uv.Uv_fs_t, const_tpl &char, flags int, cb fn (req &uv.Uv_fs_t)) {
	uv.fs_mkstemp(loop, req, const_tpl, flags, cb)
}

pub fn fs_rmdir(loop &uv.Uv_loop_t, req &uv.Uv_fs_t, path &char, cb fn (req &uv.Uv_fs_t)) {
	uv.fs_rmdir(loop, req, path, cb)
}

pub fn fs_scandir(loop &uv.Uv_loop_t, req &uv.Uv_fs_t, path &char, flags int, cb fn (req &uv.Uv_fs_t)) {
	uv.fs_scandir(loop, req, path, flags, cb)
}

pub fn fs_scandir_next(req &uv.Uv_fs_t, ent &uv.Uv_dirent_t) int {
	return uv.fs_scandir_next(req, ent)
}

pub fn fs_opendir(loop &uv.Uv_loop_t, req &uv.Uv_fs_t, const_path &char, cb fn (req &uv.Uv_fs_t)) int {
	return uv.fs_opendir(loop, req, const_path, cb)
}

pub fn fs_readdir(loop &uv.Uv_loop_t, req &uv.Uv_fs_t, dir &uv.Uv_dir_t, cb fn (req &uv.Uv_fs_t)) int {
	return uv.fs_readdir(loop, req, dir, cb)
}

pub fn fs_closedir(loop &uv.Uv_loop_t, req &uv.Uv_fs_t, dir &uv.Uv_dir_t, cb fn (req &uv.Uv_fs_t)) int {
	return uv.fs_closedir(loop, req, dir, cb)
}

pub fn fs_stat(loop &uv.Uv_loop_t, req &uv.Uv_fs_t, path &char, cb fn (req &uv.Uv_fs_t)) {
	uv.fs_stat(loop, req, path, cb)
}

pub fn fs_fstat(loop &uv.Uv_loop_t, req &uv.Uv_fs_t, file int, cb fn (req &uv.Uv_fs_t)) {
	uv.fs_fstat(loop, req, file, cb)
}

pub fn fs_rename(loop &uv.Uv_loop_t, req &uv.Uv_fs_t, const_path &char, const_new_path &char, cb fn (req &uv.Uv_fs_t)) {
	uv.fs_rename(loop, req, const_path, const_new_path, cb)
}

pub fn fs_fsync(loop &uv.Uv_loop_t, req &uv.Uv_fs_t, file int, cb fn (req &uv.Uv_fs_t)) {
	uv.fs_fsync(loop, req, file, cb)
}

pub fn fs_fdatasync(loop &uv.Uv_loop_t, req &uv.Uv_fs_t, file int, cb fn (req &uv.Uv_fs_t)) {
	uv.fs_fdatasync(loop, req, file, cb)
}

pub fn fs_ftruncate(loop &uv.Uv_loop_t, req &uv.Uv_fs_t, file int, offset i64, cb fn (req &uv.Uv_fs_t)) {
	uv.fs_ftruncate(loop, req, file, offset, cb)
}

pub fn fs_sendfile(loop &uv.Uv_loop_t, req &uv.Uv_fs_t, out_fd int, in_fd int, in_offset i64, length usize, cb fn (req &uv.Uv_fs_t)) {
	uv.fs_sendfile(loop, req, out_fd, in_fd, in_offset, length, cb)
}

pub fn fs_access(loop &uv.Uv_loop_t, req &uv.Uv_fs_t, const_path &char, mode int, cb fn (req &uv.Uv_fs_t)) {
	uv.fs_access(loop, req, const_path, mode, cb)
}

pub fn fs_chmod(loop &uv.Uv_loop_t, req &uv.Uv_fs_t, const_path &char, mode int, cb fn (req &uv.Uv_fs_t)) {
	uv.fs_chmod(loop, req, const_path, mode, cb)
}

pub fn fs_fchmod(loop &uv.Uv_loop_t, req &uv.Uv_fs_t, file int, mode int, cb fn (req &uv.Uv_fs_t)) {
	uv.fs_fchmod(loop, req, file, mode, cb)
}

pub fn fs_utime(loop &uv.Uv_loop_t, req &uv.Uv_fs_t, const_path &char, atime f64, mtime f64, cb fn (req &uv.Uv_fs_t)) {
	uv.fs_utime(loop, req, const_path, atime, mtime, cb)
}

pub fn fs_utime_ex(loop &uv.Uv_loop_t, req &uv.Uv_fs_t, const_path &char, btime f64, atime f64, mtime f64, cb fn (req &uv.Uv_fs_t)) int {
	$if !$d('uv_static', false) {
		return uv.fs_utime_ex(loop, req, const_path, btime, atime, mtime, cb)
	} $else {
		panic('uv_fs_utime_ex is not available in static build')
		return -1
	}
}

pub fn fs_futime(loop &uv.Uv_loop_t, req &uv.Uv_fs_t, file int, atime f64, mtime f64, cb fn (req &uv.Uv_fs_t)) {
	uv.fs_futime(loop, req, file, atime, mtime, cb)
}

// $if $d('uv_static', false) {

// }

pub fn fs_futime_ex(loop &uv.Uv_loop_t, req &uv.Uv_fs_t, file int, btime f64, atime f64, mtime f64, cb fn (req &uv.Uv_fs_t)) int {
	$if !$d('uv_static', false) {
		return uv.fs_futime_ex(loop, req, file, btime, atime, mtime, cb)
	} $else {
		panic('uv_fs_futime_ex is not available in static build')
		return -1
	}
	// return uv.fs_futime_ex(loop, req, file, btime, atime, mtime, cb)
}

pub fn fs_lutime(loop &uv.Uv_loop_t, req &uv.Uv_fs_t, const_path &char, atime f64, mtime f64, cb fn (req &uv.Uv_fs_t)) int {
	return uv.fs_lutime(loop, req, const_path, atime, mtime, cb)
}

pub fn fs_lstat(loop &uv.Uv_loop_t, req &uv.Uv_fs_t, path &char, cb fn (req &uv.Uv_fs_t)) {
	uv.fs_lstat(loop, req, path, cb)
}

pub fn fs_link(loop &uv.Uv_loop_t, req &uv.Uv_fs_t, const_path &char, const_new_path &char, cb fn (req &uv.Uv_fs_t)) {
	uv.fs_link(loop, req, const_path, const_new_path, cb)
}

pub fn fs_symlink(loop &uv.Uv_loop_t, req &uv.Uv_fs_t, const_path &char, const_new_path &char, flags int, cb fn (req &uv.Uv_fs_t)) {
	uv.fs_symlink(loop, req, const_path, const_new_path, flags, cb)
}

pub fn fs_readlink(loop &uv.Uv_loop_t, req &uv.Uv_fs_t, const_path &char, cb fn (req &uv.Uv_fs_t)) {
	uv.fs_readlink(loop, req, const_path, cb)
}

pub fn fs_realpath(loop &uv.Uv_loop_t, req &uv.Uv_fs_t, const_path &char, cb fn (req &uv.Uv_fs_t)) {
	uv.fs_realpath(loop, req, const_path, cb)
}

pub fn fs_chown(loop &uv.Uv_loop_t, req &uv.Uv_fs_t, const_path &char, uid usize, gid usize, cb fn (req &uv.Uv_fs_t)) {
	uv.fs_chown(loop, req, const_path, uid, gid, cb)
}

pub fn fs_fchown(loop &uv.Uv_loop_t, req &uv.Uv_fs_t, file int, uid usize, gid usize, cb fn (req &uv.Uv_fs_t)) {
	uv.fs_fchown(loop, req, file, uid, gid, cb)
}

pub fn fs_lchown(loop &uv.Uv_loop_t, req &uv.Uv_fs_t, const_path &char, uid usize, gid usize, cb fn (req &uv.Uv_fs_t)) int {
	return uv.fs_lchown(loop, req, const_path, uid, gid, cb)
}

pub fn fs_statfs(loop &uv.Uv_loop_t, req &uv.Uv_fs_t, const_path &char, cb fn (req &uv.Uv_fs_t)) {
	uv.fs_statfs(loop, req, const_path, cb)
}

// fs poll functions

pub fn fs_poll_init(loop &uv.Uv_loop_t, handle &uv.Uv_fs_poll_t) int {
	return uv.fs_poll_init(loop, handle)
}

pub fn fs_poll_start(handle &uv.Uv_fs_poll_t, cb fn (handle &uv.Uv_fs_poll_t, status int, const_prev &uv.Uv_stat_t, const_curr &uv.Uv_stat_t), const_path &char, interval usize) int {
	return uv.fs_poll_start(handle, cb, const_path, interval)
}

pub fn fs_poll_stop(handle &uv.Uv_fs_poll_t) int {
	return uv.fs_poll_stop(handle)
}

pub fn fs_poll_getpath(handle &uv.Uv_fs_poll_t, path &char, size &usize) int {
	return uv.fs_poll_getpath(handle, path, size)
}

// fs event functions

pub fn fs_event_init(loop &uv.Uv_loop_t, handle &uv.Uv_fs_event_t) int {
	return uv.fs_event_init(loop, handle)
}

pub fn fs_event_start(handle &uv.Uv_fs_event_t, cb fn (handle &uv.Uv_fs_event_t, const_filename &char, events int, status int), const_path &char, flags int) int {
	return uv.fs_event_start(handle, cb, const_path, flags)
}

pub fn fs_event_stop(handle &uv.Uv_fs_event_t) int {
	return uv.fs_event_stop(handle)
}

pub fn fs_event_getpath(handle &uv.Uv_fs_event_t, path &char, size &usize) int {
	return uv.fs_event_getpath(handle, path, size)
}
