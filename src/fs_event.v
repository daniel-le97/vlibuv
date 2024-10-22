module vlibuv

// fs event functions

fn C.uv_fs_event_init(loop &C.uv_loop_t, handle &C.uv_fs_event_t) int
fn C.uv_fs_event_start(handle &C.uv_fs_event_t, cb fn (handle &C.uv_fs_event_t, const_filename &char, events int, status int), const_path &char, flags int) int
fn C.uv_fs_event_stop(handle &C.uv_fs_event_t) int
fn C.uv_fs_event_getpath(handle &C.uv_fs_event_t, path &char, size &usize) int

// pub struct FsEvent {
// 	Handle
// }

// pub fn fs_event_init(l &Loop) FsEvent {
// 	f := &C.uv_fs_event_t{}
// 	C.uv_fs_event_init(l.loop, f)
// 	return FsEvent{Handle{f}}
// }

// pub fn (f FsEvent) start(path string, flags int, callback fn (handle FsEvent, filename &char, events int, status int)) !int {
// 	cb := fn [callback] (handle &C.uv_fs_event_t, filename &char, events int, status int) {
// 		unsafe {
// 			callback(FsEvent{Handle{handle}}, filename, events, status)
// 		}
// 	}
// 	r := C.uv_fs_event_start(f.handle, cb, charptr(path.str), flags)
// 	return error_checker(r)
// }

// pub fn (f FsEvent) stop() !int {
// 	r := C.uv_fs_event_stop(f.handle)
// 	return error_checker(r)
// }

// pub fn (f FsEvent) getpath() string {
// 	buf, size := new_buffer(path_max)
// 	C.uv_fs_event_getpath(f.handle, buf, &size)
// 	unsafe {
// 		return cstring_to_vstring(buf)
// 	}
// }
