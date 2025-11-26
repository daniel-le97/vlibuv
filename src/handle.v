module vlibuv

fn C.uv_is_closing(const_handle &C.uv_handle_t) int
fn C.uv_is_active(const_handle &C.uv_handle_t) int
fn C.uv_ref(handle &C.uv_handle_t)
fn C.uv_unref(handle &C.uv_handle_t)
fn C.uv_has_ref(handle &C.uv_handle_t) int
fn C.uv_handle_size(handle_type int) usize
fn C.uv_handle_get_type(const_handle &C.uv_handle_t) Uv_handle_type
fn C.uv_handle_type_name(handle_type int) &char
fn C.uv_handle_get_data(const_handle &C.uv_handle_t) voidptr
fn C.uv_handle_get_loop(const_handle &C.uv_handle_t) &C.uv_loop_t
fn C.uv_handle_set_data(handle &C.uv_handle_t, data voidptr)
fn C.uv_close(handle &C.uv_handle_t, close_cb fn (handle &C.uv_handle_t))

@[flags]
pub enum Uv_handle_type {
	unknown_handle = 0
	async
	check
	fs_event
	fs_poll
	handle
	idle
	pipe
	poll
	prepare
	process
	stream
	tcp
	timer
	tty
	udp
	signal
	file
	handle_type_max
}

pub struct Handle {
mut:
	handle &C.uv_handle_t
	closed bool
}

pub fn (mut h Handle) close() ! {
	if h.closed || isnil(h.handle) {
		return error('handle already closed or nil')
	}

	// Close without callback - just mark as closed
	C.uv_close(h.handle, unsafe { nil })
	h.closed = true
}

@[unsafe]
pub fn (mut h Handle) free() {
	if !h.closed && !isnil(h.handle) {
		// If not already closed, close it first
		C.uv_close(h.handle, unsafe { nil })
		h.closed = true
	}
}

pub fn (h Handle) ref() {
	if !isnil(h.handle) {
		C.uv_ref(h.handle)
	}
}

pub fn (h Handle) unref() {
	if !isnil(h.handle) {
		C.uv_unref(h.handle)
	}
}

pub fn (h Handle) has_ref() bool {
	if isnil(h.handle) {
		return false
	}
	return C.uv_has_ref(h.handle) == 1
}

pub fn (h Handle) is_active() bool {
	if isnil(h.handle) {
		return false
	}
	return C.uv_is_active(h.handle) == 1
}

pub fn (h Handle) is_closing() bool {
	if isnil(h.handle) {
		return false
	}
	return C.uv_is_closing(h.handle) == 1
}

pub fn (h Handle) get_type() Uv_handle_type {
	if isnil(h.handle) {
		return .unknown_handle
	}
	unsafe {
		return Uv_handle_type(C.uv_handle_get_type(h.handle))
	}
}

pub fn (h Handle) type_name() string {
	if isnil(h.handle) {
		return 'unknown'
	}
	unsafe {
		return cstring_to_vstring(C.uv_handle_type_name(int(h.get_type())))
	}
}

pub fn (h Handle) get_data[T]() ?&T {
	if isnil(h.handle) {
		return none
	}
	ptr := C.uv_handle_get_data(h.handle)
	if isnil(ptr) {
		return none
	}
	return unsafe { &T(ptr) }
}

pub fn (h Handle) set_data(data voidptr) ! {
	if isnil(h.handle) {
		return error('cannot set data on nil handle')
	}
	C.uv_handle_set_data(h.handle, data)
}

pub fn (h Handle) get_loop() !Loop {
	if isnil(h.handle) {
		return error('handle is nil')
	}
	loop_ptr := C.uv_handle_get_loop(h.handle)
	if isnil(loop_ptr) {
		return error('failed to get loop from handle')
	}
	return Loop{loop_ptr, false, false}
}

pub fn (h Handle) to_handle() &C.uv_handle_t {
	return h.handle
}
