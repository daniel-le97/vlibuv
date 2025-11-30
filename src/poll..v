module vlibuv

import vlibuv.uv

// // poll functions
pub struct Poll {
pub mut:
	handle &uv.Uv_poll_t
}

pub fn Poll.new(l &Loop, fd int) !Poll {
	return new_poll(l, fd)
}

pub fn Poll.new_socket(l &Loop, socket int) !Poll {
	return new_socket_poll(l, socket)
}

pub fn new_socket_poll(l &Loop, socket int) !Poll {
	p := &uv.Uv_poll_t{}
	uv.poll_init_socket(l.loop, p, socket)
	return Poll{p}
}

pub fn new_poll(l &Loop, fd int) !Poll {
	p := &uv.Uv_poll_t{}
	uv.poll_init(l.loop, p, fd)
	return Poll{p}
}

pub fn (p Poll) start(events int, callback fn (handle &uv.Uv_poll_t, status int, events int)) !int {
	r := uv.poll_start(p.handle, events, callback)
	return error_checker(r)
}

pub fn (p Poll) stop() !int {
	r := uv.poll_stop(p.handle)
	return error_checker(r)
}
