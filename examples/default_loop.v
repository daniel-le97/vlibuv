module main

import vlibuv


struct Context {
	data int
}

fn main() {
	mut loop := vlibuv.Loop.default()
	ex := Context{10}
	loop.set_data(&ex) or {}
	println(loop.get_data[Context]())
	mut l := vlibuv.Loop.default()
	l.set_data(&Context{20}) or {}
	println(l.get_data[Context]())
}
