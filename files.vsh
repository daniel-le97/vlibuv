
import os
import regex

fn get_files(cmd string, ext string) {
	println(cmd)
	files := os.walk_ext(cmd, ext)
	for file in files {
		println(file)
	}
}

// get_files('/Users/daniel/homelab/GitHub/languages/v-projects/native/libuv-test', '.git')
// get_files('/Users/daniel/homelab/GitHub/languages/v-projects/native/libuv-test/libuv/src', '.c')
// println('-------------------')

// get_files('/Users/daniel/homelab/GitHub/languages/v-projects/native/libuv-test/libuv/include', '.h')
