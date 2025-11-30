module vlibuv

import vlibuv.uv

// // request functions
struct Req {
	req voidptr
pub mut:
	data voidptr
}

pub fn Req.new() Req {
	return new_req()
}

pub fn new_req() Req {
	return Req{unsafe { nil }, unsafe { nil }}
}

pub fn (r Req) get_data() voidptr {
	// return r.data
	return C.uv_req_get_data(r.to_req())
	// unsafe {
	// 	return &T(C.uv_req_get_data(r.req))
	// }
}

pub fn (r Req) cancel() {
	C.uv_cancel(r.req)
}

pub fn (mut r Req) set_data(data voidptr) {
	// r.data = data

	C.uv_req_set_data(r.to_req(), data)
}

pub fn (r Req) to_req() &C.uv_req_t {
	unsafe {
		return &C.uv_req_t(r.req)
	}
}

pub fn (r Req) get_type() uv.Uv_req_type {
	unsafe {
		return uv.Uv_req_type(C.uv_req_get_type(r.req))
	}
}

pub fn (r Req) type_name() string {
	unsafe {
		return cstring_to_vstring(uv.req_type_name(r.get_type()).str)
	}
}

pub fn (r Req) size() usize {
	return uv.req_size(r.get_type())
}

