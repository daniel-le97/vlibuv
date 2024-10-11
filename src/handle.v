module vuv

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

struct Handle {
	handle voidptr
}

pub fn (h Handle) close(callback fn (handle &C.uv_handle_t)) {
	C.uv_close(h.to_handle(), callback)
}

pub fn (h Handle) ref() {
	C.uv_ref(h.to_handle())
}

pub fn (h Handle) unref() {
	C.uv_unref(h.to_handle())
}

pub fn (h Handle) has_ref() bool {
	return C.uv_has_ref(h.to_handle()) == 1
}

pub fn (h Handle) is_active() bool {
	return C.uv_is_active(h.to_handle()) == 1
}

pub fn (h Handle) is_closing() bool {
	return C.uv_is_closing(h.to_handle()) == 1
}

pub fn (h Handle) get_type() Uv_handle_type {
	unsafe {
		return Uv_handle_type(C.uv_handle_get_type(h.to_handle()))
	}
}

pub fn (h Handle) type_name() string {
	unsafe {
		return cstring_to_vstring(C.uv_handle_type_name(int(h.get_type())))
	}
}

pub fn (h Handle) size() usize {
	return C.uv_handle_size(h.get_type().str().int())
}

pub fn (h Handle) get_data[T]() &T {
	return C.uv_handle_get_data(h.to_handle())
}

pub fn (h Handle) set_data(data voidptr) {
	C.uv_handle_set_data(h.to_handle(), data)
}

pub fn (h Handle) get_loop() Loop {
	l := C.uv_handle_get_loop(h.to_handle())
	return Loop{l}
}

pub fn (h Handle) to_handle() &C.uv_handle_t {
	return unsafe { &C.uv_handle_t(h.handle) }
}
