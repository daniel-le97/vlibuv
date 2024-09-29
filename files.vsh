import os
import regex
import vuv.fs

fn get_files(cmd string, ext string) {
	println(cmd)
	files := os.walk_ext(cmd, ext)
	for file in files {
		println(file)
	}
	fs.read_file(cmd, fn (err string, data string) {
		if err != '' {
			println(err)
		} else {
			println(data)
		}
	})
}
