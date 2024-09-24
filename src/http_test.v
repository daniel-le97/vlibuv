module main

// Define a struct for the HTTP server
struct HttpServer {
	server &C.uv_tcp_t
	loop   &C.uv_loop_t
	// baton  &C.uv_work_t
}

fn new_http_server() HttpServer {
	loop := C.uv_default_loop()
	server := &C.uv_tcp_t{}
	// worker := &C.uv_work_t{}
	C.uv_tcp_init(loop, server)
	return HttpServer{server, loop}
}

fn (hs HttpServer) bind(ip string, port int) !int {
	mut addr := C.sockaddr{}
	C.uv_ip4_addr(&char(ip.str), port, &addr)
	return C.uv_tcp_bind(hs.server, &addr, 0)
}

fn (hs HttpServer) listen() !int {
	return C.uv_listen(&C.uv_stream_t(hs.server), 128, on_new_connection)
}

// Function to set TCP_NODELAY
fn (server &HttpServer) set_nodelay(enable bool) {
	C.uv_tcp_nodelay(server.server, if enable { 1 } else { 0 })
}

fn on_close_cb(handle &C.uv_handle_t) {
	unsafe {
		free(handle)
	}
}

fn on_new_connection(server &C.uv_stream_t, status int) {
	if status < 0 {
		println('New connection error')
		return
	}
	client := &C.uv_tcp_t{}
	C.uv_tcp_init(C.uv_default_loop(), client)
	if C.uv_accept(server, &C.uv_stream_t(client)) == 0 {
		C.uv_read_start(&C.uv_stream_t(client), alloc_buffer, on_read)
	} else {
		C.uv_close(&C.uv_handle_t(client), on_close_cb)
	}
}

fn alloc_buffer(handle &C.uv_handle_t, suggested_size usize, mut buf C.uv_buf_t) {
	unsafe {
		buf.base = malloc(suggested_size)
		buf.len = suggested_size
	}
}

fn on_read(client &C.uv_stream_t, nread isize, buf &C.uv_buf_t) {
	if nread < 0 {
		if nread != C.UV_EOF {
			println('Read error')
		}
		C.uv_close(&C.uv_handle_t(client), on_close_cb)
		return
	}

	// C.uv_queue_work(C.uv_default_loop(), &C.uv_work_t{}, on_work, on_after_work)
	response := 'HTTP/1.1 200 OK\r\nContent-Length: 13\r\n\r\nHello, World!'

	write_req := &C.uv_write_t{}
	write_buf := C.uv_buf_init(response.str, response.len)
	C.uv_write(write_req, client, &write_buf, 1, on_write)
}

fn on_write(req &C.uv_write_t, status int) {
	if status < 0 {
		println('Write error')
	}
	unsafe {
		free(req)
	}
}

pub const tcp_server = C.uv_tcp_t{}

// Example usage
fn test_http_server() {
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
	C.uv_run(server.loop, 0)
}
