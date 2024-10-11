module main

import vlibuv

fn listen_callback(server vlibuv.Stream, status int) {
	if status < 0 {
		println('error in listen_callback')
		return
	}
	client := vlibuv.tcp_init(server.get_loop())
	server.accept(client.Stream) or {
		client.close(fn (ptr voidptr) {
			unsafe {
				free(ptr)
			}
		})
	}

	client.read_start(alloc_cb, read_cb) or { println('unable to read from client') }
}

struct Buf {
pub mut:
	base voidptr
	len  usize
}

fn alloc_cb(handle voidptr, size usize, mut buf voidptr) {
	vlibuv.init_buf(mut buf, size)
}

fn read_cb(client vlibuv.Stream, nread isize, buf voidptr) {
	response := 'HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\nContent-Length: 13\r\n\r\nHello, World!'
	client.write_client(response, on_write)
}

fn on_write(req voidptr, status int) {
	if status != 0 {
		println(vlibuv.get_error_message(status))
	}
	println(status)
	unsafe {
		free(req)
	}
}

fn main() {
	l := vlibuv.default_loop()
	mut tcp := vlibuv.tcp_init(&l)
	// // fs := vlibuv.fs_init(l)
	ip := '0.0.0.0'
	port := 8005
	address := vlibuv.new_ipv4_addr(ip, port)
	tcp.bind(address, 0) or { panic(err) }
	tcp.listen(128, listen_callback) or { panic(err) }

	l.run(.default) or { panic(err) }
}
