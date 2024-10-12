module main

import vlibuv as uv

struct Context {
	data int
}

fn main() {
	loop := uv.default_loop()
	ex := Context{10}
	loop.set_data(&ex)
	println(loop.get_data())
	l := uv.default_loop()
	l.set_data(&Context{20})
	println(l.get_data())
	assert loop.get_data() == l.get_data()
}
