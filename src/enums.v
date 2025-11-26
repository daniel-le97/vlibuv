module vlibuv

@[flags]
pub enum Uv_dirent_type {
	unknown = 0
	file
	dir
	link
	fifo
	socket
	char
	block
}

@[flags]
pub enum Uv_tcp_flags {
	ipv6_only = 1
	reuse_port
}

@[flags]
pub enum Uv_udp_flags {
	// Disables dual stack mode.
	ipv6_only = 1
	// Indicates message was truncated because read buffer was too small. The
	// remainder was discarded by the OS. Used in uv_udp_recv_cb.
	partial = 2
	// Indicates if SO_REUSEADDR will be set when binding the handle.
	// This sets the SO_REUSEPORT socket flag on the BSDs (except for
	// DragonFlyBSD), OS X, and other platforms where SO_REUSEPORTs don't
	// have the capability of load balancing, as the opposite of what
	// UV_UDP_REUSEPORT would do. On other Unix platforms, it sets the
	// SO_REUSEADDR flag. What that means is that multiple threads or
	// processes can bind to the same address without error (provided
	// they all set the flag) but only the last one to bind will receive
	// any traffic, in effect "stealing" the port from the previous listener.
	reuseaddr = 4

	// Indicates that the message was received by recvmmsg, so the buffer provided
	// must not be freed by the recv_cb callback.
	mmsg_chunk = 8

	// Indicates that the buffer provided has been fully utilized by recvmmsg and
	// that it should now be freed by the recv_cb callback. When this flag is set
	// in uv_udp_recv_cb, nread will always be 0 and addr will always be NULL.
	mmsg_free = 16

	// Indicates if IP_RECVERR/IPV6_RECVERR will be set when binding the handle.
	// This sets IP_RECVERR for IPv4 and IPV6_RECVERR for IPv6 UDP sockets on
	// Linux. This stops the Linux kernel from suppressing some ICMP error
	// messages and enables full ICMP error reporting for faster failover.
	// This flag is no-op on platforms other than Linux.
	linux_recverr = 32

	// Indicates if SO_REUSEPORT will be set when binding the handle.
	// This sets the SO_REUSEPORT socket option on supported platforms.
	// Unlike UV_UDP_REUSEADDR, this flag will make multiple threads or
	// processes that are binding to the same address and port "share"
	// the port, which means incoming datagrams are distributed across
	// the receiving sockets among threads or processes.
	//
	// This flag is available only on Linux 3.9+, DragonFlyBSD 3.6+,
	// FreeBSD 12.0+, Solaris 11.4, and AIX 7.2.5+ for now.
	reuseport = 64
	// Indicates that recvmmsg should be used, if available.
	recvmmsg = 256
}

// @[flags]
// pub enum Uv_tty_mode {
// 	// Initial/normal terminal mode
// 	normal = 0
// 	// Raw input mode (On Windows, ENABLE_WINDOW_INPUT is also enabled)
// 	raw
// 	//  Binary-safe I/O mode for IPC (Unix-only)
// 	io
// }

// @[flags]
// pub enum Uv_tty_vtermstate {
// 	// The console supports handling of virtual terminal sequences
// 	// (Windows10 new console, ConEmu)
// 	tty_supported
// 	// The console cannot process the virtual terminal sequence.  (Legacy
// 	// console)
// 	tty_unsupported
// }

@[flags]
pub enum Uv_stdio_flags {
	ignore         = 0x00
	create_pipe    = 0x01
	inherit_fd     = 0x02
	inherit_stream = 0x04
	readable_pipe  = 0x10
	writable_pipe  = 0x20
	nonblock_pipe  = 0x40
	// overlapped_pipe = 64
}

@[flags]
pub enum Uv_process_flags {
	setuid
	setgid
	windows_verbatim_arguments
	detached
	windows_hide
	windows_hide_console
	windows_hide_gui
	windows_file_path_exact_name
}

@[flags]
pub enum Uv_fs_type {
	unknown = -1
	custom
	open
	close
	read
	write
	sendfile
	stat
	lstat
	fstat
	ftruncate
	utime
	futime
	access
	chmod
	fchmod
	fsync
	fdatasync
	unlink
	rmdir
	mkdir
	mktemp
	rename
	scandir
	link
	symlink
	readlink
	chown
	fchown
	realpath
	copyfile
	lchown
	opendir
	readdir
	closedir
	statfs
	mkstemp
	lutime
}

// Flags to be passed to uv_fs_event_start().
@[flags]
pub enum Uv_fs_event_flags {
	// By default, if the fs event watcher is given a directory name, we will
	// watch for all events in that directory. This flags overrides this behavior
	// and makes fs_event report only changes to the directory entry itself. This
	// flag does not affect individual files watched.
	// This flag is currently not implemented yet on any backend.
	watch_entry = 1

	// By default uv_fs_event will try to use a kernel interface such as inotify
	// or kqueue to detect events. This may not work on remote filesystems such
	// as NFS mounts. This flag makes fs_event fall back to calling stat() on a
	// regular interval.
	// This flag is currently not implemented yet on any backend.
	stat = 2

	// By default, event watcher, when watching directory, is not registering
	// (is ignoring) changes in it's subdirectories.
	// This flag will override this behaviour on platforms that support it.
	recursive = 4
}

@[flags]
pub enum Uv_thread_create_flags {
	no_flags       = 0
	has_stack_size = 1
}

@[flags]
pub enum Uv_thread_priority {
	highest      = 2
	above_normal = 1
	normal       = 0
	below_normal = -1
	lowest       = -2
}

@[flags]
pub enum Mode {
	default = 0
	once
	nowait
}

fn (m Mode) to_int() int {
	return int(m)
}

// pub enum Uv_handle_type {
// 	unknown_handle = 0
// 	async
// 	check
// 	fs_event
// 	fs_poll
// 	handle
// 	idle
// 	pipe
// 	poll
// 	prepare
// 	process
// 	stream
// 	tcp
// 	timer
// 	tty
// 	udp
// 	signal
// 	file
// 	handle_type_max
// }

@[flags]
pub enum Uv_req_type {
	unknown_req = 0
	req
	connect
	write
	shutdown
	udp_send
	fs
	work
	getaddrinfo
	getnameinfo
	random
	// req_type_private
	req_type_max
}

@[flags]
pub enum Uv_membership {
	leave_group = 0
	join_group
}

@[flags]
pub enum Uv_loop_option {
	block_signal = 0
	metrics_idle_time
	loop_use_io_uring_sqpoll
}

@[flags]
pub enum Uv_clock_id {
	monotonic = 0
	realtime
}
