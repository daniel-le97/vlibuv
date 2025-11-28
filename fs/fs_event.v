module fs

import vlibuv.uv
import vlibuv

// High-level event type for users
pub enum EventType {
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

pub enum WatcherType {
	poll
	event
}

pub type Looper = uv.Uv_loop_t | vlibuv.Loop

pub fn new_watcher(loop Looper, watcher_type WatcherType) !Watcher {
	$if watcher_type.event {
		$if loop is &uv.Uv_loop_t {
			return Watcher.new(loop)
		} $else $if loop is &vlibuv.Loop {
			c_loop := loop.get_c_loop()!
			return Watcher.new(c_loop)
		} $else {
			return error('invalid loop type')
		}
	} $else $if watcher_type.poll {
		
		return error('fs_poll watcher type is not implemented in this function')
	} $else {
		return error('invalid watcher type')
	}
}

// Create a new filesystem event watcher
pub fn Watcher.new(loop &uv.Uv_loop_t) !Watcher {
	if isnil(loop) {
		return error('loop is nil')
	}

	handle := uv.Uv_fs_event_t{}
	fs_event_handle := unsafe { &uv.Uv_fs_event_t(handle) }

	result := uv.fs_event_init(loop, fs_event_handle)
	if result < 0 {
		unsafe { free(handle) }
		return error('failed to initialize fs_event')
	}

	return Watcher{fs_event_handle, '', false}
}

// Start watching a path for filesystem events
pub fn (mut f Watcher) start(path string, flags int, callback fn (path string, events []EventType, status int)) ! {
	if isnil(f.handle) || f.stopped {
		return error('fs_event is invalid or stopped')
	}

	f.path = path

	// Wrap C callback to call V callback
	c_callback := fn [callback] (handle &uv.Uv_fs_event_t, const_filename &char, events int, status int) {
		// Parse events into V enum
		mut event_types := []EventType{}
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

		callback(filename, event_types, status)
	}

	result := uv.fs_event_start(f.handle, c_callback, charptr(path.str), flags)
	if result < 0 {
		return error('failed to start fs_event')
	}
}

// Stop watching the filesystem
pub fn (mut f Watcher) stop() ! {
	if isnil(f.handle) || f.stopped {
		return error('fs_event is invalid or stopped')
	}

	result := uv.fs_event_stop(f.handle)
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

	result := uv.fs_event_getpath(f.handle, unsafe { &buf[0] }, &size)
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
		uv.fs_event_stop(f.handle)
		f.stopped = true
	}
}
