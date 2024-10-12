module vlibuv

// pipe functions

fn C.uv_pipe_init(loop &C.uv_loop_t, handle &C.uv_pipe_t, ipc int) int

// pub fn pipe_init(loop &C.uv_loop_t, handle &C.uv_pipe_t, ipc int) int {
// 	return C.uv_pipe_init(loop, handle, ipc)
// }

fn C.uv_pipe_open(handle &C.uv_pipe_t, file int) int

// pub fn pipe_open(handle &C.uv_pipe_t, file int) int {
// 	return C.uv_pipe_open(handle, file)
// }

fn C.uv_pipe_bind(handle &C.uv_pipe_t, name &char) int

// pub fn pipe_bind(handle &C.uv_pipe_t, const_name &char) int {
// 	return C.uv_pipe_bind(handle, const_name)
// }

fn C.uv_pipe_bind2(handle &C.uv_pipe_t, const_name &char, namelen usize, flags usize) int

// pub fn pipe_bind2(handle &C.uv_pipe_t, const_name &char, namelen usize, flags usize) int {
// 	return C.uv_pipe_bind2(handle, const_name, namelen, flags)
// }

fn C.uv_pipe_connect(req &C.uv_connect_t, handle &C.uv_pipe_t, name &char, cb fn (req &C.uv_connect_t, status int))

// pub fn pipe_connect(req &C.uv_connect_t, handle &C.uv_pipe_t, const_name &char, cb fn (req &C.uv_connect_t, status int)) {
// 	C.uv_pipe_connect(req, handle, const_name, cb)
// }

fn C.uv_pipe_connect2(req &C.uv_connect_t, handle &C.uv_pipe_t, const_name &char, namelen usize, flags usize, cb fn (req &C.uv_connect_t, status int)) int

// pub fn pipe_connect2(req &C.uv_connect_t, handle &C.uv_pipe_t, const_name &char, namelen usize, flags usize, cb fn (req &C.uv_connect_t, status int)) int {
// 	return C.uv_pipe_connect2(req, handle, const_name, namelen, flags, cb)
// }

fn C.uv_pipe_getsockname(handle &C.uv_pipe_t, buffer &char, size &usize) int

// pub fn pipe_getsockname(handle &C.uv_pipe_t, name &char, namelen &usize) int {
// 	return C.uv_pipe_getsockname(handle, name, namelen)
// }

fn C.uv_pipe_getpeername(handle &C.uv_pipe_t, buffer &char, size &usize) int

// pub fn pipe_getpeername(handle &C.uv_pipe_t, name &char, namelen &usize) int {
// 	return C.uv_pipe_getpeername(handle, name, namelen)
// }

fn C.uv_pipe_pending_instances(handle &C.uv_pipe_t, count int)

// pub fn pipe_pending_instances(handle &C.uv_pipe_t, count int) {
// 	C.uv_pipe_pending_instances(handle, count)
// }

fn C.uv_pipe_pending_count(handle &C.uv_pipe_t) int

// pub fn pipe_pending_count(handle &C.uv_pipe_t) int {
// 	return C.uv_pipe_pending_count(handle)
// }

fn C.uv_pipe_pending_type(handle &C.uv_pipe_t) int

// pub fn pipe_pending_type(handle &C.uv_pipe_t) int {
// 	return C.uv_pipe_pending_type(handle)
// }

fn C.uv_pipe_chmod(handle &C.uv_pipe_t, flags int) int

// pub fn pipe_chmod(handle &C.uv_pipe_t, flags int) int {
// 	return C.uv_pipe_chmod(handle, flags)
// }

pub struct Pipe {
	Stream
}

pub fn pipe_init(l &Loop, is_ipc bool) Pipe {
	p := &C.uv_pipe_t{}
	C.uv_pipe_init(l.loop, p, bool_to_int(is_ipc))
	return Pipe{Stream{Handle{p}}}
}

pub fn (p Pipe) open(file int) int {
	return C.uv_pipe_open(p.handle, file)
}

pub fn (p Pipe) chmod(flags int) int {
	return C.uv_pipe_chmod(p.handle, flags)
}

pub fn (p Pipe) bind(name string) int {
	return C.uv_pipe_bind(p.handle, charptr(name.str))
}

pub fn (p Pipe) bind2(name string, namelen usize, flags usize) int {
	return C.uv_pipe_bind2(p.handle, charptr(name.str), namelen, flags)
}
