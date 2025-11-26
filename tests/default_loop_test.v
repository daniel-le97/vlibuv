module test

import vlibuv

struct Context {
	data int
}

fn test_default_loop() {
	mut loop := vlibuv.Loop.default()
	ex := Context{10}
	loop.set_data(&ex)!
	println(loop.get_data())
	mut l := vlibuv.Loop.default()
	l.set_data(&Context{20})!
	println(l.get_data())
}
