module vlibuv

fn C.uv_ip6_addr(const_ip &char, port int, addr &C.sockaddr_in6) int

pub struct Address {
	addr    &C.sockaddr
	is_ipv6 bool
}

pub fn new_ipv4_addr(ip string, port int) Address {
	addr_in := &C.sockaddr_in{}
	C.uv_ip4_addr(charptr(ip.str), port, addr_in)
	return Address{&C.sockaddr(addr_in), false}
}

pub fn new_ipv6_addr(ip string, port int) Address {
	addr_in6 := &C.sockaddr_in6{}
	// addr_in6 := C.INIT_IPV6_ADDR()
	C.uv_ip6_addr(charptr(ip.str), port, addr_in6)
	unsafe {
		return Address{&C.sockaddr(addr_in6), true}
	}
}
