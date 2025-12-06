module vlibuv

import vlibuv.uv

// // tty functions

// fn uv.tty_init(loop &C.uv_loop_t, handle &uv.Uv_tty_t, fd int, readable int) int

// // pub fn tty_init(loop &C.uv_loop_t, handle &uv.Uv_tty_t, fd int, readable int) int {
// // 	return uv.tty_init(loop, handle, fd, readable)
// // }

// fn uv.tty_set_mode(handle &uv.Uv_tty_t, mode int) int

// fn uv.tty_reset_mode() int

// pub fn tty_reset_mode() int {
// 	return uv.tty_reset_mode()
// }

// fn uv.tty_get_winsize(handle &uv.Uv_tty_t, width &int, height &int) int

// fn uv.tty_set_vterm_state(state int)

// // pub fn tty_set_vterm_state(state Uv_tty_vtermstate) {
// // 	uv.tty_set_vterm_state(int(state))
// // }

// // fn uv.tty_get_vterm_state(state int) int

// // pub fn tty_get_vterm_state(state Uv_tty_vtermstate) !int {
// // 	$if !windows {
// // 		return error('not supported on this platform')
// // 	}
// // 	return uv.tty_get_vterm_state(int(state))
// // }

// @[flags]
// pub enum Uv_tty_vtermstate {
// 	// The console supports handling of virtual terminal sequences
// 	// (Windows10 new console, ConEmu)
// 	tty_supported
// 	// The console cannot process the virtual terminal sequence.  (Legacy
// 	// console)
// 	tty_unsupported
// }

// @[flags]
// pub enum Uv_tty_mode {
// 	// Initial/normal terminal mode
// 	normal = 0
// 	// Raw input mode (On Windows, ENABLE_WINDOW_INPUT is also enabled)
// 	raw
// 	//  Binary-safe I/O mode for IPC (Unix-only)
// 	io
// }

pub struct Tty {
	Stream
}

pub fn Tty.new(l &Loop, fd int, readable bool) !Tty {
	t := &uv.Uv_tty_t{}
	uv.tty_init(l.loop, t, fd, bool_to_int(readable))
	return Tty{
		Stream: Stream{
			Handle: Handle{
				handle: unsafe { &uv.Uv_handle_t(t) }
				closed: false
			}
		}
	}
}

pub fn (t Tty) set_mode(mode uv.Uv_tty_mode) !int {
	r := uv.tty_set_mode(t.to_tty(), mode)
	return error_checker(r)
}

pub fn (t Tty) reset_mode() !int {
	r := uv.tty_reset_mode()
	return error_checker(r)
}

pub fn (t Tty) get_winsize() !(int, int) {
	width := 0
	height := 0
	r := uv.tty_get_winsize(t.to_tty(), &width, &height)
	error_checker(r)!
	return width, height
}

pub fn (t Tty) set_vterm_state(state uv.Uv_tty_vtermstate) ! {
	$if !windows {
		return error('not supported on this platform')
	}
	uv.tty_set_vterm_state(state)
}

pub fn (t Tty) to_tty() &uv.Uv_tty_t {
	unsafe {
		return &uv.Uv_tty_t(t.handle)
	}
}
