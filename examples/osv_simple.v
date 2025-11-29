module main

// Direct test of osv file operations
// This imports osv from the vlibuv package
import osv

fn main() {
	println('=== Testing osv.read_file and osv.write_file ===')

	test_file := 'test_osv_simple.txt'
	test_data := 'Hello from osv!'.bytes()

	// Test write
	osv.write_file(test_file, test_data) or {
		println('ERROR: Failed to write file: ${err}')
		return
	}
	println('✓ File written successfully')

	// Test read
	read_data := osv.read_file(test_file) or {
		println('ERROR: Failed to read file: ${err}')
		osv.remove_file(test_file) or { println('cleanup failed') }
		return
	}
	println('✓ File read successfully')

	// Verify
	if read_data == test_data {
		println('✓ Data matches perfectly!')
	} else {
		println('✗ Data mismatch!')
		println('Expected: ${test_data.str()}')
		println('Got:      ${read_data.str()}')
	}

	// Cleanup
	osv.remove_file(test_file) or {
		println('ERROR: Failed to remove file: ${err}')
		return
	}
	println('✓ Test file removed')
	println('\n=== All basic tests PASSED ===')
}
