module vlibuv

import vlibuv.uv

pub fn get_error_message(i int) string {
	unsafe {
		return cstring_to_vstring(uv.strerror(i).str)
	}
}

@[inline]
pub fn error_checker(i int) !int {
	if i < 0 {
		unsafe {
			return error(cstring_to_vstring(uv.err_name(i).str))
		}
	}
	return i
}

@[inline]
fn bool_to_int(b bool) int {
	if b {
		return 1
	}
	return 0
}

@[inline]
fn int_to_bool(i int) bool {
	return if i == 0 { false } else { true }
}

const path_max = 4096

@[inline]
fn new_buffer(size int) (&char, usize) {
	buf := []char{len: size}
	return &buf[0], usize(buf.len)
}

@[inline]
fn call_fn(func fn (buffer &char, size &usize) int) string {
	buf, size := new_buffer(path_max)
	unsafe {
		func(buf, size)
		return cstring_to_vstring(&buf[0])
	}
}
