module main

import vlibuv
import vlibuv.os

struct Context {
	data int
}

fn main() {
	println(os.homedir())
	loop := vlibuv.default_loop()
	ex := Context{10}
	loop.set_data(&ex)
	println(loop.get_data())
	l := vlibuv.default_loop()
	l.set_data(&Context{20})
	println(l.get_data())
}
