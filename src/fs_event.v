module vlibuv

import vlibuv.uv
// High-level event type for users

pub enum WatchEvent {
	rename = 1
	change = 2
}

pub struct Watcher {
pub mut:
	handle &uv.Uv_fs_event_t
mut:
	path    string
	stopped bool
}

pub fn new_watcher(loop Loop) !Watcher {
	return Watcher.new(loop)
}

// Create a new filesystem event watcher
pub fn Watcher.new(loop Loop) !Watcher {
	c_loop := loop.get_c_loop()
	if isnil(c_loop) {
		return error('loop is nil')
	}

	handle := &uv.Uv_fs_event_t{}
	result := C.uv_fs_event_init(c_loop, handle)
	if result < 0 {
		unsafe { free(handle) }
		return error('failed to initialize fs_event')
	}

	return Watcher{handle, '', false}
}

// Start watching a path for filesystem events
pub fn (mut f Watcher) start(path string, flags int, callback fn (path string, events []WatchEvent)) ! {
	if isnil(f.handle) || f.stopped {
		return error('fs_event is invalid or stopped')
	}

	f.path = path

	// Wrap C callback to call V callback
	c_callback := fn [callback] (handle &uv.Uv_fs_event_t, const_filename &char, events int, status int) {
		if status < 0 {
			// Handle error if needed
			return
		}
		// Parse events into V enum
		mut event_types := []WatchEvent{}
		if events & 1 != 0 {
			event_types << .rename
		}
		if events & 2 != 0 {
			event_types << .change
		}

		// Convert C filename to V string
		filename := if isnil(const_filename) {
			''
		} else {
			unsafe { cstring_to_vstring(const_filename) }
		}

		callback(filename, event_types)
	}

	result := C.uv_fs_event_start(f.handle, c_callback, charptr(path.str), flags)
	if result < 0 {
		return error('failed to start fs_event')
	}
}

// Stop watching the filesystem
pub fn (mut f Watcher) stop() ! {
	if isnil(f.handle) || f.stopped {
		return error('fs_event is invalid or stopped')
	}

	result := C.uv_fs_event_stop(f.handle)
	if result < 0 {
		return error('failed to stop fs_event')
	}

	f.stopped = true
}

// Get the watched path
pub fn (f Watcher) get_path() !string {
	if isnil(f.handle) {
		return error('fs_event is nil')
	}

	mut buf := [4096]char{}
	mut size := usize(4096)

	result := C.uv_fs_event_getpath(f.handle, unsafe { &buf[0] }, &size)
	if result < 0 {
		return error('failed to get fs_event path')
	}

	unsafe {
		return cstring_to_vstring(&buf[0])
	}
}

// Destructor - automatic cleanup
@[unsafe]
pub fn (mut f Watcher) free() {
	if !isnil(f.handle) && !f.stopped {
		C.uv_fs_event_stop(f.handle)
		f.stopped = true
	}
}
