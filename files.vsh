import os
import regex

fn get_files(cmd string, ext string) {
	println(cmd)
	files := os.walk_ext(cmd, ext)
	for file in files {
		println(file)
	}
}
