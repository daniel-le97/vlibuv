module main

import vuv

// Define a struct for the HTTP server
struct HttpServer {
	server &vuv.Uv_tcp_t
	loop   &vuv.Uv_loop_t
	// baton  &C.uv_work_t
}

fn new_http_server() HttpServer {
	loop := vuv.default_loop()
	server := &vuv.Uv_tcp_t{}
	// worker := &C.uv_work_t{}
	vuv.tcp_init(loop, server)
	return HttpServer{server, loop}
}

fn (hs HttpServer) bind(ip string, port int) !int {
	mut addr := vuv.Sockaddr{}
	vuv.ip4_addr(&char(ip.str), port, &addr)
	return vuv.tcp_bind(hs.server, &addr, 0)
}

fn (hs HttpServer) listen() !int {
	return vuv.listen(unsafe { &vuv.Uv_stream_t(hs.server) }, 128, on_new_connection)
}

// Function to set TCP_NODELAY
fn (server &HttpServer) set_nodelay(enable bool) {
	vuv.tcp_nodelay(server.server, if enable { 1 } else { 0 })
}

fn on_close_cb(handle &vuv.Uv_handle_t) {
	unsafe {
		free(handle)
	}
}

fn on_new_connection(server &vuv.Uv_stream_t, status int) {
	if status < 0 {
		println('New connection error')
		return
	}
	client := &vuv.Uv_tcp_t{}
	vuv.tcp_init(vuv.default_loop(), client)
	if vuv.accept(server, unsafe { &vuv.Uv_stream_t(client) }) == 0 {
		vuv.read_start(unsafe { &vuv.Uv_stream_t(client) }, alloc_buffer, on_read)
	} else {
		vuv.close(unsafe { &vuv.Uv_handle_t(client) }, on_close_cb)
	}
}

fn alloc_buffer(handle &vuv.Uv_handle_t, suggested_size usize, mut buf vuv.Uv_buf_t) {
	unsafe {
		buf.base = malloc(suggested_size)
		buf.len = suggested_size
	}
}

fn on_read(client &vuv.Uv_stream_t, nread isize, buf &vuv.Uv_buf_t) {
	if nread < 0 {
		vuv.close(unsafe { &vuv.Uv_handle_t(client) }, on_close_cb)
		return
	}

	response := 'HTTP/1.1 200 OK\r\nContent-Length: 13\r\n\r\nHello, World!'

	write_req := &vuv.Uv_write_t{}
	write_buf := vuv.buf_init(response.str, usize(response.len))
	vuv.write(write_req, client, &write_buf, 1, on_write)
}

fn on_write(req &vuv.Uv_write_t, status int) {
	if status < 0 {
		println('Write error')
	}
	unsafe {
		free(req)
	}
}

// pub const tcp_server = C.uv_tcp_t{}

// Example usage
fn main() {
	// Create a new HTTP server

	mut server := new_http_server()
	port := 8080

	// Bind the server to IP and port
	server.bind('0.0.0.0', port) or {
		println('Bind error')
		return
	}

	// server.set_nodelay(true)

	// Start listening for incoming connections
	server.listen() or {
		println('Listen error')
		return
	}

	println('http://localhost:${port}')

	// Run the event loop
	vuv.run(server.loop, vuv.Mode.default)
}
