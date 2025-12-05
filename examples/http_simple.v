module main

import vlibuv

fn main() {
	// Create event loop - default loop does not return error
	loop := vlibuv.Loop.default()

	// Create TCP server
	mut server := vlibuv.Tcp.new(loop)!

	// Bind to localhost:8080
	addr := vlibuv.new_ipv4_addr('127.0.0.1', 8080)
	server.bind(addr, 0)!

	// Listen for incoming connections
	server.listen_simple(128, fn ( mut req vlibuv.Request, mut res vlibuv.Response,) {
		response := 'HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\nContent-Length: 13\r\n\r\nHello, World!'
		res.write(response) or {  }
	}) or { panic(err) }

	println('HTTP server listening on http://127.0.0.1:8080')
	println('Try: curl http://127.0.0.1:8080')
	println('Press Ctrl+C to stop\n')

	// Run the event loop
	loop.run(.default) or { panic(err) }

	println('Server stopped')
}
