module main

import vlibuv

fn listen_callback(server vlibuvbuv.Stream, status int) {
	if status < 0 {
		println('error in listen_callback')
		return
	}
	client := vlibuvbuv.tcp_init(server.get_loop())
	server.accept(client.Stream) or {
		client.close(fn (ptr voidptr) {
			unsafe {
				free(ptr)
			}
		})
	}

	client.read_start(alloc_cb, read_cb) or { println('unable to read from client') }
}

fn alloc_cb(handle voidptr, size usize, buf voidptr) {
}

fn read_cb(client vlibuvbuv.Stream, nread isize, buf voidptr) {
	response := 'HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\nContent-Length: 13\r\n\r\nHello, World!'
	client.write_client(response, on_write)
}

fn on_write(req voidptr, status int) {
}

fn main() {
	l := vlibuvbuv.default_loop()
	mut tcp := vlibuvbuv.tcp_init(&l)
	// // fs := vlibuvbuv.fs_init(l)
	ip := '0.0.0.0'
	port := 8005
	address := vlibuvbuv.new_ipv4_addr(ip, port)
	tcp.bind(address, 0) or { panic(err) }
	tcp.listen(128, listen_callback) or { panic(err) }

	l.run(.default) or { panic(err) }
}
