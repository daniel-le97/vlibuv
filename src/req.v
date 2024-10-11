module vlibuv

// request functions

fn C.uv_req_size(req_type int) usize

pub fn req_size(req_type Uv_req_type) usize {
	return C.uv_req_size(int(req_type))
}

fn C.uv_req_get_data(const_req &C.uv_req_t) voidptr

pub fn req_get_data(const_req &C.uv_req_t) voidptr {
	return C.uv_req_get_data(const_req)
}

fn C.uv_req_set_data(req &C.uv_req_t, data voidptr)

pub fn req_set_data(req &C.uv_req_t, data voidptr) {
	C.uv_req_set_data(req, data)
}

// fn C.uv_req_get_type(const_req &C.uv_req_t) Uv_req_type

// pub fn req_get_type(const_req &C.uv_req_t) Uv_req_type {
// 	unsafe {
// 		return Uv_req_type(C.uv_req_get_type(const_req))
// 	}
// }

// fn C.uv_req_type_name(const_req_type int) &char

// pub fn req_type_name(const_req_type Uv_req_type) string {
// 	unsafe {
// 		return cstring_to_vstring(C.uv_req_type_name(int(const_req_type)))
// 	}
// }

fn C.uv_req_get_loop(const_req &C.uv_req_t) &C.uv_loop_t


struct Req {
	req &C.uv_req_t
}

pub fn (r Req) get_data[T]() T {
	return C.uv_req_get_data(r.req)
}

pub fn (r Req) set_data(data voidptr) {
	C.uv_req_set_data(r.req, data)
}

// pub fn (r Req) get_type() Uv_req_type {
// 	unsafe {
// 		return Uv_req_type(C.uv_req_get_type(r.req))
// 	}
// }

// pub fn (r Req) type_name() string {
// 	unsafe {
// 		return cstring_to_vstring(C.uv_req_type_name(int(r.get_type())))
// 	}
// }

// pub fn (r Req) size() usize {
// 	return C.uv_req_size(r.get_type().str().int())
// }

pub fn (r Req) get_loop() Loop {
	l := C.uv_req_get_loop(r.req)
	return Loop{l}
}
