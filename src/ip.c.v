module vuv

// TODO must use 'struct' tag to refer to type 'sockaddr_in6'
// i dont know how to make v to refer to the struct sockaddr_in6
#define INIT_IPV6_ADDR() ((struct sockaddr_in6*)memdup(&(struct sockaddr_in6){EMPTY_STRUCT_INITIALIZATION}, sizeof(struct sockaddr_in6)))

fn C.INIT_IPV6_ADDR() voidptr

fn C.uv_ip6_addr(const_ip &char, port int, addr &C.sockaddr_in6) int

// pub fn ip6_addr(const_ip &char, port int, addr &C.sockaddr_in6) int {
// 	return C.uv_ip6_addr(const_ip, port, addr)
// }

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
	addr_in6 := C.INIT_IPV6_ADDR()
	C.uv_ip6_addr(charptr(ip.str), port, addr_in6)
	unsafe {
		return Address{&C.sockaddr(addr_in6), true}
	}
}
