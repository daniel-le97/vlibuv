module vlibuv

@[typedef]
pub struct C.uv_loop_t {
}

fn C.uv_default_loop() &C.uv_loop_t
fn C.uv_loop_init(loop &C.uv_loop_t) int
fn C.uv_loop_close(loop &C.uv_loop_t) int
fn C.uv_loop_new() &C.uv_loop_t
fn C.uv_loop_delete(loop &C.uv_loop_t)
fn C.uv_loop_size() usize
fn C.uv_loop_alive(const_loop &C.uv_loop_t) int
fn C.uv_loop_configure(loop &C.uv_loop_t, option int, ...voidptr) int
fn C.uv_loop_fork(loop &C.uv_loop_t) int
fn C.uv_run(loop &C.uv_loop_t, mode int) int
fn C.uv_stop(loop &C.uv_loop_t)
fn C.uv_now(const_loop &C.uv_loop_t) u64
fn C.uv_loop_get_data(const_loop &C.uv_loop_t) voidptr
fn C.uv_loop_set_data(loop &C.uv_loop_t, data voidptr)
fn C.uv_backend_fd(loop &C.uv_loop_t) int
fn C.uv_backend_timeout(loop &C.uv_loop_t) int
fn C.uv_update_time(loop &C.uv_loop_t)

pub struct Loop {
mut:
	loop       &C.uv_loop_t
	is_default bool
	owned      bool
}

// Create a new loop that V owns
pub fn Loop.new() !Loop {
	loop := C.uv_loop_new()
	if isnil(loop) {
		return error('failed to create new loop')
	}
	result := C.uv_loop_init(loop)
	if result < 0 {
		C.uv_loop_delete(loop)
		return error('failed to initialize loop')
	}
	return Loop{loop, false, true}
}

// Get the default loop (V does not own this)
pub fn Loop.default() Loop {
	loop := C.uv_default_loop()
	return Loop{loop, true, false}
}

@[unsafe]
pub fn (mut l Loop) free() {
	if !isnil(l.loop) && l.owned {
		C.uv_loop_close(l.loop)
		C.uv_loop_delete(l.loop)
		unsafe {
			l.loop = nil
		}
	}
}

pub fn (mut l Loop) close() ! {
	if !isnil(l.loop) && l.owned {
		result := C.uv_loop_close(l.loop)
		if result < 0 {
			return error('failed to close loop')
		}
		C.uv_loop_delete(l.loop)
		unsafe {
			l.loop = nil
		}
	}
}

pub fn (l Loop) get_data() ?voidptr {
	if isnil(l.loop) {
		return none
	}
	data := C.uv_loop_get_data(l.loop)
	if isnil(data) {
		return none
	}
	return data
}

pub fn (l Loop) set_data(data voidptr) ! {
	if isnil(l.loop) {
		return error('loop is nil')
	}
	C.uv_loop_set_data(l.loop, data)
}

pub fn (l Loop) run(mode Mode) !int {
	if isnil(l.loop) {
		return error('loop is nil')
	}
	result := C.uv_run(l.loop, mode.to_int())
	if result < 0 {
		return error_checker(result)
	}
	return result
}

pub fn (l Loop) stop() {
	if !isnil(l.loop) {
		C.uv_stop(l.loop)
	}
}

pub fn (l Loop) now() !u64 {
	if isnil(l.loop) {
		return error('loop is nil')
	}
	return C.uv_now(l.loop)
}

pub fn (l Loop) alive() bool {
	if isnil(l.loop) {
		return false
	}
	return C.uv_loop_alive(l.loop) == 1
}

pub fn (l Loop) backend_fd() !int {
	if isnil(l.loop) {
		return error('loop is nil')
	}
	fd := C.uv_backend_fd(l.loop)
	if fd < 0 {
		return error('failed to get backend fd')
	}
	return fd
}

pub fn (l Loop) backend_timeout() !int {
	if isnil(l.loop) {
		return error('loop is nil')
	}
	timeout := C.uv_backend_timeout(l.loop)
	if timeout < 0 {
		return error('failed to get backend timeout')
	}
	return timeout
}

pub fn (l Loop) get_c_loop() &C.uv_loop_t {
	return l.loop
}
