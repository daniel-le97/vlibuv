module uv

pub fn get_error_message(i int) string {
	unsafe {
		return cstring_to_vstring(C.uv_strerror(i))
	}
}

pub const buff_size = 4096

// Buffer management helper for C functions that need pre-allocated buffers
pub fn call_with_buffer(func fn (buf &char, size &usize) int) !string {
	mut buf := []char{len: buff_size}
	mut size := usize(buff_size)

	ret := unsafe { func(&buf[0], &size) }
	if ret < 0 {
		return error(get_error_message(ret))
	}

	unsafe {
		return cstring_to_vstring(&buf[0])
	}
}
