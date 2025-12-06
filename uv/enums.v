module uv

pub enum Uv_dirent_type {
	uv_dirent_unknown = 0
	uv_dirent_file
	uv_dirent_dir
	uv_dirent_link
	uv_dirent_fifo
	uv_dirent_socket
	uv_dirent_char
	uv_dirent_block
}

pub enum Uv_tcp_flags {
	tcp_ipv6_only = 1
	tcp_reuse_port
}

pub enum Uv_udp_flags {
	// Disables dual stack mode.
	udp_ipv6_only = 1
	// Indicates message was truncated because read buffer was too small. The
	// remainder was discarded by the OS. Used in uv_udp_recv_cb.
	udp_partial = 2
	// Indicates if SO_REUSEADDR will be set when binding the handle.
	// This sets the SO_REUSEPORT socket flag on the BSDs (except for
	// DragonFlyBSD), OS X, and other platforms where SO_REUSEPORTs don't
	// have the capability of load balancing, as the opposite of what
	// UV_UDP_REUSEPORT would do. On other Unix platforms, it sets the
	// SO_REUSEADDR flag. What that means is that multiple threads or
	// processes can bind to the same address without error (provided
	// they all set the flag) but only the last one to bind will receive
	// any traffic, in effect "stealing" the port from the previous listener.
	udp_reuseaddr = 4

	// Indicates that the message was received by recvmmsg, so the buffer provided
	// must not be freed by the recv_cb callback.
	udp_mmsg_chunk = 8

	// Indicates that the buffer provided has been fully utilized by recvmmsg and
	// that it should now be freed by the recv_cb callback. When this flag is set
	// in uv_udp_recv_cb, nread will always be 0 and addr will always be NULL.
	udp_mmsg_free = 16

	// Indicates if IP_RECVERR/IPV6_RECVERR will be set when binding the handle.
	// This sets IP_RECVERR for IPv4 and IPV6_RECVERR for IPv6 UDP sockets on
	// Linux. This stops the Linux kernel from suppressing some ICMP error
	// messages and enables full ICMP error reporting for faster failover.
	// This flag is no-op on platforms other than Linux.
	udp_linux_recverr = 32

	// Indicates if SO_REUSEPORT will be set when binding the handle.
	// This sets the SO_REUSEPORT socket option on supported platforms.
	// Unlike UV_UDP_REUSEADDR, this flag will make multiple threads or
	// processes that are binding to the same address and port "share"
	// the port, which means incoming datagrams are distributed across
	// the receiving sockets among threads or processes.
	//
	// This flag is available only on Linux 3.9+, DragonFlyBSD 3.6+,
	// FreeBSD 12.0+, Solaris 11.4, and AIX 7.2.5+ for now.
	udp_reuseport = 64
	// Indicates that recvmmsg should be used, if available.
	udp_recvmmsg = 256
}

pub enum Uv_tty_mode as int {
	// Initial/normal terminal mode
	tty_mode_normal = 0
	// Raw input mode (On Windows, ENABLE_WINDOW_INPUT is also enabled)
	tty_mode_raw
	//  Binary-safe I/O mode for IPC (Unix-only)
	tty_mode_io
}

pub enum Uv_tty_vtermstate {
	// The console supports handling of virtual terminal sequences
	// (Windows10 new console, ConEmu)
	tty_supported
	// The console cannot process the virtual terminal sequence.  (Legacy
	// console)
	tty_unsupported
}

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

// pub type C.uv_process_flags = Uv_process_flags

pub enum Uv_fs_type {
	fs_unknown = -1
	fs_custom
	fs_open
	fs_close
	fs_read
	fs_write
	fs_sendfile
	fs_stat
	fs_lstat
	fs_fstat
	fs_ftruncate
	fs_utime
	fs_futime
	fs_access
	fs_chmod
	fs_fchmod
	fs_fsync
	fs_fdatasync
	fs_unlink
	fs_rmdir
	fs_mkdir
	fs_mktemp
	fs_rename
	fs_scandir
	fs_link
	fs_symlink
	fs_readlink
	fs_chown
	fs_fchown
	fs_realpath
	fs_copyfile
	fs_lchown
	fs_opendir
	fs_readdir
	fs_closedir
	fs_statfs
	fs_mkstemp
	fs_lutime
}

// Flags to be passed to uv_fs_event_start().
pub enum Uv_fs_event_flags {
	// By default, if the fs event watcher is given a directory name, we will
	// watch for all events in that directory. This flags overrides this behavior
	// and makes fs_event report only changes to the directory entry itself. This
	// flag does not affect individual files watched.
	// This flag is currently not implemented yet on any backend.
	fs_event_watch_entry = 1

	// By default uv_fs_event will try to use a kernel interface such as inotify
	// or kqueue to detect events. This may not work on remote filesystems such
	// as NFS mounts. This flag makes fs_event fall back to calling stat() on a
	// regular interval.
	// This flag is currently not implemented yet on any backend.
	fs_event_stat = 2

	// By default, event watcher, when watching directory, is not registering
	// (is ignoring) changes in it's subdirectories.
	// This flag will override this behaviour on platforms that support it.
	fs_event_recursive = 4
}

pub enum Uv_thread_create_flags {
	uv_thread_no_flags       = 0
	uv_thread_has_stack_size = 1
}

pub enum Uv_thread_priority {
	highest      = 2
	above_normal = 1
	normal       = 0
	below_normal = -1
	lowest       = -2
}

pub enum Mode {
	default = 0
	once
	nowait
}

pub enum Uv_handle_type {
	unknown_handle = 0
	async
	check
	fs_event
	fs_poll
	handle
	idle
	pipe
	poll
	prepare
	process
	stream
	tcp
	timer
	tty
	udp
	signal
	file
	handle_type_max
}

// Define the UV request type enum
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

pub enum Uv_membership {
	leave_group = 0
	join_group
}

pub enum Uv_loop_option {
	block_signal = 0
	metrics_idle_time
	loop_use_io_uring_sqpoll
}

pub enum Uv_clock_id {
	monotonic = 0
	realtime
}
