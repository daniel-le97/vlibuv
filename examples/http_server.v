module main

import vlibuv
import vlibuv.uv

fn on_write(req &uv.Uv_write_t, status int) {
	if status < 0 {
		println('Write error')
	}
	unsafe {
		free(req)
	}
}

fn main() {
	// Create event loop - default loop does not return error
	loop := vlibuv.Loop.default()

	// Create TCP server
	mut server := vlibuv.Tcp.new(loop)!

	// Bind to localhost:8080
	addr := vlibuv.new_ipv4_addr('127.0.0.1', 8080)
	server.bind(addr, 0)!

	// Listen for incoming connections
	server.listen(128, fn (stream vlibuv.Stream, status int) {
		if status < 0 {
			eprintln('Listen error: ${status}')
			return
		}

		// Accept new client connection
		loop := stream.get_loop() or {
			eprintln('Failed to get loop from stream')
			return
		}

		mut client_tcp := vlibuv.Tcp.new(loop) or {
			eprintln('Failed to create TCP handle: ${err}')
			return
		}

		// Cast Tcp to Stream for accept call (Tcp embeds Stream)
		accept_result := stream.accept(client_tcp.Stream)
		if accept_result != 0 {
			eprintln('Accept error: ${accept_result}')
			return
		}

		println('New client connected!')

		// Start reading from client
		client_tcp.read_start( // Allocation callback - prepare buffer for reading
		 fn (mut handle vlibuv.Handle, suggested_size usize, buf &uv.Uv_buf_t) {
			unsafe {
				buf.base = []u8{len: int(suggested_size)}.data
				buf.len = suggested_size
			}
		}, // Read callback - handle incoming data
		 fn (mut stream vlibuv.Stream, nread isize, buf &uv.Uv_buf_t) {
			if nread < 0 {
				// Client closed or error
				println('Client disconnected or read error: ${nread}')
				stream.read_stop()
				stream.close() or {}
				return
			}

			if nread == 0 {
				return
			}

			response := 'HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\nContent-Length: 13\r\n\r\nHello, World!'

			// write_req := &uv.Uv_write_t{}
			// write_buf := uv.buf_init(response.str, usize(response.len))
			// uv.write(write_req, stream.to_stream(), &write_buf, 1, on_write)

			stream.write_string(response) or { 'failed' }
		}) or { panic('failed to read') }
	})!

	println('HTTP server listening on http://127.0.0.1:8080')
	println('Try: curl http://127.0.0.1:8080')
	println('Press Ctrl+C to stop\n')

	// Run the event loop
	loop.run(uv.Mode.default) or { panic(err) }

	println('Server stopped')
}
