module main

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

@[typedef]
pub struct C.stat {}

// Loop, handle, and stream types
@[typedef]
pub struct C.uv_loop_t {}

@[typedef]
pub struct C.uv_handle_t {}

@[typedef]
pub struct C.uv_dir_t {}

@[typedef]
pub struct C.uv_stream_t {}

@[typedef]
pub struct C.uv_tcp_t {}

@[typedef]
pub struct C.uv_udp_t {}

@[typedef]
pub struct C.uv_pipe_t {}

@[typedef]
pub struct C.uv_tty_t {}

@[typedef]
pub struct C.uv_poll_t {}

@[typedef]
pub struct C.uv_timer_t {}

@[typedef]
pub struct C.uv_prepare_t {}

@[typedef]
pub struct C.uv_check_t {}

@[typedef]
pub struct C.uv_idle_t {}

@[typedef]
pub struct C.uv_async_t {}

@[typedef]
pub struct C.uv_process_t {}

@[typedef]
pub struct C.uv_fs_event_t {}

@[typedef]
pub struct C.uv_fs_poll_t {}

@[typedef]
pub struct C.uv_signal_t {}

// Request types

// struct Uv_req_fields {
// 	req_type Uv_req_type
// pub mut:
// 	data voidptr
// }

@[typedef]
pub struct C.uv_req_t {
	req_type Uv_req_type
pub mut:
	data voidptr
}

@[typedef]
pub struct C.uv_getaddrinfo_t {}

@[typedef]
pub struct C.uv_getnameinfo_t {}

@[typedef]
pub struct C.uv_shutdown_t {}

@[typedef]
pub struct C.uv_write_t {}

@[typedef]
pub struct C.uv_connect_t {}

@[typedef]
pub struct C.uv_udp_send_t {}

@[typedef]
pub struct C.uv_fs_t {}

@[typedef]
pub struct C.uv_work_t {}

@[typedef]
pub struct C.uv_random_t {}

// Other types
@[typedef]
pub struct C.uv_env_item_t {}

@[typedef]
pub struct C.uv_cpu_info_t {}

@[typedef]
pub struct C.uv_interface_address_t {}

@[typedef]
pub struct C.uv_dirent_t {}

@[typedef]
pub struct C.uv_passwd_t {}

@[typedef]
pub struct C.uv_group_t {}

@[typedef]
pub struct C.uv_utsname_t {}

@[typedef]
pub struct C.uv_statfs_t {}

@[typedef]
pub struct C.uv_metrics_t {}

@[typedef]
pub struct C.uv_buf_t {
pub mut:
	base &char
	len  usize
}

@[typedef]
pub struct C.uv_stat_t {}

@[typedef]
pub struct C.uv_process_options_t {}

pub struct C.addrinfo {}

pub struct C.sockaddr {}

pub struct C.sockaddr_in {}

pub type Sockaddr = C.sockaddr

// Alias for the respective VLang structs
pub type Uv_loop_t = C.uv_loop_t

pub fn Uv_loop_t.new() &Uv_loop_t {
	return &C.uv_loop_t{}
}

pub type Uv_handle_t = C.uv_handle_t
pub type Uv_dir_t = C.uv_dir_t
pub type Uv_stream_t = C.uv_stream_t
pub type Uv_tcp_t = C.uv_tcp_t
pub type Uv_udp_t = C.uv_udp_t
pub type Uv_pipe_t = C.uv_pipe_t
pub type Uv_tty_t = C.uv_tty_t
pub type Uv_poll_t = C.uv_poll_t
pub type Uv_timer_t = C.uv_timer_t
pub type Uv_prepare_t = C.uv_prepare_t
pub type Uv_check_t = C.uv_check_t
pub type Uv_idle_t = C.uv_idle_t
pub type Uv_async_t = C.uv_async_t
pub type Uv_process_t = C.uv_process_t
pub type Uv_fs_event_t = C.uv_fs_event_t
pub type Uv_fs_poll_t = C.uv_fs_poll_t
pub type Uv_signal_t = C.uv_signal_t

pub type Uv_req_t = C.uv_req_t
pub type Uv_getaddrinfo_t = C.uv_getaddrinfo_t
pub type Uv_getnameinfo_t = C.uv_getnameinfo_t
pub type Uv_shutdown_t = C.uv_shutdown_t
pub type Uv_write_t = C.uv_write_t
pub type Uv_connect_t = C.uv_connect_t
pub type Uv_udp_send_t = C.uv_udp_send_t
pub type Uv_fs_t = C.uv_fs_t
pub type Uv_work_t = C.uv_work_t
pub type Uv_random_t = C.uv_random_t

pub type Uv_env_item_t = C.uv_env_item_t
pub type Uv_cpu_info_t = C.uv_cpu_info_t
pub type Uv_interface_address_t = C.uv_interface_address_t
pub type Uv_dirent_t = C.uv_dirent_t
pub type Uv_passwd_t = C.uv_passwd_t
pub type Uv_group_t = C.uv_group_t
pub type Uv_utsname_t = C.uv_utsname_t
pub type Uv_statfs_t = C.uv_statfs_t
pub type Uv_metrics_t = C.uv_metrics_t

// Import necessary C functions and structures
