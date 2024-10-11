module vuv

// struct Foo {
// 	a int // private immutable (default)
// mut:
// 	b int // private mutable
// 	c int // (you can list multiple fields with the same access modifier)
// pub:
// 	d int // public immutable (readonly)
// pub mut:
// 	e int // public, but mutable only in parent module
// __global:
// 	// (not recommended to use, that's why the 'global' keyword starts with __)
// 	f int // public and mutable both inside and outside parent module
// }

// note C. structs do not allow embedding other structs like v structs do

@[typedef]
pub struct C.uv_timeval_t {
	tv_sec  i64
	tv_usec i32
}

@[typedef]
pub struct C.uv_timeval64_t {
	tv_sec  i64
	tv_usec i32
}

@[typedef]
pub struct C.uv_rusage_t {
	ru_utime    C.uv_timeval_t
	ru_stime    C.uv_timeval_t
	ru_maxrss   u64
	ru_ixrss    u64
	ru_idrss    u64
	ru_isrss    u64
	ru_minflt   u64
	ru_majflt   u64
	ru_nswap    u64
	ru_inblock  u64
	ru_oublock  u64
	ru_msgsnd   u64
	ru_msgrcv   u64
	ru_nsignals u64
	ru_nvcsw    u64
	ru_nivcsw   u64
}

@[typedef]
pub struct C.uv_thread_t {
	// __sig int
}

@[typedef]
struct C.uv_thread_options_t {
pub mut:
	flags      usize
	stack_size usize
	// more fields may be added at any time
}

@[typedef]
pub struct C.sockaddr_in6 {
	// sin6_family   int
	// sin6_port     u16
	// sin6_flowinfo u32
	// sin6_addr     [16]u8
	// sin6_scope_id u32
}

// this is an unsigned int
@[typedef]
pub struct C.uv_uid_t {}

// @[typedef]
// pub struct C.stat {}

// Loop, handle, and stream types
// @[typedef]
// pub struct C.uv_loop_t {
// pub mut:
// 	data           voidptr
// 	active_handles usize
// }

@[typedef]
pub struct C.uv_handle_t {
	// pub mut:
	// 	data voidptr
	// 	loop &C.uv_loop_t
	// type Uv_handle_type
}

@[typedef]
pub struct C.uv_dir_t {
	// pub mut:
	// 	dirents  &C.uv_dirent_t
	// 	nentries usize
}

// @[typedef]
// pub struct C.uv_stream_t {
// 	loop &C.uv_loop_t
// pub mut:
// 	write_queue_size usize
// 	alloc_cb         Alloc_cb
// 	read_cb          Read_cb
// 	data             voidptr
// }

// @[typedef]
// pub struct C.uv_tcp_t {
// 	loop &C.uv_loop_t
// pub mut:
// 	write_queue_size usize
// 	alloc_cb         Alloc_cb
// 	read_cb          Read_cb
// 	data             voidptr
// }

// @[typedef]
// pub struct C.uv_udp_t {
// 	loop             &C.uv_loop_t
// 	send_queue_size  usize
// 	send_queue_count usize
// pub mut:
// 	data voidptr
// }

@[typedef]
pub struct C.uv_pipe_t {
	// 	loop &C.uv_loop_t
	// 	ipc  int
	// pub mut:
	// 	write_queue_size usize
	// 	alloc_cb         Alloc_cb
	// 	read_cb          Read_cb
	// 	data             voidptr
}

@[typedef]
pub struct C.uv_tty_t {
	// 	loop &C.uv_loop_t
	// pub mut:
	// 	write_queue_size usize
	// 	alloc_cb         Alloc_cb
	// 	read_cb          Read_cb
	// 	data             voidptr
}

@[typedef]
pub struct C.uv_poll_t {
	// 	loop &C.uv_loop_t
	// pub mut:
	// 	data       voidptr
	// 	uv_poll_cb Poll_cb
}

// @[typedef]
// pub struct C.uv_timer_t {
// 	loop &C.uv_loop_t
// pub mut:
// 	data voidptr
// }

@[typedef]
pub struct C.uv_prepare_t {
	// 	loop &C.uv_loop_t
	// pub mut:
	// 	data voidptr
}

@[typedef]
pub struct C.uv_check_t {
	// 	loop &C.uv_loop_t
	// pub mut:
	// 	data voidptr
}

@[typedef]
pub struct C.uv_idle_t {
	// 	loop &C.uv_loop_t
	// pub mut:
	// 	data voidptr
}

@[typedef]
pub struct C.uv_async_t {
	// 	loop &C.uv_loop_t
	// pub mut:
	// 	data voidptr
}

@[typedef]
pub struct C.uv_process_t {
	// 	loop    &C.uv_loop_t
	// 	pid     int
	// 	exit_cb Exit_cb
	// pub mut:
	// 	data voidptr
}

@[typedef]
pub struct C.uv_fs_event_t {
	// 	loop &C.uv_loop_t
	// 	path &char
	// pub mut:
	// 	data voidptr
}

@[typedef]
pub struct C.uv_fs_poll_t {
	// 	loop &C.uv_loop_t
	// pub mut:
	// 	data voidptr
}

@[typedef]
pub struct C.uv_signal_t {
	// 	loop      &C.uv_loop_t
	// 	signum    int
	// 	signal_cb Signal_cb
	// pub mut:
	// 	data voidptr
}

// Request types

// struct Uv_req_fields {
// 	req_type Uv_req_type
// pub mut:
// 	data voidptr
// }

@[typedef]
pub struct C.uv_req_t {
	// 	req_type Uv_req_type
	// pub mut:
	// 	data voidptr
}

