module vlibuv

import vlibuv.uv
// // signal functions

pub struct Signal {
pub mut:
	handle &uv.Uv_signal_t
}

pub fn Signal.new(l &Loop) !Signal {
	s := &uv.Uv_signal_t{}
	C.uv_signal_init(l.loop, s)
	return Signal{s}
}

pub fn new_signal(l &Loop) !Signal {
	s := &uv.Uv_signal_t{}
	C.uv_signal_init(l.loop, s)
	return Signal{s}
}

pub fn (s Signal) start(signum int, callback fn (handle &uv.Uv_signal_t, signum int)) !int {
	r := C.uv_signal_start(s.handle, callback, signum)
	return error_checker(r)
}

pub fn (s Signal) start_oneshot(signum int, callback fn (handle Signal, signum int)) !int {
	c_callback := fn [callback] (handle &uv.Uv_signal_t, signum int) {
		signal := Signal{unsafe{handle}}
		callback(signal, signum)
	}
	r := C.uv_signal_start_oneshot(s.handle, c_callback, signum)
	return error_checker(r)
}

pub fn (s Signal) stop() !int {
	r := C.uv_signal_stop(s.handle)
	return error_checker(r)
}
