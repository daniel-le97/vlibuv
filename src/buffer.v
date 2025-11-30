module vlibuv

import vlibuv.uv

// Buffer is a higher-level wrapper around uv.Uv_buf_t
// It provides a more idiomatic V API for working with buffers
pub struct Buffer {
pub mut:
	base []u8
	buf  uv.Uv_buf_t
}

// new_buffer creates a new buffer with the given capacity
pub fn new_buffer(capacity usize) Buffer {
	mut base := []u8{len: capacity}
	buf := uv.buf_init(base.data, capacity)
	return Buffer{
		base: base
		buf: buf
	}
}

// from_string creates a buffer from a string (read-only)
pub fn buffer_from_string(s string) Buffer {
	buf := uv.buf_init(s.str, usize(s.len))
	return Buffer{
		base: unsafe { []u8{len: s.len, cap: s.len, data: &u8(s.str)} }
		buf: buf
	}
}

// from_bytes creates a buffer from a byte slice
pub fn buffer_from_bytes(bytes []u8) Buffer {
	mut data := bytes.clone()
	buf := uv.buf_init(data.data, usize(data.len))
	return Buffer{
		base: data
		buf: buf
	}
}

// len returns the length of the buffer
pub fn (b Buffer) len() usize {
	return b.buf.len
}

// data returns a pointer to the buffer data
pub fn (b Buffer) data() &u8 {
	return unsafe { &u8(b.buf.base) }
}

// to_string converts the buffer to a string
pub fn (b Buffer) to_string() string {
	return unsafe { b.data().vstring_with_len(int(b.len())) }
}

// to_bytes returns the buffer as a byte slice
pub fn (b Buffer) to_bytes() []u8 {
	return b.base
}

// get_raw returns the underlying uv.Uv_buf_t for passing to libuv functions
pub fn (b Buffer) get_raw() &uv.Uv_buf_t {
	return &b.buf
}
