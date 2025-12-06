module vlibuv
import vlibuv.uv
// // udp functions

// fn uv.udp_init(loop &uv.loop_t, handle Uv_v_udp_t) int
// fn uv.udp_init_ex(loop &uv.loop_t, handle Uv_v_udp_t, flags Uv_udp_flags) int
// fn uv.udp_open(handle Uv_v_udp_t, sock int) int
// fn uv.udp_bind(handle Uv_v_udp_t, addr &C.sockaddr, flags u32) int
// fn uv.udp_connect(handle Uv_v_udp_t, const_sockaddr &C.sockaddr) int
// fn uv.udp_getpeername(const_handle Uv_v_udp_t, name &C.sockaddr, namelen &int) int
// fn uv.udp_getsockname(handle Uv_v_udp_t, name &C.sockaddr, namelen &int) int
// fn uv.udp_set_membership(handle &uv.Uv_udp_t, const_multicast_addr &char, const_interface_addr &char, membership int) int
// fn uv.udp_set_source_membership(handle &uv.Uv_udp_t, const_multicast_addr &char, const_interface_addr &char, const_source_addr &char, membership int) int
// fn uv.udp_set_multicast_loop(handle &uv.Uv_udp_t, on int) int
// fn uv.udp_set_multicast_ttl(handle &uv.Uv_udp_t, ttl int) int
// fn uv.udp_set_multicast_interface(handle &uv.Uv_udp_t, interface_addr &char) int
// fn uv.udp_set_broadcast(handle &uv.Uv_udp_t, on int) int
// fn uv.udp_set_ttl(handle &uv.Uv_udp_t, ttl int) int
// fn uv.udp_send(req &uv.udp_send_t, handle &uv.Uv_udp_t, bufs &uv.buf_t, nbufs u32, addr &C.sockaddr, cb fn (req &uv.udp_send_t, status int)) int
// fn uv.Uv_udp_try_send(handle &uv.Uv_udp_t, const_bufs &uv.buf_t, nbufs u32, addr &C.sockaddr) int
// fn uv.udp_recv_start(handle &uv.Uv_udp_t, alloc_cb fn (handle &uv.handle_t, suggested_size usize, buf &uv.buf_t), recv_cb fn (handle &uv.Uv_udp_t, nread isize, buf &uv.buf_t, addr &C.sockaddr, flags u32)) int
// fn uv.udp_using_recvmmsg(const_handle &uv.Uv_udp_t) int
// fn uv.udp_recv_stop(handle &uv.Uv_udp_t) int
// fn uv.udp_get_send_queue_size(const_handle &uv.Uv_udp_t) usize
// fn uv.udp_get_send_queue_count(const_handle &uv.Uv_udp_t) usize

// @[typedef]
// pub struct uv.Uv_udp_t {
// 	// 	loop             &uv.loop_t
// 	// 	send_queue_size  usize
// 	// 	send_queue_count usize
// 	// pub mut:
// 	// 	data voidptr
// }

pub struct Udp {
pub mut:
	handle &uv.Uv_udp_t
}

pub fn Udp.new(l &Loop) !Udp {
	udp := &uv.Uv_udp_t{}
	uv.udp_init(l.loop, udp)
	return Udp{udp}
}

pub fn udp_init_ex(l &Loop, flags uv.Uv_udp_flags) Udp {
	udp := &uv.Uv_udp_t{}
	uv.udp_init_ex(l.loop, udp, flags)
	return Udp{udp}
}

pub fn (u &Udp) open(sock int) int {
	return uv.udp_open(u.handle, sock)
}

pub fn (u &Udp) bind(addr &C.sockaddr, flags int) int {
	return uv.udp_bind(u.handle, addr, flags)
}

pub fn (u &Udp) connect(addr &C.sockaddr) int {
	return uv.udp_connect(u.handle, addr)
}

pub fn (u &Udp) getpeername(name &C.sockaddr, namelen &int) int {
	return uv.udp_getpeername(u.handle, name, namelen)
}

pub fn (u &Udp) getsockname(name &C.sockaddr, namelen &int) int {
	return uv.udp_getsockname(u.handle, name, namelen)
}

pub fn (u &Udp) set_membership(multicast_addr string, interface_addr string, membership uv.Uv_membership) int {
	return uv.udp_set_membership(u.handle, charptr(multicast_addr.str), charptr(interface_addr.str),
		membership)
}

pub fn (u &Udp) set_source_membership(multicast_addr string, interface_addr string, source_addr string, membership uv.Uv_membership) int {
	return uv.udp_set_source_membership(u.handle, charptr(multicast_addr.str), charptr(interface_addr.str),
		charptr(source_addr.str), membership)
}

pub fn (u &Udp) set_multicast_loop(on int) int {
	return uv.udp_set_multicast_loop(u.handle, on)
}

pub fn (u &Udp) set_multicast_ttl(ttl int) int {
	return uv.udp_set_multicast_ttl(u.handle, ttl)
}

pub fn (u &Udp) set_multicast_interface(interface_addr string) int {
	return uv.udp_set_multicast_interface(u.handle, charptr(interface_addr.str))
}

pub fn (u &Udp) set_broadcast(on int) int {
	return uv.udp_set_broadcast(u.handle, on)
}

pub fn (u &Udp) set_ttl(ttl int) int {
	return uv.udp_set_ttl(u.handle, ttl)
}

pub fn (u &Udp) send(req &uv.Uv_udp_send_t, bufs &uv.Uv_buf_t, nbufs u32, addr &C.sockaddr, cb fn (req uv.Uv_udp_send_t, status int)) int {
	return uv.udp_send(req, u.handle, bufs, nbufs, addr, cb)
}

pub fn (u &Udp) try_send(bufs &uv.Uv_buf_t, nbufs u32, addr &C.sockaddr) int {
	return uv.udp_try_send(u.handle, bufs, nbufs, addr)
}

pub fn (u &Udp) recv_start(alloc_cb fn (handle &uv.Uv_handle_t, suggested_size usize, buf &uv.Uv_buf_t), recv_cb fn (handle uv.Uv_udp_t, nread isize, buf &uv.Uv_buf_t, addr &C.sockaddr, flags u32)) int {
	return uv.udp_recv_start(u.handle, alloc_cb, recv_cb)
}

pub fn (u &Udp) using_recvmmsg() int {
	return uv.udp_using_recvmmsg(u.handle)
}

pub fn (u &Udp) recv_stop() int {
	return uv.udp_recv_stop(u.handle)
}

pub fn (u &Udp) get_send_queue_size() usize {
	return uv.udp_get_send_queue_size(u.handle)
}

pub fn (u &Udp) get_send_queue_count() usize {
	return uv.udp_get_send_queue_count(u.handle)
}
