module vlibuv

@[typedef]
pub struct C.uv_tcp_t {
	// 	loop &C.uv_loop_t
	// pub mut:
	// 	write_queue_size usize
	// 	alloc_cb         Alloc_cb
	// 	read_cb          Read_cb
	// 	data             voidptr
}

@[typedef]
pub struct C.uv_connect_t {
	// 	handle &C.uv_stream_t
	// 	loop   &C.uv_loop_t
	// pub mut:
	// 	data voidptr
}

// tcp functions

fn C.uv_tcp_init(loop &C.uv_loop_t, handle &C.uv_tcp_t) int

fn C.uv_tcp_init_ex(loop &C.uv_loop_t, handle &C.uv_tcp_t, flags usize) int

fn C.uv_tcp_open(handle &C.uv_tcp_t, sock int) int

fn C.uv_tcp_nodelay(handle &C.uv_tcp_t, enable int) int

fn C.uv_tcp_keepalive(handle &C.uv_tcp_t, enable int, delay u32) int

fn C.uv_tcp_simultaneous_accepts(handle &C.uv_tcp_t, enable int) int

fn C.uv_tcp_bind(handle &C.uv_tcp_t, const_addr &C.sockaddr, flags u32) int

fn C.uv_tcp_getsockname(handle &C.uv_tcp_t, name &C.sockaddr, namelen &int) int

fn C.uv_tcp_getpeername(handle &C.uv_tcp_t, name &C.sockaddr, namelen &int) int

fn C.uv_tcp_connect(req &C.uv_connect_t, handle &C.uv_tcp_t, addr &C.sockaddr, cb fn (req &C.uv_connect_t, status int)) int

// fn bool_to_int(b bool) int {
// 	if b {
// 		return 1
// 	}
// 	return 0
// }

pub struct Tcp {
	Stream // tcp C.uv_tcp_t
mut:
	addr &C.sockaddr = unsafe { nil }
}

pub struct C.sockaddr {}

pub fn tcp_init(l &Loop) Tcp {
	tcp := &C.uv_tcp_t{}
	C.uv_tcp_init(l.loop, tcp)
	return Tcp{Stream{Handle{tcp}}, unsafe { nil }}
}

pub fn tcp_init_ex(l &Loop, flags u8) Tcp {
	tcp := &C.uv_tcp_t{}
	C.uv_tcp_init_ex(l.loop, tcp, usize(flags))
	return Tcp{Stream{Handle{tcp}}, unsafe { nil }}
}

// if flags is 1 it will be set to ipv6 only
pub fn (mut t Tcp) bind(addr Address, flags int) !int {
	unsafe {
		t.addr = addr.addr
	}
	return error_checker(C.uv_tcp_bind(t.handle, addr.addr, flags))
}

pub fn (t &Tcp) connect(addr Address, callback fn (req &C.uv_connect_t, status int)) {
	req := &C.uv_connect_t{}
	C.uv_tcp_connect(req, t.handle, addr.addr, callback)
}

pub fn (t &Tcp) nodelay(enable bool) !int {
	r := C.uv_tcp_nodelay(t.handle, bool_to_int(enable))
	return error_checker(r)
}

pub fn (t &Tcp) keepalive(enable bool, delay u32) !int {
	as_int := if enable { 1 } else { 0 }
	r := C.uv_tcp_keepalive(t.handle, as_int, delay)
	return error_checker(r)
}

pub fn (t &Tcp) simultaneous_accepts(enable bool) !int {
	r := C.uv_tcp_simultaneous_accepts(t.handle, bool_to_int(enable))
	return error_checker(r)
}

// pub fn (t &Tcp) getsockname() {
// 	C.uv_tcp_getsockname(t.handle, t.addr, t.addr.str().len)
// }

// pub fn (t &Tcp) getpeername() {
// 	// return tcp_getpeername(t.handle)
// }

pub fn (t &Tcp) open(fd int) !int {
	r := C.uv_tcp_open(t.handle, fd)
	return error_checker(r)
}
