module vlibuv

import vlibuv.uv
// @[typedef]
// pub struct uv.Uv_tcp_t {
// 	// 	loop &uv.loop_t
// 	// pub mut:
// 	// 	write_queue_size usize
// 	// 	alloc_cb         Alloc_cb
// 	// 	read_cb          Read_cb
// 	// 	data             voidptr
// }

// @[typedef]
// pub struct uv.Uv_connect_t {
// 	// 	handle &uv.Uv_stream_t
// 	// 	loop   &uv.loop_t
// 	// pub mut:
// 	// 	data voidptr
// }

// // tcp functions

// fn uv.tcp_init(loop &uv.loop_t, handle &uv.Uv_tcp_t) int

// fn uv.tcp_init_ex(loop &uv.loop_t, handle &uv.Uv_tcp_t, flags usize) int

// fn uv.tcp_open(handle &uv.Uv_tcp_t, sock int) int

// fn uv.tcp_nodelay(handle &uv.Uv_tcp_t, enable int) int

// fn uv.tcp_keepalive(handle &uv.Uv_tcp_t, enable int, delay u32) int

// fn uv.tcp_simultaneous_accepts(handle &uv.Uv_tcp_t, enable int) int

// fn uv.tcp_bind(handle &uv.Uv_tcp_t, const_addr &C.sockaddr, flags u32) int

// fn uv.tcp_getsockname(handle &uv.Uv_tcp_t, name &C.sockaddr, namelen &int) int

// fn uv.tcp_getpeername(handle &uv.Uv_tcp_t, name &C.sockaddr, namelen &int) int

// fn uv.tcp_connect(req &uv.Uv_connect_t, handle &uv.Uv_tcp_t, addr &C.sockaddr, cb fn (req &uv.Uv_connect_t, status int)) int

// TCP is subclass of Stream, which is subclass of Handle,
// meaning it has all the methods of Stream and Handle
// pub struct Tcp {
// 	Stream // tcp uv.Uv_tcp_t
// mut:
// 	addr &C.sockaddr = unsafe { nil }
// }

// pub struct C.sockaddr {}

// pub fn tcp_init(l Loop) !Tcp {
// 	tcp := &uv.Uv_tcp_t{}
// 	res := uv.tcp_init(l.loop, tcp)
// 	if res != 0 {
// 		return error('failed to initialize tcp')
// 	}
// 	return Tcp{
// 		handle: unsafe {&uv.Uv_stream_t(tcp)}
// 		addr: unsafe { nil }
// 	}
// }

// pub fn tcp_init_ex(l &Loop, flags u8) Tcp {
// 	tcp := &uv.Uv_tcp_t{}
// 	uv.tcp_init_ex(l.loop, tcp, usize(flags))
// 	return Tcp{
// 		handle: unsafe{&uv.Uv_stream_t(tcp)}
// 		addr: unsafe { nil }
// 	}
// }

// // if flags is 1 it will be set to ipv6 only
// pub fn (mut t Tcp) bind(addr Address, flags int) !int {
// 	return error('TCP methods not implemented in this refactoring')
// 	// unsafe {
// 	// 	t.addr = addr.addr
// 	// }
// 	// return error_checker(uv.tcp_bind(t.handle, addr.addr, flags))
// }

// pub fn (t &Tcp) connect(addr Address, callback fn (req &uv.Uv_connect_t, status int)) {
// 	req := &uv.Uv_connect_t{}
// 	uv.tcp_connect(req, t.handle, addr.addr, callback)
// }

// pub fn (t &Tcp) nodelay(enable bool) !int {
// 	r := uv.tcp_nodelay(t.handle, bool_to_int(enable))
// 	return error_checker(r)
// }

// pub fn (t &Tcp) keepalive(enable bool, delay u32) !int {
// 	as_int := if enable { 1 } else { 0 }
// 	r := uv.tcp_keepalive(t.handle, as_int, delay)
// 	return error_checker(r)
// }

// pub fn (t &Tcp) simultaneous_accepts(enable bool) !int {
// 	r := uv.tcp_simultaneous_accepts(t.handle, bool_to_int(enable))
// 	return error_checker(r)
// }

// pub fn (t &Tcp) getsockname() {
// 	uv.tcp_getsockname(t.handle, t.addr, t.addr.str().len)
// }

// pub fn (t &Tcp) getpeername() {
// 	// return tcp_getpeername(t.handle)
// }

// pub fn (t &Tcp) open(fd int) !int {
// 	r := uv.tcp_open(t.handle, fd)
// 	return error_checker(r)
// }
