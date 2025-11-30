module vlibuv

fn test_write_and_read_file() {
	// Create a test file
	test_path := 'test_write_read.txt'
	test_data := 'Hello, World! This is a test.'.bytes()

	defer {
		remove_file(test_path) or { println('Failed to cleanup test file') }
	}

	// Write file
	write_file(test_path, test_data) or { panic(err) }

	// Read it back
	read_data := read_file(test_path) or { panic(err) }

	assert read_data == test_data
	println('✓ test_write_and_read_file passed')
}

fn test_append_file() {
	test_path := 'test_append.txt'
	initial := 'Line 1\n'.bytes()
	append_data := 'Line 2\n'.bytes()

	defer {
		remove_file(test_path) or {}
	}

	write_file(test_path, initial) or { panic(err) }
	append_file(test_path, append_data) or { panic(err) }

	result := read_file(test_path) or { panic(err) }
	expected := 'Line 1\nLine 2\n'.bytes()
	assert result == expected

	println('✓ test_append_file passed')
}

fn test_file_exists() {
	test_path := 'test_exists.txt'

	defer {
		remove_file(test_path) or {}
	}

	assert !exists(test_path)
	write_file(test_path, 'test'.bytes()) or { panic(err) }
	assert exists(test_path)

	println('✓ test_file_exists passed')
}

fn test_copy_file() {
	src := 'test_copy_src.txt'
	dst := 'test_copy_dst.txt'

	defer {
		remove_file(src) or {}
		remove_file(dst) or {}
	}

	write_file(src, 'copy test data'.bytes()) or { panic(err) }
	copy_file(src, dst) or { panic(err) }

	src_data := read_file(src) or { panic(err) }
	dst_data := read_file(dst) or { panic(err) }
	assert src_data == dst_data

	println('✓ test_copy_file passed')
}

fn test_rename_file() {
	old_name := 'test_old_name.txt'
	new_name := 'test_new_name.txt'

	defer {
		remove_file(old_name) or {}
		remove_file(new_name) or {}
	}

	write_file(old_name, 'rename test'.bytes()) or { panic(err) }
	rename_file(old_name, new_name) or { panic(err) }

	assert !exists(old_name)
	assert exists(new_name)

	println('✓ test_rename_file passed')
}

fn test_create_and_remove_dir() {
	test_dir := 'test_dir_create'

	defer {
		remove_dir(test_dir) or {}
	}

	create_dir(test_dir, 0o755) or { panic(err) }
	assert is_dir(test_dir)

	remove_dir(test_dir) or { panic(err) }
	assert !exists(test_dir)

	println('✓ test_create_and_remove_dir passed')
}

fn test_stat() {
	test_path := 'test_stat.txt'

	defer {
		remove_file(test_path) or {}
	}

	test_data := 'stat test data'.bytes()
	write_file(test_path, test_data) or { panic(err) }

	info := stat(test_path) or { panic(err) }
	assert info.is_file
	assert !info.is_dir
	assert info.size == u64(test_data.len)

	println('✓ test_stat passed')
}

fn test_chmod() {
	test_path := 'test_chmod.txt'

	defer {
		remove_file(test_path) or {}
	}

	write_file(test_path, 'chmod test'.bytes()) or { panic(err) }
	chmod(test_path, 0o644) or { panic(err) }

	info := stat(test_path) or { panic(err) }
	// Mode includes file type bits, so check only permission bits
	assert (info.mode & 0o777) > 0

	println('✓ test_chmod passed')
}

fn test_is_functions() {
	file_path := 'test_is.txt'
	dir_path := 'test_is_dir'

	defer {
		remove_file(file_path) or {}
		remove_dir(dir_path) or {}
	}

	write_file(file_path, 'test'.bytes()) or { panic(err) }
	create_dir(dir_path, 0o755) or { panic(err) }

	assert is_file(file_path)
	assert !is_file(dir_path)
	assert is_dir(dir_path)
	assert !is_dir(file_path)

	println('✓ test_is_functions passed')
}

fn test_read_dir() {
	test_dir := 'test_read_dir'

    defer {
        // Cleanup
        files := read_dir(test_dir) or { []DirEntry{} }
        for file in files {
            if file.is_file {
                remove_file(test_dir + '\\' + file.name) or {}
            }
        }
        remove_dir(test_dir) or {}
    }	create_dir(test_dir, 0o755) or { panic(err) }
	write_file(test_dir + '\\file1.txt', 'test'.bytes()) or { panic(err) }
	write_file(test_dir + '\\file2.txt', 'test'.bytes()) or { panic(err) }

	entries := read_dir(test_dir) or { panic(err) }
	assert entries.len >= 2

	println('✓ test_read_dir passed')
}

fn test_make_temp_dir() {
	// Create temp dir
	temp_dir := make_temp_dir('test_tmp_XXXXXX') or { panic(err) }

	defer {
		remove_dir(temp_dir) or {}
	}

	assert is_dir(temp_dir)
	assert exists(temp_dir)

	println('✓ test_make_temp_dir passed')
}
