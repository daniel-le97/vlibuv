import vlibuv

fn main() {
	// Create a new loop that V owns and controls
	mut loop := vlibuv.Loop.default()
	defer {
		loop.free()
	}
	// Create a filesystem watcher using the fs module (high-level)
	mut watcher := vlibuv.new_watcher(loop)!

	defer {
		watcher.stop() or {}
	}

	// Watch the current directory for changes
	watcher.start('.', 0, fn (path string, events []vlibuv.WatchEvent) {
		event_names := events.map(|e| match e {
			.rename { 'rename' }
			.change { 'change' }
		})

		filename := if path.len > 0 { path } else { '(directory)' }
		println('Event: ${filename} - ${event_names.join(', ')}')
	})!

	println('Watching current directory for changes...')
	println('Press Ctrl+C to stop')

	// Run the event loop - UV_RUN_DEFAULT will run until there are no active handles
	for {
		run_result := loop.run(.default) or { panic(err) }
		if run_result == 0 {
			break
		}
	}
	println('Done!')
}
