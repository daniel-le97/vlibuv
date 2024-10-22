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
	loop := vlibuv.default_loop()
	mut work := vlibuv.new_work()
	work.set_data(&Example{200})
	unsafe {
		println(work.get_data())
		// assert &Example(work.get_data()).age == 200
		println(&Example(work.get_data()))
	}
	// buf := vlibuv.Buf
	loop.queue_work(mut work, work_cb, after_work_cb)
	loop.run(.default) or { panic(err) }
}
