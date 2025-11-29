// import vlibuv.uv
// import fs

// fn main() {
// 	// Create a new loop that V owns and controls
// 	mut loop := uv.Uv_loop_t{}
// 	result := uv.loop_init(loop)
// 	if result < 0 {
// 		println('Failed to initialize loop')
// 		unsafe { free(loop) }
// 		return
// 	}
// 	defer {
// 		uv.loop_close(loop)
// 		unsafe { free(loop) }
// 	}

// 	// Create a filesystem watcher using the fs module (high-level)
// 	mut watcher := fs.new_watcher(loop)!

// 	defer {
// 		watcher.stop() or {}
// 	}

// 	// Watch the current directory for changes
// 	watcher.start('.', 0, fn (path string, events []fs.EventType, status int) {
// 		println('DEBUG: Callback triggered!')
// 		if status < 0 {
// 			println('Error watching directory')
// 			return
// 		}

// 		event_names := events.map(|e| match e {
// 			.rename { 'rename' }
// 			.change { 'change' }
// 		})

// 		filename := if path.len > 0 { path } else { '(directory)' }
// 		println('Event: ${filename} - ${event_names.join(', ')}')
// 	})!

// 	println('Watching current directory for changes...')
// 	println('Press Ctrl+C to stop')

// 	// Run the event loop - UV_RUN_DEFAULT will run until there are no active handles
// 	for {
// 		run_result := uv.run(loop, .default)
// 		if run_result == 0 {
// 			break
// 		}
// 	}

// 	// Cleanup happens automatically via destructors
// 	println('Done!')
// }
