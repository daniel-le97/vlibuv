module main

import vlibuv

// This is a simplified HTTP server using the high-level API wrapper
// For a more complete TCP server example, see http_server_uv.v which uses the lower-level bindings

fn listen_callback(server vlibuv.Stream, status int) {

	if status < 0 {
		println('error in listen_callback')
		return
	}
	println('New client connected!')
}

fn main() {
	mut loop := vlibuv.Loop.default()
	println('HTTP server example - high-level API not yet fully implemented')
	println('Use http_server_uv.v for a complete TCP server example')
}
