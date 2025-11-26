module main

import vlibuv

pub struct Example {
	age int
}

fn work_cb(mut req vlibuv.Work) {
	println('work_cb')
	unsafe {
		println(req.get_data())
		println(&Example(req.get_data()))
	}
	mut ex := Example{100}
	req.set_data(&ex)
	unsafe {
		println(req.get_data())
		println(&Example(req.get_data()))
	}
}

fn after_work_cb(mut req vlibuv.Work, status int) {
	println('after_work_cb')
	unsafe {
		println(req.get_data())
		println(&Example(req.get_data()))
	}
}

fn main() {
	println('Thread pool example using high-level API is not yet fully implemented')
	println('The threadpool example requires queue_work which is not yet exposed in the high-level wrapper')
}
