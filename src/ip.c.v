module vlibuv

import vlibuv.uv

pub struct Address {
pub:
	addr    &C.sockaddr
	is_ipv6 bool
}

pub fn new_ipv4_addr(ip string, port int) Address {
	addr_in := &uv.Sockaddr_in{}
	uv.ip4_addr(charptr(ip.str), port, addr_in)
	return Address{&C.sockaddr(addr_in), false}
}

pub fn new_ipv6_addr(ip string, port int) Address {
	addr_in6 := &uv.Sockaddr_in6{}
	// addr_in6 := C.INIT_IPV6_ADDR()
	uv.ip6_addr(charptr(ip.str), port, addr_in6)
	unsafe {
		return Address{&C.sockaddr(addr_in6), true}
	}
}
