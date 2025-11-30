module vlibuv

import vlibuv.uv

@[heap]
pub struct Loop {
mut:
	loop       &uv.Uv_loop_t
	is_default bool
	owned      bool
}

// Create a new loop that V owns
pub fn Loop.new() !&Loop {
	loop := &uv.Uv_loop_t{}
	if isnil(loop) {
		return error('failed to create new loop')
	}
	result := uv.loop_init(loop)
	if result < 0 {
		return error('failed to initialize loop')
	}
	return &Loop{loop, false, true}
}

// Get the default loop (V does not own this)
pub fn Loop.default() &Loop {
	loop := uv.default_loop()
	return &Loop{loop, true, false}
}

// V's GC will call this automatically when loop goes out of scope
pub fn (mut l Loop) free() {
	if !isnil(l.loop) && l.owned {
		uv.loop_close(l.loop)
		unsafe {
			free(l.loop)
			l.loop = nil
		}
	}
}

// Manually close the loop (optional - free() will be called automatically)
pub fn (mut l Loop) close() ! {
	if !isnil(l.loop) && l.owned {
		result := uv.loop_close(l.loop)
		if result < 0 {
			return error('failed to close loop')
		}
		unsafe {
			free(l.loop)
			l.loop = nil
		}
	}
}

pub fn (l Loop) get_data[T]() ?T {
	if isnil(l.loop) {
		return none
	}
	data := uv.loop_get_data(l.loop)
	if isnil(data) {
		return none
	}
	return unsafe { *(&T(data)) }
}

pub fn (l Loop) set_data(data voidptr) ! {
	if isnil(l.loop) {
		return error('loop is nil')
	}
	uv.loop_set_data(l.loop, data)
}

pub fn (l Loop) run(mode uv.Mode) !int {
	if isnil(l.loop) {
		return error('loop is nil')
	}
	result := uv.run(l.loop, mode)
	if result < 0 {
		return error_checker(result)
	}
	return result
}

pub fn (l Loop) stop() {
	if !isnil(l.loop) {
		uv.stop(l.loop)
	}
}

pub fn (l Loop) now() !u64 {
	if isnil(l.loop) {
		return error('loop is nil')
	}
	return uv.now(l.loop)
}

pub fn (l Loop) alive() bool {
	if isnil(l.loop) {
		return false
	}
	return uv.loop_alive(l.loop) == 1
}

pub fn (l Loop) backend_fd() !int {
	if isnil(l.loop) {
		return error('loop is nil')
	}
	fd := uv.backend_fd(l.loop)
	if fd < 0 {
		return error('failed to get backend fd')
	}
	return fd
}

pub fn (l Loop) backend_timeout() !int {
	if isnil(l.loop) {
		return error('loop is nil')
	}
	timeout := uv.backend_timeout(l.loop)
	if timeout < 0 {
		return error('failed to get backend timeout')
	}
	return timeout
}

pub fn (l Loop) get_c_loop() &uv.Uv_loop_t {
	return l.loop
}

// ============================================================================

pub fn now(l Loop) !u64 {
	if isnil(l.loop) {
		return error('loop is nil')
	}
	return uv.now(l.loop)
}

pub fn stop(l Loop) {
	if !isnil(l.loop) {
		uv.stop(l.loop)
	}
}

pub fn backend_fd(l Loop) !int {
	if isnil(l.loop) {
		return error('loop is nil')
	}
	fd := uv.backend_fd(l.loop)
	if fd < 0 {
		return error('failed to get backend fd')
	}
	return fd
}

pub fn backend_timeout(l Loop) !int {
	if isnil(l.loop) {
		return error('loop is nil')
	}
	timeout := uv.backend_timeout(l.loop)
	if timeout < 0 {
		return error('failed to get backend timeout')
	}
	return timeout
}
