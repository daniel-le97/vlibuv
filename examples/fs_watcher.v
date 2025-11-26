import vlibuv

fn main() {
	mut loop := vlibuv.Loop.new()!

	// Create a filesystem watcher
	mut watcher := vlibuv.FsEvent.new(loop)!

	defer {
		watcher.stop() or {}
		loop.close() or {}
	}

	// Watch the current directory for changes
	watcher.start('.', 0, fn (path string, events []vlibuv.FsEventType, status int) {
		if status < 0 {
			println('Error: ${vlibuv.get_error_message(status)}')
			return
		}

		event_names := events.map(|e| match e {
			.rename { 'rename' }
			.change { 'change' }
		})

		filename := if path.len > 0 { path } else { '(directory)' }
		println('Event: ${filename} - ${event_names.join(", ")}')
	})!

	println('Watching current directory for changes...')
	println('Press Ctrl+C to stop')

	// Run the event loop
	loop.run(.default)!

	// Cleanup happens automatically via destructors


	println('Done!')
}
