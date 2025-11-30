module vlibuv

import vlibuv.uv
// // prepare functions

pub struct Prepare {
pub mut:
	handle &uv.Uv_prepare_t
}

pub fn prepare_init(l &Loop) Prepare {
	p := &uv.Uv_prepare_t{}
	uv.prepare_init(l.loop, p)
	return Prepare{p}
}

pub fn (p Prepare) start(callback fn (handle &uv.Uv_prepare_t)) !int {
	r := uv.prepare_start(p.handle, callback)
	return error_checker(r)
}

pub fn (p Prepare) stop() !int {
	r := uv.prepare_stop(p.handle)
	return error_checker(r)
}
