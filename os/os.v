module os

import vlibuv as _

const path_max = 65536

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

pub fn homedir() string {
	return call_fn(C.uv_os_homedir)
}


