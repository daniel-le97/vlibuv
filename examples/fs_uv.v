module main

import vlibuv.uv
import os

// Simplified async file operations demo
// Shows true non-blocking I/O using libuv callbacks

fn main() {
	println('=== vlibuv Async File Operations ===\n')

	// Create test file
	test_content := 'Hello from async libuv!\nLine 2\nLine 3'
	os.write_file('async_test.txt', test_content) or {
		eprintln('Failed to create test file: ${err}')
		return
	}
	println('[Created] async_test.txt')

	// Get event loop
	loop := uv.default_loop()

	println('\nAsync file operation chain:')
	println('1. stat file')
	println('2. open file (in stat callback)\n')

	// Queue the first operation
	mut stat_req := uv.Uv_fs_t{}
	println('Queuing: fs_stat...')

	uv.fs_stat(loop, &stat_req, c'async_test.txt', fn (req &uv.Uv_fs_t) {
		stat_result := uv.fs_get_result(req)
		if stat_result < 0 {
			eprintln('stat failed: ${stat_result}')
			return
		}
		println('[CALLBACK 1] stat succeeded')

		// Queue open in stat callback
		mut open_req := uv.Uv_fs_t{}
		println('Queuing: fs_open...')

		uv.fs_open(req.loop, &open_req, c'async_test.txt', 0, 0, fn (req2 &uv.Uv_fs_t) {
			open_result := uv.fs_get_result(req2)
			if open_result < 0 {
				eprintln('open failed: ${open_result}')
				return
			}
			fd := open_result
			println('[CALLBACK 2] open succeeded (fd=${fd})')
			println('\nAll async operations completed!')
		})
	})

	// Run event loop - processes callbacks
	println('\nRunning event loop...')
	uv.run(loop, uv.Mode.default)

	// Cleanup
	os.rm('async_test.txt') or {}
	println('Cleaned up test file')
}
