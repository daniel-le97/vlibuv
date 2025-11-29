module main

import vlibuv

fn main() {
	env := vlibuv.environ() or {
		println('Failed to get environment variables: $err')
		return
	}
	println('Environment Variables:')
	for item in env {
		println('${item.name}=${item.value}')
	}
}
