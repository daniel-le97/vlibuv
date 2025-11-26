module main

import vlibuv

struct Counter {
mut:
	value int
}

fn main() {
	mut loop := vlibuv.Loop.default()

	// Create a timer that fires once after 1 second
	mut timer := vlibuv.Timer.new(loop)!

	mut counter := &Counter{0}

	// Start the timer with 1000ms (1 second) timeout and no repeat
	timer.start(1000, 0, fn [mut counter]() {
		counter.value++
		println('Timer fired! Count: ${counter.value}')
	})!

	println('Timer started. Waiting for callback...')

	// Run the event loop
	loop.run(int(vlibuv.Mode.default)) or { panic(err) }

	println('Done! Timer was called ${counter.value} time(s)')
	unsafe { free(counter) }
}
