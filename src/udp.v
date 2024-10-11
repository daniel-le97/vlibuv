module vuv

// udp functions

fn C.uv_udp_init(loop &C.uv_loop_t, handle &C.uv_udp_t) int
fn C.uv_udp_init_ex(loop &C.uv_loop_t, handle &C.uv_udp_t, flags Uv_udp_flags) int
fn C.uv_udp_open(handle &C.uv_udp_t, sock int) int
fn C.uv_udp_bind(handle &C.uv_udp_t, addr &C.sockaddr, flags u32) int
fn C.uv_udp_connect(handle &C.uv_udp_t, const_sockaddr &C.sockaddr) int
fn C.uv_udp_getpeername(const_handle &C.uv_udp_t, name &C.sockaddr, namelen &int) int
fn C.uv_udp_getsockname(handle &C.uv_udp_t, name &C.sockaddr, namelen &int) int
fn C.uv_udp_set_membership(handle &C.uv_udp_t, const_multicast_addr &char, const_interface_addr &char, membership int) int
fn C.uv_udp_set_source_membership(handle &C.uv_udp_t, const_multicast_addr &char, const_interface_addr &char, const_source_addr &char, membership int) int
fn C.uv_udp_set_multicast_loop(handle &C.uv_udp_t, on int) int
fn C.uv_udp_set_multicast_ttl(handle &C.uv_udp_t, ttl int) int
fn C.uv_udp_set_multicast_interface(handle &C.uv_udp_t, interface_addr &char) int
fn C.uv_udp_set_broadcast(handle &C.uv_udp_t, on int) int
fn C.uv_udp_set_ttl(handle &C.uv_udp_t, ttl int) int
fn C.uv_udp_send(req &C.uv_udp_send_t, handle &C.uv_udp_t, bufs &C.uv_buf_t, nbufs u32, addr &C.sockaddr, cb fn (req &C.uv_udp_send_t, status int)) int
fn C.uv_udp_try_send(handle &C.uv_udp_t, const_bufs &C.uv_buf_t, nbufs u32, addr &C.sockaddr) int
fn C.uv_udp_recv_start(handle &C.uv_udp_t, alloc_cb fn (handle &C.uv_handle_t, suggested_size usize, buf &C.uv_buf_t), recv_cb fn (handle &C.uv_udp_t, nread isize, buf &C.uv_buf_t, addr &C.sockaddr, flags u32)) int
fn C.uv_udp_using_recvmmsg(const_handle &C.uv_udp_t) int
fn C.uv_udp_recv_stop(handle &C.uv_udp_t) int
fn C.uv_udp_get_send_queue_size(const_handle &C.uv_udp_t) usize
fn C.uv_udp_get_send_queue_count(const_handle &C.uv_udp_t) usize

@[typedef]
pub struct C.uv_udp_t {
	// 	loop             &C.uv_loop_t
	// 	send_queue_size  usize
	// 	send_queue_count usize
	// pub mut:
	// 	data voidptr
}

pub struct Udp {
	Handle
}

pub fn udp_init(l &Loop) Udp {
	udp := &C.uv_udp_t{}
	C.uv_udp_init(l.loop, udp)
	return Udp{Handle{udp}}
}

pub fn udp_init_ex(l &Loop, flags Uv_udp_flags) Udp {
	udp := &C.uv_udp_t{}
	C.uv_udp_init_ex(l.loop, udp, flags)
	return Udp{Handle{udp}}
}

pub fn (u &Udp) open(sock int) int {
	return C.uv_udp_open(u.handle, sock)
}

pub fn (u &Udp) bind(addr &C.sockaddr, flags u32) int {
	return C.uv_udp_bind(u.handle, addr, flags)
}

pub fn (u &Udp) connect(addr &C.sockaddr) int {
	return C.uv_udp_connect(u.handle, addr)
}

pub fn (u &Udp) getpeername(name &C.sockaddr, namelen &int) int {
	return C.uv_udp_getpeername(u.handle, name, namelen)
}

pub fn (u &Udp) getsockname(name &C.sockaddr, namelen &int) int {
	return C.uv_udp_getsockname(u.handle, name, namelen)
}

pub fn (u &Udp) set_membership(multicast_addr string, interface_addr string, membership int) int {
	return C.uv_udp_set_membership(u.handle, charptr(multicast_addr.str), charptr(interface_addr.str),
		membership)
}

pub fn (u &Udp) set_source_membership(multicast_addr string, interface_addr string, source_addr string, membership int) int {
	return C.uv_udp_set_source_membership(u.handle, charptr(multicast_addr.str), charptr(interface_addr.str),
		charptr(source_addr.str), membership)
}

pub fn (u &Udp) set_multicast_loop(on int) int {
	return C.uv_udp_set_multicast_loop(u.handle, on)
}

pub fn (u &Udp) set_multicast_ttl(ttl int) int {
	return C.uv_udp_set_multicast_ttl(u.handle, ttl)
}

pub fn (u &Udp) set_multicast_interface(interface_addr string) int {
	return C.uv_udp_set_multicast_interface(u.handle, charptr(interface_addr.str))
}

pub fn (u &Udp) set_broadcast(on int) int {
	return C.uv_udp_set_broadcast(u.handle, on)
}

pub fn (u &Udp) set_ttl(ttl int) int {
	return C.uv_udp_set_ttl(u.handle, ttl)
}

pub fn (u &Udp) send(req &C.uv_udp_send_t, bufs &C.uv_buf_t, nbufs u32, addr &C.sockaddr, cb fn (req &C.uv_udp_send_t, status int)) int {
	return C.uv_udp_send(req, u.handle, bufs, nbufs, addr, cb)
}

pub fn (u &Udp) try_send(bufs &C.uv_buf_t, nbufs u32, addr &C.sockaddr) int {
	return C.uv_udp_try_send(u.handle, bufs, nbufs, addr)
}

pub fn (u &Udp) recv_start(alloc_cb fn (handle &C.uv_handle_t, suggested_size usize, buf &C.uv_buf_t), recv_cb fn (handle &C.uv_udp_t, nread isize, buf &C.uv_buf_t, addr &C.sockaddr, flags u32)) int {
	return C.uv_udp_recv_start(u.handle, alloc_cb, recv_cb)
}

pub fn (u &Udp) using_recvmmsg() int {
	return C.uv_udp_using_recvmmsg(u.handle)
}

pub fn (u &Udp) recv_stop() int {
	return C.uv_udp_recv_stop(u.handle)
}

pub fn (u &Udp) get_send_queue_size() usize {
	return C.uv_udp_get_send_queue_size(u.handle)
}

pub fn (u &Udp) get_send_queue_count() usize {
	return C.uv_udp_get_send_queue_count(u.handle)
}

// pub fn (u &Udp) close() {
// 	C.uv_close(u.handle, nil)
// }
