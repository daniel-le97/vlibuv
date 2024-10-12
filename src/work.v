module vlibuv

pub struct Work {
	Req // pub mut:
	// 	l_data voidptr = unsafe { nil }
}

pub fn new_work() Work {
	work := &C.uv_work_t{}
	return Work{Req{work, unsafe { nil }}}
}

pub fn (w Work) to_work() &C.uv_work_t {
	unsafe {
		return &C.uv_work_t(w.req)
	}
}
