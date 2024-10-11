import vuv.uv
import picohttpparser
import net.http

// Define a struct for the HTTP server
struct HttpServer {
	server &uv.Uv_tcp_t
	loop   &uv.Uv_loop_t
	// baton  &C.uv_work_t
}

fn new_http_server() HttpServer {
	loop := uv.default_loop()

	server := &uv.Uv_tcp_t{}
	// worker := &C.uv_work_t{}
	uv.tcp_init(loop, server)
	return HttpServer{server, loop}
}

fn (hs HttpServer) bind(ip string, port int) !int {
	mut addr := uv.Sockaddr_in{}
	uv.ip4_addr(&char(ip.str), port, &addr)
	addy := unsafe { &uv.Sockaddr(&addr) }
	return uv.tcp_bind(hs.server, addy, 0)
}

fn (hs HttpServer) listen() !int {
	return uv.listen(unsafe { &uv.Uv_stream_t(hs.server) }, 128, on_new_connection)
}

// Function to set TCP_NODELAY
fn (server &HttpServer) set_nodelay(enable bool) {
	uv.tcp_nodelay(server.server, if enable { 1 } else { 0 })
}

fn on_close_cb(handle &uv.Uv_handle_t) {
	unsafe {
		free(handle)
	}
}

fn on_new_connection(server &uv.Uv_stream_t, status int) {
	if status < 0 {
		println('New connection error')
		return
	}
	client := &uv.Uv_tcp_t{}
	uv.tcp_init(uv.default_loop(), client)
	if uv.accept(server, unsafe { &uv.Uv_stream_t(client) }) == 0 {
		uv.read_start(unsafe { &uv.Uv_stream_t(client) }, alloc_buffer, on_read)
	} else {
		uv.close(unsafe { &uv.Uv_handle_t(client) }, on_close_cb)
	}
}

fn alloc_buffer(handle &uv.Uv_handle_t, suggested_size usize, mut buf uv.Uv_buf_t) {
	unsafe {
		buf.base = &char(malloc(suggested_size))
		buf.len = suggested_size
	}
}

fn on_read(client &uv.Uv_stream_t, nread isize, buf &uv.Uv_buf_t) {
	if nread < 0 {
		uv.close(unsafe { &uv.Uv_handle_t(client) }, on_close_cb)
		return
	}

	request_raw := unsafe { cstring_to_vstring(buf.base) }
	mut request := picohttpparser.Request{}
	request.parse_request(request_raw) or { panic(err) }
	// println(request.path)

	mut response := http.new_response(
		body: 'hello world!'
	)

	write_req := &uv.Uv_write_t{}
	write_buf := uv.buf_init(response.bytestr().str, usize(response.bytes().len))
	uv.write(write_req, client, &write_buf, 1, on_write)
}

fn on_write(req &uv.Uv_write_t, status int) {
	if status < 0 {
		println('Write error')
	}
	unsafe {
		free(req)
	}
}

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
	uv.run(server.loop, .default)
}