@[typedef]
pub struct C.uv_getaddrinfo_t {
	// 	loop &C.uv_loop_t
	// pub mut:
	// 	data voidptr
}

@[typedef]
pub struct C.uv_getnameinfo_t {
	// 	loop &C.uv_loop_t
	// pub mut:
	// 	data voidptr
}

@[typedef]
pub struct C.uv_shutdown_t {
	// 	handle &C.uv_stream_t
	// 	loop   &C.uv_loop_t
	// pub mut:
	// 	data voidptr
}

@[typedef]
pub struct C.uv_write_t {
	// 	handle &C.uv_stream_t
	// pub mut:
	// 	// loop &C.uv_loop_t
	// 	data voidptr
}

// @[typedef]
// pub struct C.uv_connect_t {
// 	handle &C.uv_stream_t
// 	loop   &C.uv_loop_t
// pub mut:
// 	data voidptr
// }

@[typedef]
pub struct C.uv_udp_send_t {
	// 	handle &C.uv_stream_t
	// 	loop   &C.uv_loop_t
	// pub mut:
	// 	data voidptr
}

@[typedef]
pub struct C.uv_fs_t {
	// pub mut:
	// 	ptr     voidptr
	// 	statbuf &C.uv_stat_t
	// 	loop    &C.uv_loop_t
	// 	path    &char
	// 	result  usize
	// 	data    voidptr
}

@[typedef]
pub struct C.uv_work_t {
	loop &C.uv_loop_t
pub mut:
	data voidptr
}

@[typedef]
pub struct C.uv_random_t {
	loop   &C.uv_loop_t
	status int
	buf    voidptr
	buflen usize
pub mut:
	data voidptr
}

// Other types
@[typedef]
pub struct C.uv_env_item_t {
	name  &char
	value &char
}

@[typedef]
pub struct C.uv_cpu_info_t {
	model     &char
	speed     int
	cpu_times &C.uv_cpu_times_s
}

struct C.uv_cpu_times_s {
	user u64
	nice u64
	sys  u64
	idle u64
	irq  u64
}

// union Address {
// 	address4 &C.sockaddr_in
// 	netmask &C.sockaddr
// }

@[typedef]
pub struct C.uv_interface_address_t {
	name        &char
	phys_addr   &char
	is_internal int
	// address Address
	// union Address {
	// 	address &C.sockaddr
	// 	netmask &C.sockaddr
	// }
	// address &C.sockaddr
	// netmask &C.sockaddr
}

@[typedef]
pub struct C.uv_dirent_t {
	name &char
}

@[typedef]
pub struct C.uv_passwd_t {
	username &char
	uid      u64
	gid      u64
	shell    &char
	homedir  &char
	gecos    &char
}

@[typedef]
pub struct C.uv_group_t {
	groupname &char
	gid       u64
	members   &&char
}

@[typedef]
pub struct C.uv_utsname_t {
	sysname [256]byte // Array of 256 bytes for system name
	release [256]byte // Array of 256 bytes for release version
	version [256]byte // Array of 256 bytes for version
	machine [256]byte
}

@[typedef]
pub struct C.uv_statfs_t {
	f_type   u64
	f_bsize  u64
	f_blocks u64
	f_bfree  u64
	f_bavail u64
	f_files  u64
	f_ffree  u64
	f_fspare [4]u64
}

@[typedef]
pub struct C.uv_metrics_t {
	loop_count     u64
	events         u64
	events_waiting u64
}

@[typedef]
pub struct C.uv_buf_t {
pub mut:
	base &char
	len  usize
}

@[typedef]
pub struct C.uv_timespec_t {
	tv_sec  i64
	tv_nsec i32
}

@[typedef]
pub struct C.uv_timespec64_t {
	tv_sec  i64
	tv_nsec i32
}

@[typedef]
pub struct C.uv_stat_t {
	// st_dev      u64
	// st_mode     u64
	// st_nlink    u64
	// st_uid      u64
	// st_gid      u64
	// st_rdev     u64
	// st_ino      u64
	// st_size     i64
	// st_blksize  i64
	// st_blocks   i64
	// st_flags    u64
	// st_gen      u64
	// st_atim     C.uv_timespec_t
	// st_mtim     C.uv_timespec_t
	// st_ctim     C.uv_timespec_t
	// st_birthtim C.uv_timespec_t
}

@[typedef]
pub struct C.uv_process_options_t {
	file        &char
	args        &char
	env         &&char
	cwd         &char
	flags       usize
	stdio_count int
	stdio       &char
	exit_cb     &fn (&C.uv_process_t, i64, i64)
}

// this breaks compilation if net.http is imported
pub struct C.addrinfo {
mut:
	ai_family    int
	ai_socktype  int
	ai_flags     int
	ai_protocol  int
	ai_addrlen   int
	ai_addr      voidptr
	ai_canonname voidptr
	ai_next      voidptr
}

pub struct C.sockaddr {}

pub struct C.sockaddr_in {}

@[typedef]
pub struct C.uv_env_item_t {
	name  &char
	value &char
}

// sync primative fields dont need to be defined
@[typedef]
struct C.uv_mutex_t {}

@[typedef]
struct C.uv_rwlock_t {}

@[typedef]
struct C.uv_sem_t {}

@[typedef]
struct C.uv_cond_t {}

@[typedef]
struct C.uv_barrier_t {
	// mutex      &C.uv_mutex_t
	// cond       &C.uv_cond_t
	// threshhold usize
	// // in 	 usize
	// out usize
}

@[typedef]
struct C.uv_once_t {}

@[typedef]
struct C.uv_key_t {}

@[typedef]
struct C.uv_lib_t {}

// Import necessary C functions and structures
