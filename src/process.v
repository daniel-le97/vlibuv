module vlibuv

// TODO need to figure out how to handle the process api

// process functions

fn C.uv_spawn(loop &C.uv_loop_t, handle &C.uv_process_t, options &C.uv_process_options_t) int

pub fn uv_spawn(loop &C.uv_loop_t, handle &C.uv_process_t, options &C.uv_process_options_t) int {
	return C.uv_spawn(loop, handle, options)
}

fn C.uv_process_kill(handle &C.uv_process_t, signum int) int

pub fn process_kill(handle &C.uv_process_t, signum int) int {
	return C.uv_process_kill(handle, signum)
}

fn C.uv_kill(pid int, signum int) int

pub fn kill(pid int, signum int) int {
	return C.uv_kill(pid, signum)
}

fn C.uv_process_get_pid(const_process &C.uv_process_t) int

struct Process {
pub mut:
	handle &C.uv_process_t
}

pub fn process_spawn(l Loop, options &C.uv_process_options_t) !int {
	p := &C.uv_process_t{}
	r := C.uv_spawn(l.loop, p, options)
	return error_checker(r)
}

pub fn (p Process) kill(signum int) !int {
	r := C.uv_process_kill(p.handle, signum)
	return error_checker(r)
}

pub fn (p Process) get_pid() int {
	return C.uv_process_get_pid(p.handle)
}
