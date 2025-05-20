module test

import vlibuv as uv

struct Example {
	age int
}

fn test_default_loop() {
	loop := uv.default_loop()
	ex := Example{10}
	loop.set_data(&ex)
	l := uv.default_loop()
	l.set_data(&Example{20})
	assert loop.get_data() == l.get_data()
}
