module main

import vlibuv
import vlibuv.uv

fn main() {
	// Create a new event loop
	mut loop := vlibuv.Loop.new() or {
		eprintln('Failed to create loop: ${err}')
		return
	}
	defer {
		loop.close() or {}
	}

	// Create TCP server
	mut server := vlibuv.Tcp.new(loop) or {
		eprintln('Failed to create TCP server: ${err}')
		return
	}

	// Bind to localhost:8000
	addr := vlibuv.new_ipv4_addr('127.0.0.1', 8000)
	server.bind(addr, 0) or {
		eprintln('Failed to bind: ${err}')
		return
	}

	// Listen for connections with inline callback
	server.Stream.listen(128, fn (server vlibuv.Stream, status int) {
		if status < 0 {
			eprintln('Error on listen: ${status}')
			return
		}

		// Get the loop from the server handle
		loop := server.Handle.get_loop() or {
			eprintln('Failed to get loop from handle')
			return
		}

		// Create a new TCP handle for the client
		client_tcp := vlibuv.Tcp.new(loop) or {
			eprintln('Failed to create TCP client: ${err}')
			return
		}

		// Accept the connection
		accept_result := server.accept(&client_tcp.Stream)
		if accept_result < 0 {
			eprintln('Failed to accept connection: ${accept_result}')
			return
		}

		println('New client connected!')

		// Start reading from the client
		client_tcp.Stream.read_start(fn (handle vlibuv.Handle, suggested_size usize, buf &vlibuv.Buffer) {
			// Allocate buffer for reading
			size := if suggested_size == 0 { usize(65536) } else { suggested_size }
			unsafe {
				buf.base = []u8{len: int(size)}
				buf.buf = uv.buf_init(buf.base.data, size)
			}
		}, fn (stream vlibuv.Stream, nread isize, buf &vlibuv.Buffer) {
			// In libuv read callbacks, we need to handle EOF and errors
			// Handle EOF first - nread == 0 means client closed connection
			if nread == 0 {
				println('Client disconnected (EOF)')
				// We can't call read_stop/close directly since stream is immutable
				// Instead, returning from the callback will just wait for next event
				// The connection will be cleaned up when client closes
				return
			}

			// Handle actual errors (negative nread, excluding EOF which is 0)
			if nread < 0 {
				eprintln('Read error: ${nread} (could be ENOBUFS or connection reset)')
				// Return to stop trying to read from this connection
				return
			}

			// Get the request data
			request_data := buf.base[..int(nread)]
			request := request_data.bytestr()
			println('Received ${nread} bytes')

			// Parse first line
			lines := request.split('\n')
			if lines.len > 0 {
				request_line := lines[0].trim_space()
				println('> ${request_line}')
			}

			// Send HTTP response
			response := 'HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\nContent-Length: 13\r\nConnection: close\r\n\r\nHello, World!'

			stream.write_string(response, fn (s2 vlibuv.Stream, write_status int) {
				if write_status < 0 {
					eprintln('Write failed: ${write_status}')
				} else {
					println('Response sent')
				}
			}) or { eprintln('Failed to write response: ${err}') }
		}) or { eprintln('Failed to start reading: ${err}') }
	}) or {
		eprintln('Failed to listen: ${err}')
		return
	}

	println('HTTP server listening on 127.0.0.1:8000')
	println('Try: curl http://127.0.0.1:8000/')

	// Run the event loop
	loop.run(uv.Mode.default) or {
		eprintln('Loop error: ${err}')
		return
	}

	println('Server stopped')
}
