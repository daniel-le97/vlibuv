module vlibuv

// signal functions

fn C.uv_signal_init(loop &C.uv_loop_t, handle &C.uv_signal_t) int
fn C.uv_signal_start(handle &C.uv_signal_t, cb fn (handle &C.uv_signal_t, signum int), signum int) int
fn C.uv_signal_start_oneshot(signal &C.uv_signal_t, cb fn (signal &C.uv_signal_t, signum int), signum int) int
fn C.uv_signal_stop(handle &C.uv_signal_t) int

pub struct Signal {
pub mut:
	handle &C.uv_signal_t
}

pub fn Signal.new(l &Loop) !Signal {
	s := &C.uv_signal_t{}
	C.uv_signal_init(l.loop, s)
	return Signal{s}
}

pub fn (s Signal) start(signum int, callback fn (handle &C.uv_signal_t, signum int)) !int {
	r := C.uv_signal_start(s.handle, callback, signum)
	return error_checker(r)
}

pub fn (s Signal) start_oneshot(signum int, callback fn (handle &C.uv_signal_t, signum int)) !int {
	r := C.uv_signal_start_oneshot(s.handle, callback, signum)
	return error_checker(r)
}
