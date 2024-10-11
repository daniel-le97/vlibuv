module vuv

// tty functions

fn C.uv_tty_init(loop &C.uv_loop_t, handle &C.uv_tty_t, fd int, readable int) int

// pub fn tty_init(loop &C.uv_loop_t, handle &C.uv_tty_t, fd int, readable int) int {
// 	return C.uv_tty_init(loop, handle, fd, readable)
// }

fn C.uv_tty_set_mode(handle &C.uv_tty_t, mode int) int

fn C.uv_tty_reset_mode() int

pub fn tty_reset_mode() int {
	return C.uv_tty_reset_mode()
}

fn C.uv_tty_get_winsize(handle &C.uv_tty_t, width &int, height &int) int

fn C.uv_tty_set_vterm_state(state int)

// pub fn tty_set_vterm_state(state Uv_tty_vtermstate) {
// 	C.uv_tty_set_vterm_state(int(state))
// }

// fn C.uv_tty_get_vterm_state(state int) int

// pub fn tty_get_vterm_state(state Uv_tty_vtermstate) !int {
// 	$if !windows {
// 		return error('not supported on this platform')
// 	}
// 	return C.uv_tty_get_vterm_state(int(state))
// }

@[flags]
pub enum Uv_tty_vtermstate {
	// The console supports handling of virtual terminal sequences
	// (Windows10 new console, ConEmu)
	tty_supported
	// The console cannot process the virtual terminal sequence.  (Legacy
	// console)
	tty_unsupported
}

@[flags]
pub enum Uv_tty_mode {
	// Initial/normal terminal mode
	normal = 0
	// Raw input mode (On Windows, ENABLE_WINDOW_INPUT is also enabled)
	raw
	//  Binary-safe I/O mode for IPC (Unix-only)
	io
}

pub struct Tty {
	Stream
}

pub fn tty_init(l &Loop, fd int, readable int) Tty {
	t := &C.uv_tty_t(unsafe { nil })
	C.uv_tty_init(l.loop, t, fd, readable)
	return Tty{Stream{Handle{t}}}
}

pub fn (t Tty) set_mode(mode Uv_tty_mode) !int {
	r := C.uv_tty_set_mode(t.handle, int(mode))
	return error_checker(r)
}

pub fn (t Tty) reset_mode() !int {
	r := C.uv_tty_reset_mode()
	return error_checker(r)
}

pub fn (t Tty) get_winsize() !(int, int) {
	width := int(0)
	height := int(0)
	r := C.uv_tty_get_winsize(t.handle, &width, &height)
	if r != 0 {
		return error('unable to get tty winsize')
	}
	return width, height
}
