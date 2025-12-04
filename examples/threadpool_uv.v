module main

import vlibuv.uv

// Example showing how to queue work using the low-level `uv` bindings.
// This uses `uv.queue_work` with a work callback and a completion callback.

pub struct Example {
	age int
}

fn work_cb(req &uv.Uv_work_t) {
	println('work_cb (running in threadpool)')
	// retrieve data pointer
	data := req.data
	unsafe {
		if data != nil {
			ex := &Example(data)
			println('  example.age (inside work): ${ex.age}')
		} else {
			println('  no data')
		}
	}
}

fn after_work_cb(req &uv.Uv_work_t, status int) {
	println('after_work_cb (on loop thread), status: ${status}')
	data := req.data
	unsafe {
		if data != nil {
			ex := &Example(data)
			println('  example.age (after): ${ex.age}')
		}
	}
	// stop the default loop so the program can exit
	loop := uv.default_loop()
	uv.stop(loop)
}

fn main() {
	println('Thread pool example using low-level `uv` bindings')

	loop := uv.default_loop()

	// allocate a work request (heap-allocated via composite literal)
	mut work := &uv.Uv_work_t{}

	// prepare example data (heap allocated)
	ex := &Example{
		age: 123
	}

	// attach example pointer to the request
	work.data = ex

	// queue the work
	uv.queue_work(loop, work, work_cb, after_work_cb)

	// run the loop until after_work_cb calls uv.stop
	uv.run(loop, uv.Mode.default)

	println('main: done')
}
