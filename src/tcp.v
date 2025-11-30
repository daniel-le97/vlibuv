module vlibuv

import vlibuv.uv

pub struct C.sockaddr {}

// Note: bool_to_int and error_checker are imported from util.v (same module)

// ConnectCb callback type for connection operations
// status: 0 on successful connection, error code otherwise
pub type ConnectCb = fn (tcp Tcp, status int)

// TCP is a subclass of Stream (embedded), which is a subclass of Handle (embedded),
// meaning it inherits all methods of Stream and Handle
pub struct Tcp {
	Stream
pub mut:
	tcp &uv.Uv_tcp_t = unsafe { nil }
}

// Create a new TCP handle
pub fn Tcp.new(loop &Loop) !Tcp {
	return new_tcp(loop)
}

// Create a new TCP handle with flags (e.g., UV_TCP_IPV6ONLY)
pub fn Tcp.new_ex(loop &Loop, flags u8) !Tcp {
	return new_tcp_ex(loop, flags)
}

fn new_tcp(loop &Loop) !Tcp {
	tcp_handle := &uv.Uv_tcp_t{}
	result := uv.tcp_init(loop.get_c_loop(), tcp_handle)
	error_checker(result)!
	unsafe {
		handle := &Handle{
				handle: &uv.Uv_handle_t(tcp_handle)
				closed: false
			}
		return Tcp{
			Stream: Stream{
				Handle: handle
				stream: &uv.Uv_stream_t(tcp_handle)
			}
			tcp:    tcp_handle
		}
	}
}

fn new_tcp_ex(loop &Loop, flags u8) !Tcp {
	tcp_handle := &uv.Uv_tcp_t{}
	result := uv.tcp_init_ex(loop.get_c_loop(), tcp_handle, usize(flags))
	error_checker(result)!
	unsafe {
		handle := &Handle{
				handle: &uv.Uv_handle_t(tcp_handle)
				closed: false
			}
		return Tcp{
			Handle: handle
			Stream: Stream{
				Handle: handle
				stream: &uv.Uv_stream_t(tcp_handle)
			}
			tcp:    tcp_handle
		}
	}
}

// bind associates the TCP handle with a local address
// flags: 0 for normal mode, UV_TCP_IPV6ONLY for IPv6-only
pub fn (mut t Tcp) bind(addr Address, flags u32) !int {
	result := uv.tcp_bind(t.tcp, addr.addr, int(flags))
	return error_checker(result)
}

// connect establishes a connection to a remote address
pub fn (mut t Tcp) connect(addr Address, callback ConnectCb) !int {
	req := &uv.Uv_connect_t{}

	// Wrap user callback - just pass the captured Tcp instead of reconstructing
	c_connect_callback := fn [callback, t] (req &uv.Uv_connect_t, status int) {
		callback(t, status)
	}

	result := uv.tcp_connect(req, t.tcp, addr.addr, c_connect_callback)
	return error_checker(result)
}

// nodelay controls whether Nagle's algorithm is used
// enable: true to disable Nagle's algorithm (TCP_NODELAY), false to enable it
pub fn (t &Tcp) nodelay(enable bool) !int {
	result := uv.tcp_nodelay(t.tcp, bool_to_int(enable))
	return error_checker(result)
}

// keepalive enables TCP keepalive
// enable: true to enable keepalive
// delay: delay in seconds before first keepalive probe is sent (only used if enable is true)
pub fn (t &Tcp) keepalive(enable bool, delay u32) !int {
	enable_int := bool_to_int(enable)
	result := uv.tcp_keepalive(t.tcp, enable_int, delay)
	return error_checker(result)
}

// simultaneous_accepts controls whether multiple threads can accept connections simultaneously
// enable: true to enable simultaneous accepts
pub fn (t &Tcp) simultaneous_accepts(enable bool) !int {
	result := uv.tcp_simultaneous_accepts(t.tcp, bool_to_int(enable))
	return error_checker(result)
}

// open takes an existing socket descriptor and associates it with a TCP handle
pub fn (t &Tcp) open(fd int) !int {
	result := uv.tcp_open(t.tcp, fd)
	return error_checker(result)
}

// getsockname returns the local address associated with this TCP handle
pub fn (t &Tcp) getsockname() !(string, int) {
	// Note: This is a simplified implementation
	// In production, you'd want to parse the sockaddr structure properly
	// For now, we'll return an error indicating this needs full implementation
	return error('getsockname not fully implemented - requires sockaddr parsing')
}

// getpeername returns the remote address associated with this TCP handle
pub fn (t &Tcp) getpeername() !(string, int) {
	// Note: This is a simplified implementation
	// In production, you'd want to parse the sockaddr structure properly
	// For now, we'll return an error indicating this needs full implementation
	return error('getpeername not fully implemented - requires sockaddr parsing')
}
