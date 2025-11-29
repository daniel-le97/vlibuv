module main

import vlibuv.osv

fn main() {
	println('===== vlibuv File System API Examples =====\n')

	// Example 1: Writing and reading files
	println('1. Write and read files:')
	data := 'Hello from vlibuv!'.bytes()
	osv.write_file('example.txt', data) or {
		eprintln('Error writing file: ${err}')
		return
	}

	read_data := osv.read_file('example.txt') or {
		eprintln('Error reading file: ${err}')
		return
	}
	println('   Written: ${data}')
	println('   Read back: ${read_data}\n')

	// Example 2: Check file properties
	println('2. Check file properties:')
	if osv.exists('example.txt') {
		println('   File exists: true')
		println('   Is file: ${osv.is_file('example.txt')}')
		println('   Is directory: ${osv.is_dir('example.txt')}')

		info := osv.stat('example.txt') or {
			eprintln('Error getting stat: ${err}')
			return
		}
		println('   Size: ${info.size} bytes\n')
	}

	// Example 3: Append to file
	println('3. Append to file:')
	append_data := '\nAppended line'.bytes()
	osv.append_file('example.txt', append_data) or {
		eprintln('Error appending: ${err}')
		return
	}

	updated := osv.read_file('example.txt') or {
		eprintln('Error reading: ${err}')
		return
	}
	println('   Content after append: ${updated}\n')

	// Example 4: Copy file
	println('4. Copy file:')
	osv.copy_file('example.txt', 'example_copy.txt') or {
		eprintln('Error copying: ${err}')
		return
	}
	println('   Copied to example_copy.txt\n')

	// Example 5: Rename file
	println('5. Rename file:')
	osv.rename_file('example_copy.txt', 'example_backup.txt') or {
		eprintln('Error renaming: ${err}')
		return
	}
	println('   Renamed to example_backup.txt\n')

	// Example 6: Directory operations
	println('6. Directory operations:')
	osv.create_dir('test_directory', 0o755) or {
		eprintln('Error creating dir: ${err}')
		return
	}
	println('   Created: test_directory')

	osv.write_file('test_directory/file1.txt', 'content 1'.bytes()) or {
		eprintln('Error writing file: ${err}')
		return
	}
	osv.write_file('test_directory/file2.txt', 'content 2'.bytes()) or {
		eprintln('Error writing file: ${err}')
		return
	}
	println('   Created files in directory')

	// Example 7: List directory
	println('7. List directory contents:')
	entries := osv.read_dir('test_directory') or {
		eprintln('Error reading dir: ${err}')
		return
	}
	for entry in entries {
		file_type := if entry.is_dir { 'DIR' } else { 'FILE' }
		println('   [${file_type}] ${entry.name}')
	}
	println()

	// Example 8: Permissions
	println('8. Change file permissions:')
	osv.chmod('example.txt', 0o644) or {
		eprintln('Error changing permissions: ${err}')
		return
	}
	println('   Changed permissions to 0o644\n')

	// Example 9: Temporary files
	println('9. Create temporary directory:')
	temp_dir := osv.make_temp_dir('vlibuv_tmp_XXXXXX') or {
		eprintln('Error creating temp dir: ${err}')
		return
	}
	println('   Created temporary directory: ${temp_dir}')
	println('   Is directory: ${osv.is_dir(temp_dir)}\n')

	// Example 10: File watching (event-based)
	println('10. Watch file for changes (example):')
	println('   Creating a simple file watcher...')

	// Note: This is just a demo. In a real app you'd run the event loop
	// and watch for file changes over time.
	watch_file := 'watch_example.txt'
	osv.write_file(watch_file, 'initial content'.bytes()) or {
		eprintln('Error: ${err}')
		return
	}
	println('   File watcher would monitor: ${watch_file}\n')

	// Cleanup
	println('Cleaning up...')
	osv.remove_file('example.txt') or {
		eprintln('Error removing file: ${err}')
	}
	osv.remove_file('example_backup.txt') or {
		eprintln('Error removing file: ${err}')
	}
	osv.remove_file('watch_example.txt') or {
		eprintln('Error removing file: ${err}')
	}
	osv.remove_file('test_directory/file1.txt') or {
		eprintln('Error removing file: ${err}')
	}
	osv.remove_file('test_directory/file2.txt') or {
		eprintln('Error removing file: ${err}')
	}
	osv.remove_dir('test_directory') or {
		eprintln('Error removing dir: ${err}')
	}
	osv.remove_dir(temp_dir) or {
		eprintln('Error removing temp dir: ${err}')
	}

	println('Done!')
}
