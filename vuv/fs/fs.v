module fs

import vuv

pub fn read_file(path string, cb fn (err string, data string)) {
	req := &vuv.Uv_fs_t{}
	vuv.fs_read(vuv.default_loop(), req, path.str, 0, -1, fn (req &vuv.Uv_fs_t) {
		if req.result < 0 {
			cb(vuv.strerror(req.result), '')
		} else {
			data := string(req.ptr, req.result)
			cb('', data)
		}
		vuv.fs_req_cleanup(req)
	})
}

pub fn write_file(path string, data string, cb fn (err string)) {
	req := &vuv.Uv_fs_t{}

	vuv.fs_write(vuv.default_loop(), req, path.str, data.str, data.len, 0, fn (req &vuv.Uv_fs_t) {
		if req.result < 0 {
			cb(vuv.strerror(req.result))
		} else {
			cb('')
		}
		vuv.fs_req_cleanup(req)
	})
}
