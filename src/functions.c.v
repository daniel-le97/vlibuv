module vlibuv

// add documentation to each function for each wrapper of a underlying libuv function

fn C.uv_version() u32

pub fn version() u32 {
	return C.uv_version()
}

fn C.uv_version_string() &char

pub fn version_string() string {
	unsafe {
		return cstring_to_vstring(C.uv_version_string())
	}
}

fn C.uv_library_shutdown()

pub fn library_shutdown() {
	C.uv_library_shutdown()
}

// typedef void* (*uv_malloc_func)(size_t size);
pub type Malloc_fn = fn (size isize) &u8

// typedef void* (*uv_realloc_func)(void* ptr, size_t size);
pub type Realloc_fn = fn (ptr &u8, size isize) &u8

// typedef void* (*uv_calloc_func)(size_t count, size_t size);
pub type Calloc_fn = fn (count usize, size usize) &u8

// typedef void (*uv_free_func)(void* ptr);
pub type Free_fn = fn (ptr voidptr) voidptr

fn C.uv_replace_allocator(malloc Malloc_fn, realloc Realloc_fn, calloc Calloc_fn, free Free_fn) int
pub fn replace_allocator(malloc_fn Malloc_fn, realloc_cb Realloc_fn, calloc_cb Calloc_fn, free_cb Free_fn) int {
	return C.uv_replace_allocator(malloc_fn, realloc_cb, calloc_cb, free_cb)
}

// fn C.uv_default_loop() &C.uv_loop_t

// pub fn default_loop() &C.uv_loop_t {
// 	return C.uv_default_loop()
// }

// fn C.uv_loop_init(loop &C.uv_loop_t) int

// pub fn loop_init(loop &C.uv_loop_t) int {
// 	return C.uv_loop_init(loop)
// }

// fn C.uv_loop_close(loop &C.uv_loop_t) int

// pub fn loop_close(loop &C.uv_loop_t) int {
// 	return C.uv_loop_close(loop)
// }

// fn C.uv_loop_new() &C.uv_loop_t

// // this is deprecated, allocate the loop manually and use loop_init instead
// @[deprecated: 'allocate the loop manually and use loop_init instead']
// pub fn loop_new() &C.uv_loop_t {
// 	return C.uv_loop_new()
// }

// fn C.uv_loop_delete(loop &C.uv_loop_t)

// // this function is deprecated, use loop_close and free the memory manually instead
// @[deprecated: 'use loop_close and free the memory manually instead']
// pub fn loop_delete(loop &C.uv_loop_t) {
// 	C.uv_loop_delete(loop)
// }

// fn C.uv_loop_size() usize

// pub fn loop_size() usize {
// 	return C.uv_loop_size()
// }

// fn C.uv_loop_alive(const_loop &C.uv_loop_t) int

// pub fn loop_alive(const_loop &C.uv_loop_t) int {
// 	return C.uv_loop_alive(const_loop)
// }

// fn C.uv_loop_configure(loop &C.uv_loop_t, option int, ...voidptr) int

// pub fn loop_configure(loop &C.uv_loop_t, option Uv_loop_option, args ...voidptr) int {
// 	return C.uv_loop_configure(loop, int(option), ...args)
// }

// fn C.uv_loop_fork(loop &C.uv_loop_t) int

// pub fn loop_fork(loop &C.uv_loop_t) int {
// 	return C.uv_loop_fork(loop)
// }

// fn C.uv_run(loop &C.uv_loop_t, mode int) int

// pub fn run(loop &C.uv_loop_t, mode Mode) int {
// 	return C.uv_run(loop, int(mode))
// }

// fn C.uv_stop(loop &C.uv_loop_t)

// pub fn stop(loop &C.uv_loop_t) {
// 	C.uv_stop(loop)
// }

// fn C.uv_ref(handle &C.uv_handle_t)

// pub fn ref(handle &C.uv_handle_t) {
// 	C.uv_ref(handle)
// }

// fn C.uv_unref(handle &C.uv_handle_t)

// pub fn unref(handle &C.uv_handle_t) {
// 	C.uv_unref(handle)
// }

// fn C.uv_has_ref(handle &C.uv_handle_t) int

// pub fn has_ref(const_handle &C.uv_handle_t) int {
// 	return C.uv_has_ref(const_handle)
// }

// fn C.uv_update_time(loop &C.uv_loop_t)

// pub fn update_time(loop &C.uv_loop_t) {
// 	C.uv_update_time(loop)
// }

// fn C.uv_now(loop &C.uv_loop_t) u64

// pub fn now(const_loop &C.uv_loop_t) u64 {
// 	return C.uv_now(const_loop)
// }

// fn C.uv_backend_fd(loop &C.uv_loop_t) int

// pub fn backend_fd(loop &C.uv_loop_t) int {
// 	return C.uv_backend_fd(loop)
// }

// fn C.uv_backend_timeout(loop &C.uv_loop_t) int

// pub fn backend_timeout(loop &C.uv_loop_t) int {
// 	return C.uv_backend_timeout(loop)
// }

pub type Alloc_cb = fn (handle &C.uv_handle_t, suggested_size usize, buf &C.uv_buf_t)

pub type Read_cb = fn (stream &C.uv_stream_t, nread isize, buf &C.uv_buf_t)

pub type Write_cb = fn (req &C.uv_write_t, status int)

pub type Connect_cb = fn (req &C.uv_connect_t, status int)

pub type Shutdown_cb = fn (req &C.uv_shutdown_t, status int)

pub type Connection_cb = fn (server &C.uv_stream_t, status int)

pub type Close_cb = fn (handle &C.uv_handle_t)

pub type Poll_cb = fn (handle &C.uv_poll_t, status int, events int)

pub type Timer_cb = fn (handle &C.uv_timer_t)

pub type Async_cb = fn (handle &C.uv_async_t)

pub type Prepare_cb = fn (handle &C.uv_prepare_t)

pub type Check_cb = fn (handle &C.uv_check_t)

pub type Idle_cb = fn (handle &C.uv_idle_t)

pub type Exit_cb = fn (handle &C.uv_process_t, exit_status i64, term_signal int)

pub type Walk_cb = fn (handle &C.uv_handle_t, arg voidptr)

pub type Fs_cb = fn (req &C.uv_fs_t)

pub type Work_cb = fn (req &C.uv_work_t)

pub type AfterWork_cb = fn (req &C.uv_work_t, status int)

pub type Getaddrinfo_cb = fn (req &C.uv_getaddrinfo_t, status int, res &C.addrinfo)

pub type Getnameinfo_cb = fn (req &C.uv_getnameinfo_t, status int, hostname &char, service &char)

pub type Random_cb = fn (req &C.uv_random_t, status int, buf voidptr, buflen usize)

pub type FsEvent_cb = fn (handle &C.uv_fs_event_t, const_filename &char, events int, status int)

pub type FsPoll_cb = fn (handle &C.uv_fs_poll_t, status int, const_prev &C.uv_stat_t, const_curr &C.uv_stat_t)

pub type Signal_cb = fn (handle &C.uv_signal_t, signum int)

fn C.uv_translate_sys_error(sys_errno int) int

pub fn translate_sys_error(sys_errno int) int {
	return C.uv_translate_sys_error(sys_errno)
}

fn C.uv_strerror(err int) &char

pub fn strerror(err int) string {
	unsafe {
		return cstring_to_vstring(C.uv_strerror(err))
	}
	// return C.uv_strerror(err)
}

fn C.uv_err_name_r(err int, buff &char, buflen u64) &char

pub fn err_name_r(err int, buff &char, buflen u64) string {
	unsafe {
		return cstring_to_vstring(C.uv_err_name_r(err, buff, buflen))
	}
}

fn C.uv_err_name(const_err int) &char

pub fn err_name(const_err int) string {
	unsafe {
		return cstring_to_vstring(C.uv_err_name(const_err))
	}
}

fn C.uv_shutdown(req &C.uv_shutdown_t, handle &C.uv_stream_t, cb Shutdown_cb) int

pub fn shutdown(req &C.uv_shutdown_t, handle &C.uv_stream_t, cb Shutdown_cb) int {
	return C.uv_shutdown(req, handle, cb)
}

// // handle functions

// fn C.uv_handle_size(handle_type int) usize

// pub fn handle_size(handle_type Uv_handle_type) usize {
// 	return C.uv_handle_size(int(handle_type))
// }

// fn C.uv_handle_get_type(const_handle &C.uv_handle_t) Uv_handle_type

// pub fn handle_get_type(const_handle &C.uv_handle_t) Uv_handle_type {
// 	// handle := const_handle['type']
// 	unsafe {
// 		return Uv_handle_type(C.uv_handle_get_type(const_handle))
// 	}
// }

// fn C.uv_handle_type_name(handle_type int) &char

// pub fn handle_type_name(const_handle_type Uv_handle_type) string {
// 	unsafe {
// 		return cstring_to_vstring(C.uv_handle_type_name(int(const_handle_type)))
// 	}
// }

// fn C.uv_handle_get_data(const_handle &C.uv_handle_t) voidptr

// pub fn handle_get_data(const_handle &C.uv_handle_t) voidptr {
// 	return C.uv_handle_get_data(const_handle)
// }

// fn C.uv_handle_get_loop(const_handle &C.uv_handle_t) &C.uv_loop_t

// pub fn handle_get_loop(const_handle &C.uv_handle_t) &C.uv_loop_t {
// 	return C.uv_handle_get_loop(const_handle)
// }

// fn C.uv_handle_set_data(handle &C.uv_handle_t, data voidptr)

// pub fn handle_set_data(handle &C.uv_handle_t, data voidptr) {
// 	C.uv_handle_set_data(handle, data)
// }

// // request functions

// fn C.uv_req_size(req_type int) usize

// pub fn req_size(req_type Uv_req_type) usize {
// 	return C.uv_req_size(int(req_type))
// }

// fn C.uv_req_get_data(const_req &C.uv_req_t) voidptr

// pub fn req_get_data(const_req &C.uv_req_t) voidptr {
// 	return C.uv_req_get_data(const_req)
// }

// fn C.uv_req_set_data(req &C.uv_req_t, data voidptr)

// pub fn req_set_data(req &C.uv_req_t, data voidptr) {
// 	C.uv_req_set_data(req, data)
// }

// fn C.uv_req_get_type(const_req &C.uv_req_t) Uv_req_type

// pub fn req_get_type(const_req &C.uv_req_t) Uv_req_type {
// 	unsafe {
// 		return Uv_req_type(C.uv_req_get_type(const_req))
// 	}
// }

// fn C.uv_req_type_name(req_type int) &char

// pub fn req_type_name(const_req_type Uv_req_type) string {
// 	unsafe {
// 		return cstring_to_vstring(C.uv_req_type_name(int(const_req_type)))
// 	}
// }

// fn C.uv_is_active(const_handle &C.uv_handle_t) int

// pub fn is_active(const_handle &C.uv_handle_t) int {
// 	return C.uv_is_active(const_handle)
// }

fn C.uv_walk(loop &C.uv_loop_t, walk_cb fn (handle &C.uv_handle_t, arg voidptr), arg voidptr)

pub fn walk(loop &C.uv_loop_t, walk_cb fn (handle &C.uv_handle_t, arg voidptr), arg voidptr) {
	C.uv_walk(loop, walk_cb, arg)
}

fn C.uv_print_all_handles(loop &C.uv_loop_t, file &C.FILE)

pub fn print_all_handles(loop &C.uv_loop_t, file &C.FILE) {
	C.uv_print_all_handles(loop, file)
}

fn C.uv_print_active_handles(loop &C.uv_loop_t, file &C.FILE)

pub fn print_active_handles(loop &C.uv_loop_t, file &C.FILE) {
	C.uv_print_active_handles(loop, file)
}

fn C.uv_close(handle &C.uv_handle_t, close_cb fn (handle &C.uv_handle_t))

pub fn close(handle &C.uv_handle_t, close_cb fn (handle &C.uv_handle_t)) {
	C.uv_close(handle, close_cb)
}

fn C.uv_send_buffer_size(handle &C.uv_handle_t, value &int) int

pub fn send_buffer_size(handle &C.uv_handle_t, value &int) int {
	return C.uv_send_buffer_size(handle, value)
}

fn C.uv_recv_buffer_size(handle &C.uv_handle_t, value &int) int

pub fn recv_buffer_size(handle &C.uv_handle_t, value &int) int {
	return C.uv_recv_buffer_size(handle, value)
}

fn C.uv_fileno(const_handle &C.uv_handle_t, fd &int) int

pub fn fileno(const_handle &C.uv_handle_t, fd &int) int {
	return C.uv_fileno(const_handle, fd)
}

// pub type Buf = u8 | char

fn C.uv_buf_init(base &char, len usize) C.uv_buf_t

pub fn buf_init(base &u8, len usize) C.uv_buf_t {
	return C.uv_buf_init(&char(base), len)
}

pub fn init_buf(mut buf C.uv_buf_t, size usize) {
	unsafe {
		buf.base = malloc(size)
		buf.len = size
	}
}

fn C.uv_pipe(fds [2]int, read_flags int, write_flags int) int

pub fn pipe(fds [2]int, read_flags int, write_flags int) int {
	return C.uv_pipe(fds, read_flags, write_flags)
}

fn C.uv_socketpair(socker_type int, protocol int, socket_vector [2]int, flags0 int, flags1 int) int

pub fn socketpair(socker_type int, protocol int, socket_vector [2]int, flags0 int, flags1 int) int {
	return C.uv_socketpair(socker_type, protocol, socket_vector, flags0, flags1)
}

// fn C.uv_stream_get_write_queue_size(const_stream &C.uv_stream_t) usize

// pub fn stream_get_write_queue_size(const_stream &C.uv_stream_t) usize {
// 	return C.uv_stream_get_write_queue_size(const_stream)
// }

// fn C.uv_listen(stream &C.uv_stream_t, backlog int, cb Connection_cb) int

// pub fn listen(stream &C.uv_stream_t, backlog int, cb Connection_cb) int {
// 	return C.uv_listen(stream, backlog, cb)
// }

// fn C.uv_accept(server &C.uv_stream_t, client &C.uv_stream_t) int

// pub fn accept(server &C.uv_stream_t, client &C.uv_stream_t) int {
// 	return C.uv_accept(server, client)
// }

// fn C.uv_read_start(stream &C.uv_stream_t, alloc_cb Alloc_cb, read_cb Read_cb) int

// pub fn read_start(stream &C.uv_stream_t, alloc_cb Alloc_cb, read_cb Read_cb) int {
// 	return C.uv_read_start(stream, alloc_cb, read_cb)
// }

// fn C.uv_read_stop(stream &C.uv_stream_t) int

// pub fn read_stop(stream &C.uv_stream_t) int {
// 	return C.uv_read_stop(stream)
// }

// TODO bufs is written as const uv_buf_t bufs[] in c, but I don't know how to handle that in v
fn C.uv_write(req &C.uv_write_t, handle &C.uv_stream_t, const_bufs &C.uv_buf_t, nbufs usize, cb Write_cb) int

// writes to the buffer
pub fn write(req &C.uv_write_t, handle &C.uv_stream_t, const_bufs &C.uv_buf_t, nbufs usize, cb Write_cb) int {
	return C.uv_write(req, handle, const_bufs, nbufs, cb)
}

// TODO bufs is written as const uv_buf_t bufs[] in c, but I don't know how to handle that in v
fn C.uv_write2(req &C.uv_write_t, handle &C.uv_stream_t, const_bufs &C.uv_buf_t, nbufs usize, send_handle &C.uv_stream_t, cb Write_cb) int

pub fn write2(req &C.uv_write_t, handle &C.uv_stream_t, const_bufs &C.uv_buf_t, nbufs usize, send_handle &C.uv_stream_t, cb Write_cb) int {
	return C.uv_write2(req, handle, const_bufs, nbufs, send_handle, cb)
}

fn C.uv_try_write(handle &C.uv_stream_t, const_bufs &C.uv_buf_t, nbufs usize) int

pub fn try_write(handle &C.uv_stream_t, const_bufs &C.uv_buf_t, nbufs usize) int {
	return C.uv_try_write(handle, const_bufs, nbufs)
}

fn C.uv_try_write2(handle &C.uv_stream_t, const_bufs &C.uv_buf_t, nbufs usize, send_handle &C.uv_stream_t) int

pub fn try_write2(handle &C.uv_stream_t, const_bufs &C.uv_buf_t, nbufs usize, send_handle &C.uv_stream_t) int {
	return C.uv_try_write2(handle, const_bufs, nbufs, send_handle)
}

fn C.uv_is_readable(const_handle &C.uv_stream_t) int

pub fn is_readable(const_handle &C.uv_stream_t) int {
	return C.uv_is_readable(const_handle)
}

fn C.uv_is_writable(const_handle &C.uv_stream_t) int

pub fn is_writable(const_handle &C.uv_stream_t) int {
	return C.uv_is_writable(const_handle)
}

fn C.uv_stream_set_blocking(handle &C.uv_stream_t, blocking int) int

pub fn stream_set_blocking(handle &C.uv_stream_t, blocking int) int {
	return C.uv_stream_set_blocking(handle, blocking)
}

// fn C.uv_is_closing(const_handle &C.uv_handle_t) int

// pub fn is_closing(const_handle &C.uv_handle_t) int {
// 	return C.uv_is_closing(const_handle)
// }

// // tcp functions

// fn C.uv_tcp_init(loop &C.uv_loop_t, handle &C.uv_tcp_t) int

// pub fn tcp_init(loop &C.uv_loop_t, handle &C.uv_tcp_t) int {
// 	return C.uv_tcp_init(loop, handle)
// }

// fn C.uv_tcp_init_ex(loop &C.uv_loop_t, handle &C.uv_tcp_t, flags usize) int

// pub fn tcp_init_ex(loop &C.uv_loop_t, handle &C.uv_tcp_t, flags usize) int {
// 	return C.uv_tcp_init_ex(loop, handle, flags)
// }

// fn C.uv_tcp_open(handle &C.uv_tcp_t, sock int) int

// pub fn tcp_open(handle &C.uv_tcp_t, sock int) int {
// 	return C.uv_tcp_open(handle, sock)
// }

// fn C.uv_tcp_nodelay(handle &C.uv_tcp_t, enable int) int

// pub fn tcp_nodelay(handle &C.uv_tcp_t, enable int) int {
// 	return C.uv_tcp_nodelay(handle, enable)
// }

// fn C.uv_tcp_keepalive(handle &C.uv_tcp_t, enable int, delay u32) int

// pub fn tcp_keepalive(handle &C.uv_tcp_t, enable int, delay u32) int {
// 	return C.uv_tcp_keepalive(handle, enable, delay)
// }

// fn C.uv_tcp_simultaneous_accepts(handle &C.uv_tcp_t, enable int) int

// pub fn tcp_simultaneous_accepts(handle &C.uv_tcp_t, enable int) int {
// 	return C.uv_tcp_simultaneous_accepts(handle, enable)
// }

// fn C.uv_tcp_bind(handle &C.uv_tcp_t, addr &C.sockaddr, flags u32) int

// pub fn tcp_bind(handle &C.uv_tcp_t, const_sockaddr &C.sockaddr, flags int) int {
// 	return C.uv_tcp_bind(handle, const_sockaddr, flags)
// }

// fn C.uv_tcp_getsockname(handle &C.uv_tcp_t, name &C.sockaddr, namelen &int) int

// pub fn tcp_getsockname(const_handle &C.uv_tcp_t, name &C.sockaddr, namelen &int) int {
// 	return C.uv_tcp_getsockname(const_handle, name, namelen)
// }

// fn C.uv_tcp_getpeername(handle &C.uv_tcp_t, name &C.sockaddr, namelen &int) int

// pub fn tcp_getpeername(const_handle &C.uv_tcp_t, name &C.sockaddr, namelen &int) int {
// 	return C.uv_tcp_getpeername(const_handle, name, namelen)
// }

// fn C.uv_tcp_connect(req &C.uv_connect_t, handle &C.uv_tcp_t, addr &C.sockaddr, cb fn (req &C.uv_connect_t, status int)) int

// pub fn tcp_connect(req &C.uv_connect_t, handle &C.uv_tcp_t, const_sockaddr &C.sockaddr, cb fn (req &C.uv_connect_t, status int)) int {
// 	return C.uv_tcp_connect(req, handle, const_sockaddr, cb)
// }

pub type Udp_send_cb = fn (req &C.uv_udp_send_t, status int)

pub type Udp_recv_cb = fn (handle &C.uv_udp_t, nread isize, const_buf &C.uv_buf_t, const_sockaddr &C.sockaddr, flags Uv_udp_flags)

// // udp functions

// fn C.uv_udp_init(loop &C.uv_loop_t, handle &C.uv_udp_t) int

// pub fn udp_init(loop &C.uv_loop_t, handle &C.uv_udp_t) int {
// 	return C.uv_udp_init(loop, handle)
// }

// fn C.uv_udp_init_ex(loop &C.uv_loop_t, handle &C.uv_udp_t, flags Uv_udp_flags) int

// pub fn udp_init_ex(loop &C.uv_loop_t, handle &C.uv_udp_t, flags Uv_udp_flags) int {
// 	return C.uv_udp_init_ex(loop, handle, flags)
// }

// fn C.uv_udp_open(handle &C.uv_udp_t, sock int) int

// pub fn udp_open(handle &C.uv_udp_t, sock int) int {
// 	return C.uv_udp_open(handle, sock)
// }

// fn C.uv_udp_bind(handle &C.uv_udp_t, addr &C.sockaddr, flags u32) int

// pub fn udp_bind(handle &C.uv_udp_t, const_sockaddr &C.sockaddr, flags int) int {
// 	return C.uv_udp_bind(handle, const_sockaddr, flags)
// }

// fn C.uv_udp_connect(handle &C.uv_udp_t, const_sockaddr &C.sockaddr) int

// pub fn udp_connect(handle &C.uv_udp_t, const_sockaddr &C.sockaddr) int {
// 	return C.uv_udp_connect(handle, const_sockaddr)
// }

// fn C.uv_udp_getpeername(const_handle &C.uv_udp_t, name &C.sockaddr, namelen &int) int

// pub fn udp_getpeername(const_handle &C.uv_udp_t, name &C.sockaddr, namelen &int) int {
// 	return C.uv_udp_getpeername(const_handle, name, namelen)
// }

// fn C.uv_udp_getsockname(handle &C.uv_udp_t, name &C.sockaddr, namelen &int) int

// pub fn udp_getsockname(handle &C.uv_udp_t, name &C.sockaddr, namelen &int) int {
// 	return C.uv_udp_getsockname(handle, name, namelen)
// }

// fn C.uv_udp_set_membership(handle &C.uv_udp_t, multicast_addr &char, interface_addr &char, membership int) int

// pub fn udp_set_membership(handle &C.uv_udp_t, multicast_addr &char, interface_addr &char, membership Uv_membership) int {
// 	return C.uv_udp_set_membership(handle, multicast_addr, interface_addr, int(membership))
// }

// fn C.uv_udp_set_source_membership(handle &C.uv_udp_t, const_multicast_addr &char, const_interface_addr &char, const_source_addr &char, membership int) int

// pub fn udp_set_source_membership(handle &C.uv_udp_t, const_multicast_addr &char, const_interface_addr &char, const_source_addr &char, membership Uv_membership) int {
// 	return C.uv_udp_set_source_membership(handle, const_multicast_addr, const_interface_addr,
// 		const_source_addr, int(membership))
// }

// fn C.uv_udp_set_multicast_loop(handle &C.uv_udp_t, on int) int

// pub fn udp_set_multicast_loop(handle &C.uv_udp_t, on int) int {
// 	return C.uv_udp_set_multicast_loop(handle, on)
// }

// fn C.uv_udp_set_multicast_ttl(handle &C.uv_udp_t, ttl int) int

// pub fn udp_set_multicast_ttl(handle &C.uv_udp_t, ttl int) int {
// 	return C.uv_udp_set_multicast_ttl(handle, ttl)
// }

// fn C.uv_udp_set_multicast_interface(handle &C.uv_udp_t, interface_addr &char) int

// pub fn udp_set_multicast_interface(handle &C.uv_udp_t, const_interface_addr &char) int {
// 	return C.uv_udp_set_multicast_interface(handle, const_interface_addr)
// }

// fn C.uv_udp_set_broadcast(handle &C.uv_udp_t, on int) int

// pub fn udp_set_broadcast(handle &C.uv_udp_t, on int) int {
// 	return C.uv_udp_set_broadcast(handle, on)
// }

// fn C.uv_udp_set_ttl(handle &C.uv_udp_t, ttl int) int

// pub fn udp_set_ttl(handle &C.uv_udp_t, ttl int) int {
// 	return C.uv_udp_set_ttl(handle, ttl)
// }

// fn C.uv_udp_send(req &C.uv_udp_send_t, handle &C.uv_udp_t, bufs &C.uv_buf_t, nbufs u32, addr &C.sockaddr, cb fn (req &C.uv_udp_send_t, status int)) int

// pub fn udp_send(req &C.uv_udp_send_t, handle &C.uv_udp_t, const_bufs &C.uv_buf_t, nbufs u32, addr &C.sockaddr, cb fn (req &C.uv_udp_send_t, status int)) int {
// 	return C.uv_udp_send(req, handle, const_bufs, nbufs, addr, cb)
// }

// fn C.uv_udp_try_send(handle &C.uv_udp_t, const_bufs &C.uv_buf_t, nbufs u32, addr &C.sockaddr) int

// pub fn udp_try_send(handle &C.uv_udp_t, const_bufs &C.uv_buf_t, nbufs u32, const_sockaddr &C.sockaddr) int {
// 	return C.uv_udp_try_send(handle, const_bufs, nbufs, const_sockaddr)
// }

// fn C.uv_udp_recv_start(handle &C.uv_udp_t, alloc_cb fn (handle &C.uv_handle_t, suggested_size usize, buf &C.uv_buf_t), recv_cb fn (handle &C.uv_udp_t, nread isize, buf &C.uv_buf_t, addr &C.sockaddr, flags u32)) int

// pub fn udp_recv_start(handle &C.uv_udp_t, alloc_cb fn (handle &C.uv_handle_t, suggested_size usize, buf &C.uv_buf_t), recv_cb fn (handle &C.uv_udp_t, nread isize, buf &C.uv_buf_t, addr &C.sockaddr, flags u32)) int {
// 	return C.uv_udp_recv_start(handle, alloc_cb, recv_cb)
// }

// fn C.uv_udp_using_recvmmsg(const_handle &C.uv_udp_t) int

// pub fn udp_using_recvmmsg(const_handle &C.uv_udp_t) int {
// 	return C.uv_udp_using_recvmmsg(const_handle)
// }

// fn C.uv_udp_recv_stop(handle &C.uv_udp_t) int

// pub fn udp_recv_stop(handle &C.uv_udp_t) int {
// 	return C.uv_udp_recv_stop(handle)
// }

// fn C.uv_udp_get_send_queue_size(const_handle &C.uv_udp_t) usize

// pub fn udp_get_send_queue_size(const_handle &C.uv_udp_t) usize {
// 	return C.uv_udp_get_send_queue_size(const_handle)
// }

// fn C.uv_udp_get_send_queue_count(const_handle &C.uv_udp_t) usize

// pub fn udp_get_send_queue_count(const_handle &C.uv_udp_t) usize {
// 	return C.uv_udp_get_send_queue_count(const_handle)
// }

// // tty functions

// fn C.uv_tty_init(loop &C.uv_loop_t, handle &C.uv_tty_t, fd int, readable int) int

// pub fn tty_init(loop &C.uv_loop_t, handle &C.uv_tty_t, fd int, readable int) int {
// 	return C.uv_tty_init(loop, handle, fd, readable)
// }

// fn C.uv_tty_set_mode(handle &C.uv_tty_t, mode int) int

// pub fn tty_set_mode(handle &C.uv_tty_t, mode Uv_tty_mode) int {
// 	return C.uv_tty_set_mode(handle, int(mode))
// }

// fn C.uv_tty_reset_mode() int

// pub fn tty_reset_mode() int {
// 	return C.uv_tty_reset_mode()
// }

// fn C.uv_tty_get_winsize(handle &C.uv_tty_t, width &int, height &int) int

// pub fn tty_get_winsize(handle &C.uv_tty_t, width &int, height &int) int {
// 	return C.uv_tty_get_winsize(handle, width, height)
// }

// fn C.uv_tty_set_vterm_state(state int)

// pub fn tty_set_vterm_state(state Uv_tty_vtermstate) {
// 	C.uv_tty_set_vterm_state(int(state))
// }

// @[typedef]
// struct C.uv_tty_vtermstate_t {}

// fn C.uv_tty_get_vterm_state(state &C.uv_tty_vtermstate_t) int
// pub fn tty_get_vterm_state(state int) int {
// 	unsafe {
// 		return C.uv_tty_get_vterm_state(state)
// 	}
// }

fn C.uv_guess_handle(fd int) int

pub fn guess_handle(fd int) Uv_handle_type {
	unsafe {
		return Uv_handle_type(C.uv_guess_handle(fd))
	}
}

// // pipe functions

// fn C.uv_pipe_init(loop &C.uv_loop_t, handle &C.uv_pipe_t, ipc int) int

// pub fn pipe_init(loop &C.uv_loop_t, handle &C.uv_pipe_t, ipc int) int {
// 	return C.uv_pipe_init(loop, handle, ipc)
// }

// fn C.uv_pipe_open(handle &C.uv_pipe_t, file int) int

// pub fn pipe_open(handle &C.uv_pipe_t, file int) int {
// 	return C.uv_pipe_open(handle, file)
// }

// fn C.uv_pipe_bind(handle &C.uv_pipe_t, name &char) int

// pub fn pipe_bind(handle &C.uv_pipe_t, const_name &char) int {
// 	return C.uv_pipe_bind(handle, const_name)
// }

// fn C.uv_pipe_bind2(handle &C.uv_pipe_t, const_name &char, namelen usize, flags usize) int

// pub fn pipe_bind2(handle &C.uv_pipe_t, const_name &char, namelen usize, flags usize) int {
// 	return C.uv_pipe_bind2(handle, const_name, namelen, flags)
// }

// fn C.uv_pipe_connect(req &C.uv_connect_t, handle &C.uv_pipe_t, name &char, cb fn (req &C.uv_connect_t, status int))

// pub fn pipe_connect(req &C.uv_connect_t, handle &C.uv_pipe_t, const_name &char, cb fn (req &C.uv_connect_t, status int)) {
// 	C.uv_pipe_connect(req, handle, const_name, cb)
// }

// fn C.uv_pipe_connect2(req &C.uv_connect_t, handle &C.uv_pipe_t, const_name &char, namelen usize, flags usize, cb fn (req &C.uv_connect_t, status int)) int

// pub fn pipe_connect2(req &C.uv_connect_t, handle &C.uv_pipe_t, const_name &char, namelen usize, flags usize, cb fn (req &C.uv_connect_t, status int)) int {
// 	return C.uv_pipe_connect2(req, handle, const_name, namelen, flags, cb)
// }

// fn C.uv_pipe_getsockname(handle &C.uv_pipe_t, buffer &char, size &usize) int

// pub fn pipe_getsockname(handle &C.uv_pipe_t, name &char, namelen &usize) int {
// 	return C.uv_pipe_getsockname(handle, name, namelen)
// }

// fn C.uv_pipe_getpeername(handle &C.uv_pipe_t, buffer &char, size &usize) int

// pub fn pipe_getpeername(handle &C.uv_pipe_t, name &char, namelen &usize) int {
// 	return C.uv_pipe_getpeername(handle, name, namelen)
// }

// fn C.uv_pipe_pending_instances(handle &C.uv_pipe_t, count int)

// pub fn pipe_pending_instances(handle &C.uv_pipe_t, count int) {
// 	C.uv_pipe_pending_instances(handle, count)
// }

// fn C.uv_pipe_pending_count(handle &C.uv_pipe_t) int

// pub fn pipe_pending_count(handle &C.uv_pipe_t) int {
// 	return C.uv_pipe_pending_count(handle)
// }

// fn C.uv_pipe_pending_type(handle &C.uv_pipe_t) int

// pub fn pipe_pending_type(handle &C.uv_pipe_t) int {
// 	return C.uv_pipe_pending_type(handle)
// }

// fn C.uv_pipe_chmod(handle &C.uv_pipe_t, flags int) int

// pub fn pipe_chmod(handle &C.uv_pipe_t, flags int) int {
// 	return C.uv_pipe_chmod(handle, flags)
// }

// // poll functions

// fn C.uv_poll_init(loop &C.uv_loop_t, handle &C.uv_poll_t, fd int) int

// pub fn poll_init(loop &C.uv_loop_t, handle &C.uv_poll_t, fd int) int {
// 	return C.uv_poll_init(loop, handle, fd)
// }

// fn C.uv_poll_init_socket(loop &C.uv_loop_t, handle &C.uv_poll_t, socket int) int

// pub fn poll_init_socket(loop &C.uv_loop_t, handle &C.uv_poll_t, socket int) int {
// 	$if compile_static {
// 		return C.uv_poll_init_socket(loop, handle, socket)
// 	} $else {
// 		panic('uv_poll_init_socket is not available when building from source')
// 		return -1
// 	}
// }

// fn C.uv_poll_start(handle &C.uv_poll_t, events int, cb fn (handle &C.uv_poll_t, status int, events int)) int

// pub fn poll_start(handle &C.uv_poll_t, events int, cb fn (handle &C.uv_poll_t, status int, events int)) int {
// 	return C.uv_poll_start(handle, events, cb)
// }

// fn C.uv_poll_stop(handle &C.uv_poll_t) int

// pub fn poll_stop(handle &C.uv_poll_t) int {
// 	return C.uv_poll_stop(handle)
// }

// // prepare functions

// fn C.uv_prepare_init(loop &C.uv_loop_t, handle &C.uv_prepare_t) int

// pub fn prepare_init(loop &C.uv_loop_t, handle &C.uv_prepare_t) int {
// 	return C.uv_prepare_init(loop, handle)
// }

// fn C.uv_prepare_start(handle &C.uv_prepare_t, cb fn (handle &C.uv_prepare_t)) int

// pub fn prepare_start(handle &C.uv_prepare_t, cb fn (handle &C.uv_prepare_t)) int {
// 	return C.uv_prepare_start(handle, cb)
// }

// fn C.uv_prepare_stop(handle &C.uv_prepare_t) int

// pub fn prepare_stop(handle &C.uv_prepare_t) int {
// 	return C.uv_prepare_stop(handle)
// }

// // check functions

// fn C.uv_check_init(loop &C.uv_loop_t, handle &C.uv_check_t) int

// pub fn check_init(loop &C.uv_loop_t, handle &C.uv_check_t) int {
// 	return C.uv_check_init(loop, handle)
// }

// fn C.uv_check_start(handle &C.uv_check_t, cb fn (handle &C.uv_check_t)) int

// pub fn check_start(handle &C.uv_check_t, cb fn (handle &C.uv_check_t)) int {
// 	return C.uv_check_start(handle, cb)
// }

// fn C.uv_check_stop(handle &C.uv_check_t) int

// pub fn check_stop(handle &C.uv_check_t) int {
// 	return C.uv_check_stop(handle)
// }

// idle functions

// fn C.uv_idle_init(loop &C.uv_loop_t, handle &C.uv_idle_t) int

// pub fn idle_init(loop &C.uv_loop_t, handle &C.uv_idle_t) int {
// 	return C.uv_idle_init(loop, handle)
// }

// fn C.uv_idle_start(handle &C.uv_idle_t, cb fn (handle &C.uv_idle_t)) int

// pub fn idle_start(handle &C.uv_idle_t, cb fn (handle &C.uv_idle_t)) int {
// 	return C.uv_idle_start(handle, cb)
// }

// fn C.uv_idle_stop(handle &C.uv_idle_t) int

// pub fn idle_stop(handle &C.uv_idle_t) int {
// 	return C.uv_idle_stop(handle)
// }

// // async functions
// fn C.uv_async_init(loop &C.uv_loop_t, handle &C.uv_async_t, cb fn (handle &C.uv_async_t)) int

// pub fn async_init(loop &C.uv_loop_t, handle &C.uv_async_t, cb fn (handle &C.uv_async_t)) int {
// 	return C.uv_async_init(loop, handle, cb)
// }

// fn C.uv_async_send(handle &C.uv_async_t) int

// pub fn async_send(handle &C.uv_async_t) int {
// 	return C.uv_async_send(handle)
// }

// // timer functions

// fn C.uv_timer_init(loop &C.uv_loop_t, handle &C.uv_timer_t) int

// pub fn timer_init(loop &C.uv_loop_t, handle &C.uv_timer_t) int {
// 	return C.uv_timer_init(loop, handle)
// }

// fn C.uv_timer_start(handle &C.uv_timer_t, cb fn (handle &C.uv_timer_t), timeout u64, repeat u64) int

// pub fn timer_start(handle &C.uv_timer_t, cb fn (handle &C.uv_timer_t), timeout u64, repeat u64) int {
// 	return C.uv_timer_start(handle, cb, timeout, repeat)
// }

// fn C.uv_timer_stop(handle &C.uv_timer_t) int

// pub fn timer_stop(handle &C.uv_timer_t) int {
// 	return C.uv_timer_stop(handle)
// }

// fn C.uv_timer_again(handle &C.uv_timer_t) int

// pub fn timer_again(handle &C.uv_timer_t) int {
// 	return C.uv_timer_again(handle)
// }

// fn C.uv_timer_set_repeat(handle &C.uv_timer_t, repeat u64)

// pub fn timer_set_repeat(handle &C.uv_timer_t, repeat u64) {
// 	C.uv_timer_set_repeat(handle, repeat)
// }

// fn C.uv_timer_get_repeat(handle &C.uv_timer_t) u64

// pub fn timer_get_repeat(const_handle &C.uv_timer_t) u64 {
// 	return C.uv_timer_get_repeat(const_handle)
// }

// fn C.uv_timer_get_due_in(const_handle &C.uv_timer_t) u64

// pub fn timer_get_due_in(const_handle &C.uv_timer_t) u64 {
// 	return C.uv_timer_get_due_in(const_handle)
// }

// address/name functions

fn C.uv_getaddrinfo(loop &C.uv_loop_t, req &C.uv_getaddrinfo_t, cb fn (req &C.uv_getaddrinfo_t, status int, res &C.addrinfo), const_node &char, const_service &char, const_hints &C.addrinfo) int

pub fn getaddrinfo(loop &C.uv_loop_t, req &C.uv_getaddrinfo_t, cb fn (req &C.uv_getaddrinfo_t, status int, res &C.addrinfo), const_node &char, const_service &char, const_hints &C.addrinfo) int {
	return C.uv_getaddrinfo(loop, req, cb, const_node, const_service, const_hints)
}

fn C.uv_freeaddrinfo(addr &C.addrinfo)

pub fn freeaddrinfo(ai &C.addrinfo) {
	C.uv_freeaddrinfo(ai)
}

fn C.uv_getnameinfo(loop &C.uv_loop_t, req &C.uv_getnameinfo_t, cb fn (req &C.uv_getnameinfo_t, status int, hostname &char, service &char), const_sockaddr &C.sockaddr, flags int) int

pub fn getnameinfo(loop &C.uv_loop_t, req &C.uv_getnameinfo_t, cb fn (req &C.uv_getnameinfo_t, status int, hostname &char, service &char), const_sockaddr &C.sockaddr, flags int) int {
	return C.uv_getnameinfo(loop, req, cb, const_sockaddr, flags)
}

// // process functions

// fn C.uv_spawn(loop &C.uv_loop_t, handle &C.uv_process_t, options &C.uv_process_options_t) int

// pub fn uv_spawn(loop &C.uv_loop_t, handle &C.uv_process_t, options &C.uv_process_options_t) int {
// 	return C.uv_spawn(loop, handle, options)
// }

// fn C.uv_process_kill(handle &C.uv_process_t, signum int) int

// pub fn process_kill(handle &C.uv_process_t, signum int) int {
// 	return C.uv_process_kill(handle, signum)
// }

// fn C.uv_kill(pid int, signum int) int

// pub fn kill(pid int, signum int) int {
// 	return C.uv_kill(pid, signum)
// }

// work functions

fn C.uv_queue_work(loop &C.uv_loop_t, work &C.uv_work_t, work_cb fn (work &C.uv_work_t), after_work_cb fn (work &C.uv_work_t, status int))

pub fn queue_work(loop &C.uv_loop_t, work &C.uv_work_t, work_cb fn (work &C.uv_work_t), after_work_cb fn (work &C.uv_work_t, status int)) {
	C.uv_queue_work(loop, work, work_cb, after_work_cb)
}

fn C.uv_cancel(req &C.uv_req_t) int

pub fn cancel(req &C.uv_req_t) int {
	return C.uv_cancel(req)
}

// memory functions

fn C.uv_getrusage(rusage &C.uv_rusage_t) int

fn C.uv_setup_args(argc int, argv &&char) &&char

pub fn setup_args(argc int, argv &&char) &&char {
	return C.uv_setup_args(argc, argv)
}

fn C.uv_get_process_title(title &char, size usize) int

pub fn get_process_title(title &char, size usize) int {
	return C.uv_get_process_title(title, size)
}

fn C.uv_set_process_title(const_title &char) int

pub fn set_process_title(const_title &char) int {
	return C.uv_set_process_title(const_title)
}

fn C.uv_resident_set_memory(rss &usize) int

pub fn resident_set_memory(rss &usize) int {
	return C.uv_resident_set_memory(rss)
}

fn C.uv_uptime(uptime &f64) int

pub fn uptime(uptime &f64) int {
	return C.uv_uptime(uptime)
}

fn C.uv_get_osfhandle(fd int) int

pub fn get_osfhandle(fd int) int {
	return C.uv_get_osfhandle(fd)
}

// fn C.uv_set_osfhandle(os_fd int) int

// pub fn set_osfhandle(os_fd int) int {
// 	return C.uv_set_osfhandle(os_fd)
// }

pub fn getrusage(rusage &C.uv_rusage_t) int {
	return C.uv_getrusage(rusage)
}

// os functions
fn C.uv_os_homedir(buf &char, size &usize) int

pub fn os_homedir(buf &char, size &usize) int {
	return C.uv_os_homedir(buf, size)
}

fn C.uv_os_tmpdir(buff &char, size &usize) int

pub fn os_tmpdir(buf &char, size &usize) int {
	return C.uv_os_tmpdir(buf, size)
}

fn C.uv_os_get_passwd(pwd &C.uv_passwd_t) int

pub fn os_get_passwd(pwd &C.uv_passwd_t) int {
	return C.uv_os_get_passwd(pwd)
}

fn C.uv_os_free_passwd(pwd &C.uv_passwd_t)

pub fn os_free_passwd(pwd &C.uv_passwd_t) {
	C.uv_os_free_passwd(pwd)
}

fn C.uv_os_get_passwd2(pwd &C.uv_passwd_t, uid C.uv_uid_t) int

pub fn os_get_passwd2(pwd &C.uv_passwd_t, uid C.uv_uid_t) int {
	return C.uv_os_get_passwd2(pwd, uid)
}

fn C.uv_os_get_group(group &C.uv_group_t, gid C.uv_uid_t) int

pub fn os_get_group(group &C.uv_group_t, gid C.uv_uid_t) int {
	return C.uv_os_get_group(group, gid)
}

fn C.uv_os_free_group(group &C.uv_group_t)

pub fn os_free_group(group &C.uv_group_t) {
	C.uv_os_free_group(group)
}

fn C.uv_os_getpid() int

pub fn os_getpid() int {
	return C.uv_os_getpid()
}

fn C.uv_os_getppid() int

pub fn os_getppid() int {
	return C.uv_os_getppid()
}

fn C.uv_os_getpriority(pid int, priority &int) int

pub fn os_getpriority(pid int, priority &int) int {
	return C.uv_os_getpriority(pid, priority)
}

fn C.uv_os_setpriority(pid int, priority int) int

pub fn os_setpriority(pid int, priority int) int {
	return C.uv_os_setpriority(pid, priority)
}

// cpu functions

fn C.uv_thread_getpriority(tid C.uv_thread_t, priority &int) int

pub fn thread_getpriority(tid C.uv_thread_t, priority &int) int {
	return C.uv_thread_getpriority(tid, priority)
}

fn C.uv_thread_setpriority(tid C.uv_thread_t, priority Uv_thread_priority) int

pub fn thread_setpriority(tid C.uv_thread_t, priority Uv_thread_priority) int {
	return C.uv_thread_setpriority(tid, priority)
}

fn C.uv_available_parallelism() usize

pub fn available_parallelism() usize {
	return C.uv_available_parallelism()
}

fn C.uv_cpu_info(cpu_infos &&C.uv_cpu_info_t, count &int) int

pub fn cpu_info(cpu_infos &&C.uv_cpu_info_t, count &int) int {
	return C.uv_cpu_info(cpu_infos, count)
}

fn C.uv_free_cpu_info(cpu_infos &C.uv_cpu_info_t, count int)

pub fn free_cpu_info(cpu_infos &C.uv_cpu_info_t, count int) {
	C.uv_free_cpu_info(cpu_infos, count)
}

fn C.uv_cpumask_size() int

pub fn cpumask_size() int {
	return C.uv_cpumask_size()
}

fn C.uv_interface_addresses(addresses &&C.uv_interface_address_t, count &int) int

pub fn interface_addresses(addresses &&C.uv_interface_address_t, count &int) int {
	return C.uv_interface_addresses(addresses, count)
}

fn C.uv_free_interface_addresses(addresses &&C.uv_interface_address_t, count int)

pub fn free_interface_addresses(addresses &C.uv_interface_address_t, count int) {
	C.uv_free_interface_addresses(addresses, count)
}

// env functions

fn C.uv_os_environ(env_items &&C.uv_env_item_t, count &int) int

pub fn os_environ(env_items &&C.uv_env_item_t, count &int) int {
	return C.uv_os_environ(env_items, count)
}

fn C.uv_os_free_environ(env_items &C.uv_env_item_t, count int)

pub fn os_free_environ(env_items &C.uv_env_item_t, count int) {
	C.uv_os_free_environ(env_items, count)
}

fn C.uv_os_getenv(const_name &char, buffer &char, size &usize) int

pub fn os_getenv(const_name &char, buffer &char, size &usize) int {
	return C.uv_os_getenv(const_name, buffer, size)
}

fn C.uv_os_setenv(const_name &char, const_value &char) int

pub fn os_setenv(const_name &char, const_value &char) int {
	return C.uv_os_setenv(const_name, const_value)
}

fn C.uv_os_unsetenv(const_name &char) int

pub fn os_unsetenv(const_name &char) int {
	return C.uv_os_unsetenv(const_name)
}

// metrics functions

fn C.uv_os_gethostname(buffer &char, size &usize) int

pub fn os_gethostname(buffer &char, size &usize) int {
	return C.uv_os_gethostname(buffer, size)
}

fn C.uv_os_uname(buffer &C.uv_utsname_t) int

pub fn os_uname(buffer &C.uv_utsname_t) int {
	return C.uv_os_uname(buffer)
}

fn C.uv_metrics_info(loop &C.uv_loop_t, metrics &C.uv_metrics_t) int

pub fn metrics_info(loop &C.uv_loop_t, metrics &C.uv_metrics_t) int {
	return C.uv_metrics_info(loop, metrics)
}

fn C.uv_metrics_idle_time(loop &C.uv_loop_t) u64

pub fn metrics_idle_time(loop &C.uv_loop_t) u64 {
	return C.uv_metrics_idle_time(loop)
}

// fs helper functions

fn C.uv_fs_get_type(const_fs &C.uv_fs_t) int

pub fn fs_get_type(const_fs &C.uv_fs_t) Uv_fs_type {
	unsafe {
		return Uv_fs_type(C.uv_fs_get_type(const_fs))
	}
}

fn C.uv_fs_get_result(const_fs &C.uv_fs_t) int

pub fn fs_get_result(const_fs &C.uv_fs_t) int {
	return C.uv_fs_get_result(const_fs)
}

fn C.uv_fs_get_system_error(const_fs &C.uv_fs_t) int

pub fn fs_get_system_error(const_fs &C.uv_fs_t) int {
	return C.uv_fs_get_system_error(const_fs)
}

fn C.uv_fs_get_ptr(const_fs &C.uv_fs_t) &voidptr

pub fn fs_get_ptr(const_fs &C.uv_fs_t) &voidptr {
	return C.uv_fs_get_ptr(const_fs)
}

fn C.uv_fs_get_path(const_fs &C.uv_fs_t) &char

pub fn fs_get_path(const_fs &C.uv_fs_t) string {
	unsafe {
		return cstring_to_vstring(C.uv_fs_get_path(const_fs))
	}
}

fn C.uv_fs_get_statbuf(fs_handle &C.uv_fs_t) &C.uv_stat_t

pub fn fs_get_statbuf(fs_handle &C.uv_fs_t) &C.uv_stat_t {
	return C.uv_fs_get_statbuf(fs_handle)
}

fn C.uv_fs_req_cleanup(fs &C.uv_fs_t)

pub fn fs_req_cleanup(fs &C.uv_fs_t) {
	C.uv_fs_req_cleanup(fs)
}

fn C.uv_fs_close(loop &C.uv_loop_t, req &C.uv_fs_t, file int, cb fn (req &C.uv_fs_t))

pub fn fs_close(loop &C.uv_loop_t, req &C.uv_fs_t, file int, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_close(loop, req, file, cb)
}

fn C.uv_fs_open(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, flags int, mode int, cb fn (req &C.uv_fs_t))

pub fn fs_open(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, flags int, mode int, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_open(loop, req, path, flags, mode, cb)
}

fn C.uv_fs_read(loop &C.uv_loop_t, req &C.uv_fs_t, file int, bufs &C.uv_buf_t, nbufs u32, offset i64, cb fn (req &C.uv_fs_t))

pub fn fs_read(loop &C.uv_loop_t, req &C.uv_fs_t, file int, bufs &C.uv_buf_t, nbufs u32, offset i64, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_read(loop, req, file, bufs, nbufs, offset, cb)
}

fn C.uv_fs_unlink(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, cb fn (req &C.uv_fs_t))

pub fn fs_unlink(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_unlink(loop, req, path, cb)
}

fn C.uv_fs_write(loop &C.uv_loop_t, req &C.uv_fs_t, file int, bufs &C.uv_buf_t, nbufs u32, offset i64, cb fn (req &C.uv_fs_t))

pub fn fs_write(loop &C.uv_loop_t, req &C.uv_fs_t, file int, bufs &C.uv_buf_t, nbufs u32, offset i64, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_write(loop, req, file, bufs, nbufs, offset, cb)
}

// --------

fn C.uv_fs_copyfile(loop &C.uv_loop_t, req &C.uv_fs_t, const_path &char, const_new_path &char, flags int, cb fn (req &C.uv_fs_t)) int

pub fn fs_copyfile(loop &C.uv_loop_t, req &C.uv_fs_t, const_path &char, const_new_path &char, flags int, cb fn (req &C.uv_fs_t)) int {
	return C.uv_fs_copyfile(loop, req, const_path, const_new_path, flags, cb)
}

fn C.uv_fs_mkdir(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, mode int, cb fn (req &C.uv_fs_t))

pub fn fs_mkdir(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, mode int, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_mkdir(loop, req, path, mode, cb)
}

fn C.uv_fs_mkdtemp(loop &C.uv_loop_t, req &C.uv_fs_t, const_tpl &char, cb fn (req &C.uv_fs_t)) int

pub fn fs_mkdtemp(loop &C.uv_loop_t, req &C.uv_fs_t, const_tpl &char, cb fn (req &C.uv_fs_t)) int {
	return C.uv_fs_mkdtemp(loop, req, const_tpl, cb)
}

fn C.uv_fs_mkstemp(loop &C.uv_loop_t, req &C.uv_fs_t, const_tpl &char, cb fn (req &C.uv_fs_t)) int

pub fn fs_mkstemp(loop &C.uv_loop_t, req &C.uv_fs_t, const_tpl &char, flags int, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_mkstemp(loop, req, const_tpl, cb)
}

fn C.uv_fs_rmdir(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, cb fn (req &C.uv_fs_t))

pub fn fs_rmdir(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_rmdir(loop, req, path, cb)
}

fn C.uv_fs_scandir(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, flags int, cb fn (req &C.uv_fs_t))

pub fn fs_scandir(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, flags int, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_scandir(loop, req, path, flags, cb)
}

fn C.uv_fs_scandir_next(req &C.uv_fs_t, ent &C.uv_dirent_t) int

pub fn fs_scandir_next(req &C.uv_fs_t, ent &C.uv_dirent_t) int {
	return C.uv_fs_scandir_next(req, ent)
}

fn C.uv_fs_opendir(loop &C.uv_loop_t, req &C.uv_fs_t, const_path &char, cb fn (req &C.uv_fs_t)) int

pub fn fs_opendir(loop &C.uv_loop_t, req &C.uv_fs_t, const_path &char, cb fn (req &C.uv_fs_t)) int {
	return C.uv_fs_opendir(loop, req, const_path, cb)
}

fn C.uv_fs_readdir(loop &C.uv_loop_t, req &C.uv_fs_t, dir &C.uv_dir_t, cb fn (req &C.uv_fs_t)) int

pub fn fs_readdir(loop &C.uv_loop_t, req &C.uv_fs_t, dir &C.uv_dir_t, cb fn (req &C.uv_fs_t)) int {
	return C.uv_fs_readdir(loop, req, dir, cb)
}

fn C.uv_fs_closedir(loop &C.uv_loop_t, req &C.uv_fs_t, dir &C.uv_dir_t, cb fn (req &C.uv_fs_t)) int

pub fn fs_closedir(loop &C.uv_loop_t, req &C.uv_fs_t, dir &C.uv_dir_t, cb fn (req &C.uv_fs_t)) int {
	return C.uv_fs_closedir(loop, req, dir, cb)
}

fn C.uv_fs_stat(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, cb fn (req &C.uv_fs_t))

pub fn fs_stat(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_stat(loop, req, path, cb)
}

fn C.uv_fs_fstat(loop &C.uv_loop_t, req &C.uv_fs_t, file int, cb fn (req &C.uv_fs_t))

pub fn fs_fstat(loop &C.uv_loop_t, req &C.uv_fs_t, file int, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_fstat(loop, req, file, cb)
}

fn C.uv_fs_rename(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, new_path &char, cb fn (req &C.uv_fs_t))

pub fn fs_rename(loop &C.uv_loop_t, req &C.uv_fs_t, const_path &char, const_new_path &char, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_rename(loop, req, const_path, const_new_path, cb)
}

fn C.uv_fs_fsync(loop &C.uv_loop_t, req &C.uv_fs_t, file int, cb fn (req &C.uv_fs_t))

pub fn fs_fsync(loop &C.uv_loop_t, req &C.uv_fs_t, file int, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_fsync(loop, req, file, cb)
}

fn C.uv_fs_fdatasync(loop &C.uv_loop_t, req &C.uv_fs_t, file int, cb fn (req &C.uv_fs_t))

pub fn fs_fdatasync(loop &C.uv_loop_t, req &C.uv_fs_t, file int, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_fdatasync(loop, req, file, cb)
}

fn C.uv_fs_ftruncate(loop &C.uv_loop_t, req &C.uv_fs_t, file int, offset i64, cb fn (req &C.uv_fs_t))

pub fn fs_ftruncate(loop &C.uv_loop_t, req &C.uv_fs_t, file int, offset i64, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_ftruncate(loop, req, file, offset, cb)
}

fn C.uv_fs_sendfile(loop &C.uv_loop_t, req &C.uv_fs_t, out_fd int, in_fd int, in_offset i64, length usize, cb fn (req &C.uv_fs_t))

pub fn fs_sendfile(loop &C.uv_loop_t, req &C.uv_fs_t, out_fd int, in_fd int, in_offset i64, length usize, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_sendfile(loop, req, out_fd, in_fd, in_offset, length, cb)
}

fn C.uv_fs_access(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, mode int, cb fn (req &C.uv_fs_t))

pub fn fs_access(loop &C.uv_loop_t, req &C.uv_fs_t, const_path &char, mode int, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_access(loop, req, const_path, mode, cb)
}

fn C.uv_fs_chmod(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, mode int, cb fn (req &C.uv_fs_t))

pub fn fs_chmod(loop &C.uv_loop_t, req &C.uv_fs_t, const_path &char, mode int, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_chmod(loop, req, const_path, mode, cb)
}

fn C.uv_fs_fchmod(loop &C.uv_loop_t, req &C.uv_fs_t, file int, mode int, cb fn (req &C.uv_fs_t))

pub fn fs_fchmod(loop &C.uv_loop_t, req &C.uv_fs_t, file int, mode int, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_fchmod(loop, req, file, mode, cb)
}

fn C.uv_fs_utime(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, atime f64, mtime f64, cb fn (req &C.uv_fs_t))

pub fn fs_utime(loop &C.uv_loop_t, req &C.uv_fs_t, const_path &char, atime f64, mtime f64, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_utime(loop, req, const_path, atime, mtime, cb)
}

fn C.uv_fs_utime_ex(loop &C.uv_loop_t, req &C.uv_fs_t, const_path &char, btime f64, atime f64, mtime f64, cb fn (req &C.uv_fs_t)) int

pub fn fs_utime_ex(loop &C.uv_loop_t, req &C.uv_fs_t, const_path &char, btime f64, atime f64, mtime f64, cb fn (req &C.uv_fs_t)) int {
	$if !compile_static {
		return C.uv_fs_utime_ex(loop, req, const_path, btime, atime, mtime, cb)
	} $else {
		panic('uv_fs_utime_ex is not available in static build')
		return -1
	}
}

fn C.uv_fs_futime(loop &C.uv_loop_t, req &C.uv_fs_t, file int, atime f64, mtime f64, cb fn (req &C.uv_fs_t))

pub fn fs_futime(loop &C.uv_loop_t, req &C.uv_fs_t, file int, atime f64, mtime f64, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_futime(loop, req, file, atime, mtime, cb)
}

// $if compile_static {

// }
fn C.uv_fs_futime_ex(loop &C.uv_loop_t, req &C.uv_fs_t, file int, btime f64, atime f64, mtime f64, cb fn (req &C.uv_fs_t)) int

pub fn fs_futime_ex(loop &C.uv_loop_t, req &C.uv_fs_t, file int, btime f64, atime f64, mtime f64, cb fn (req &C.uv_fs_t)) int {
	$if !compile_static {
		return C.uv_fs_futime_ex(loop, req, file, btime, atime, mtime, cb)
	} $else {
		panic('uv_fs_futime_ex is not available in static build')
		return -1
	}
	// return C.uv_fs_futime_ex(loop, req, file, btime, atime, mtime, cb)
}

fn C.uv_fs_lutime(loop &C.uv_loop_t, req &C.uv_fs_t, const_path &char, atime f64, mtime f64, cb fn (req &C.uv_fs_t)) int

pub fn fs_lutime(loop &C.uv_loop_t, req &C.uv_fs_t, const_path &char, atime f64, mtime f64, cb fn (req &C.uv_fs_t)) int {
	return C.uv_fs_lutime(loop, req, const_path, atime, mtime, cb)
}

fn C.uv_fs_lstat(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, cb fn (req &C.uv_fs_t))

pub fn fs_lstat(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_lstat(loop, req, path, cb)
}

fn C.uv_fs_link(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, new_path &char, cb fn (req &C.uv_fs_t))

pub fn fs_link(loop &C.uv_loop_t, req &C.uv_fs_t, const_path &char, const_new_path &char, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_link(loop, req, const_path, const_new_path, cb)
}

fn C.uv_fs_symlink(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, new_path &char, flags int, cb fn (req &C.uv_fs_t))

pub fn fs_symlink(loop &C.uv_loop_t, req &C.uv_fs_t, const_path &char, const_new_path &char, flags int, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_symlink(loop, req, const_path, const_new_path, flags, cb)
}

fn C.uv_fs_readlink(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, cb fn (req &C.uv_fs_t))

pub fn fs_readlink(loop &C.uv_loop_t, req &C.uv_fs_t, const_path &char, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_readlink(loop, req, const_path, cb)
}

fn C.uv_fs_realpath(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, cb fn (req &C.uv_fs_t))

pub fn fs_realpath(loop &C.uv_loop_t, req &C.uv_fs_t, const_path &char, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_realpath(loop, req, const_path, cb)
}

fn C.uv_fs_chown(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, uid u32, gid u32, cb fn (req &C.uv_fs_t))

pub fn fs_chown(loop &C.uv_loop_t, req &C.uv_fs_t, const_path &char, uid usize, gid usize, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_chown(loop, req, const_path, uid, gid, cb)
}

fn C.uv_fs_fchown(loop &C.uv_loop_t, req &C.uv_fs_t, file int, uid u32, gid u32, cb fn (req &C.uv_fs_t))

pub fn fs_fchown(loop &C.uv_loop_t, req &C.uv_fs_t, file int, uid usize, gid usize, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_fchown(loop, req, file, uid, gid, cb)
}

fn C.uv_fs_lchown(loop &C.uv_loop_t, req &C.uv_fs_t, const_path &char, uid usize, gid usize, cb fn (req &C.uv_fs_t)) int

pub fn fs_lchown(loop &C.uv_loop_t, req &C.uv_fs_t, const_path &char, uid usize, gid usize, cb fn (req &C.uv_fs_t)) int {
	return C.uv_fs_lchown(loop, req, const_path, uid, gid, cb)
}

fn C.uv_fs_statfs(loop &C.uv_loop_t, req &C.uv_fs_t, const_path &char, cb fn (req &C.uv_fs_t)) int

pub fn fs_statfs(loop &C.uv_loop_t, req &C.uv_fs_t, const_path &char, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_statfs(loop, req, const_path, cb)
}

// // fs poll functions

// fn C.uv_fs_poll_init(loop &C.uv_loop_t, handle &C.uv_fs_poll_t) int

// pub fn fs_poll_init(loop &C.uv_loop_t, handle &C.uv_fs_poll_t) int {
// 	return C.uv_fs_poll_init(loop, handle)
// }

// fn C.uv_fs_poll_start(handle &C.uv_fs_poll_t, cb fn (handle &C.uv_fs_poll_t, status int, prev &C.uv_stat_t, curr &C.uv_stat_t), path &char, interval u32) int

// pub fn fs_poll_start(handle &C.uv_fs_poll_t, cb fn (handle &C.uv_fs_poll_t, status int, const_prev &C.uv_stat_t, const_curr &C.uv_stat_t), const_path &char, interval usize) int {
// 	return C.uv_fs_poll_start(handle, cb, const_path, interval)
// }

// fn C.uv_fs_poll_stop(handle &C.uv_fs_poll_t) int

// pub fn fs_poll_stop(handle &C.uv_fs_poll_t) int {
// 	return C.uv_fs_poll_stop(handle)
// }

// fn C.uv_fs_poll_getpath(handle &C.uv_fs_poll_t, path &char, size &usize) int

// pub fn fs_poll_getpath(handle &C.uv_fs_poll_t, path &char, size &usize) int {
// 	return C.uv_fs_poll_getpath(handle, path, size)
// }

// // signal functions

// fn C.uv_signal_init(loop &C.uv_loop_t, handle &C.uv_signal_t) int

// pub fn signal_init(loop &C.uv_loop_t, handle &C.uv_signal_t) int {
// 	return C.uv_signal_init(loop, handle)
// }

// fn C.uv_signal_start(handle &C.uv_signal_t, cb fn (handle &C.uv_signal_t, signum int), signum int) int

// pub fn signal_start(handle &C.uv_signal_t, cb fn (handle &C.uv_signal_t, signum int), signum int) int {
// 	return C.uv_signal_start(handle, cb, signum)
// }

// fn C.uv_signal_start_oneshot(signal &C.uv_signal_t, cb fn (signal &C.uv_signal_t, signum int), signum int) int

// pub fn signal_start_oneshot(signal &C.uv_signal_t, cb fn (signal &C.uv_signal_t, signum int), signum int) int {
// 	return C.uv_signal_start_oneshot(signal, cb, signum)
// }

// fn C.uv_signal_stop(handle &C.uv_signal_t) int

// pub fn signal_stop(handle &C.uv_signal_t) int {
// 	return C.uv_signal_stop(handle)
// }

fn C.uv_loadavg(avg &f64)

pub fn loadavg(avg &f64) {
	C.uv_loadavg(avg)
}

// // fs event functions

// fn C.uv_fs_event_init(loop &C.uv_loop_t, handle &C.uv_fs_event_t) int

// pub fn fs_event_init(loop &C.uv_loop_t, handle &C.uv_fs_event_t) int {
// 	return C.uv_fs_event_init(loop, handle)
// }

// fn C.uv_fs_event_start(handle &C.uv_fs_event_t, cb fn (handle &C.uv_fs_event_t, const_filename &char, events int, status int), const_path &char, flags int) int

// pub fn fs_event_start(handle &C.uv_fs_event_t, cb fn (handle &C.uv_fs_event_t, const_filename &char, events int, status int), const_path &char, flags int) int {
// 	return C.uv_fs_event_start(handle, cb, const_path, flags)
// }

// fn C.uv_fs_event_stop(handle &C.uv_fs_event_t) int

// pub fn fs_event_stop(handle &C.uv_fs_event_t) int {
// 	return C.uv_fs_event_stop(handle)
// }

// fn C.uv_fs_event_getpath(handle &C.uv_fs_event_t, path &char, size &usize) int

// pub fn fs_event_getpath(handle &C.uv_fs_event_t, path &char, size &usize) int {
// 	return C.uv_fs_event_getpath(handle, path, size)
// }

// ip functions

fn C.uv_ip4_addr(const_ip &char, port int, addr &C.sockaddr_in) int

pub fn ip4_addr(const_ip &char, port int, addr &C.sockaddr_in) int {
	return C.uv_ip4_addr(const_ip, port, &C.sockaddr_in(addr))
}

// TODO must use 'struct' tag to refer to type 'sockaddr_in6'
// fn C.uv_ip6_addr(const_ip &char, port int, addr &C.sockaddr_in6) int

// pub fn ip6_addr(const_ip &char, port int, addr &C.sockaddr_in6) int {
// 	return C.uv_ip6_addr(const_ip, port, addr)
// }

fn C.uv_ip4_name(const_src &C.sockaddr_in, dst &char, size usize) int

pub fn ip4_name(const_src &C.sockaddr_in, dst &char, size usize) int {
	return C.uv_ip4_name(const_src, dst, size)
}

// TODO must use 'struct' tag to refer to type 'sockaddr_in6'

// fn C.uv_ip6_name(const_src &C.sockaddr_in6, dst &char, size usize) int

// pub fn ip6_name(const_src &C.sockaddr_in6, dst &char, size usize) int {
// 	return C.uv_ip6_name(const_src, dst, size)
// }

fn C.uv_ip_name(const_src &C.sockaddr, dst &char, size usize) int

pub fn ip_name(const_src &C.sockaddr, dst &char, size usize) int {
	return C.uv_ip_name(const_src, dst, size)
}

fn C.uv_inet_ntop(af int, const_src &voidptr, dst &char, size usize) int

pub fn inet_ntop(af int, const_src &voidptr, dst &char, size usize) int {
	return C.uv_inet_ntop(af, const_src, dst, size)
}

fn C.uv_inet_pton(af int, const_src &char, dst &voidptr) int

pub fn inet_pton(af int, const_src &char, dst &voidptr) int {
	return C.uv_inet_pton(af, const_src, dst)
}

// random functions

fn C.uv_random(loop &C.uv_loop_t, req &C.uv_random_t, buff voidptr, buflen usize, flalgs usize, cb fn (req &C.uv_random_t, status int, buf voidptr, buflen usize)) int

pub fn random(loop &C.uv_loop_t, req &C.uv_random_t, buff voidptr, buflen usize, flalgs usize, cb fn (req &C.uv_random_t, status int, buf voidptr, buflen usize)) int {
	return C.uv_random(loop, req, buff, buflen, flalgs, cb)
}

// path functions

fn C.uv_if_indextoname(ifindex usize, buffer &char, &usize) int

pub fn if_indextoname(ifindex usize, buffer &char, size &usize) int {
	return C.uv_if_indextoname(ifindex, buffer, size)
}

fn C.uv_if_indextoiid(ifindex usize, buffer &char, size &usize) int

pub fn if_indextoiid(ifindex usize, buffer &char, size &usize) int {
	return C.uv_if_indextoiid(ifindex, buffer, size)
}

fn C.uv_exepath(buffer &char, size &usize) int

pub fn exepath(buffer &char, size &usize) int {
	return C.uv_exepath(buffer, size)
}

fn C.uv_cwd(buffer &char, size &usize) int

pub fn cwd(buffer &char, size &usize) int {
	return C.uv_cwd(buffer, size)
}

fn C.uv_chdir(const_dir &char) int

pub fn chdir(const_dir &char) int {
	return C.uv_chdir(const_dir)
}

// get memory functions

fn C.uv_get_free_memory() u64

pub fn get_free_memory() u64 {
	return C.uv_get_free_memory()
}

fn C.uv_get_total_memory() u64

pub fn get_total_memory() u64 {
	return C.uv_get_total_memory()
}

fn C.uv_get_constrained_memory() u64

pub fn get_constrained_memory() u64 {
	return C.uv_get_constrained_memory()
}

fn C.uv_get_available_memory() u64

pub fn get_available_memory() u64 {
	return C.uv_get_available_memory()
}

// clock functions

fn C.uv_clock_gettime(clock_id int, ts voidptr) int

// fn C.uv_clock_gettime(clock_id int, ts &C.uv_timespec_t) int

pub struct Uv_timespec {
	tv_sec  i64
	tv_nsec i32
}

pub fn clock_gettime(clock_id Uv_clock_id, ts &Uv_timespec) int {
	$if compile_static {
		return C.uv_clock_gettime(int(clock_id), &C.uv_timespec64_t(ts))
	} $else {
		return C.uv_clock_gettime(int(clock_id), &C.uv_timespec_t(ts))
	}
}

fn C.uv_hrtime() u64

pub fn hrtime() u64 {
	return C.uv_hrtime()
}

fn C.uv_sleep(msec usize)

pub fn sleep(msec usize) {
	C.uv_sleep(msec)
}

fn C.uv_disable_stdio_inheritance()

pub fn disable_stdio_inheritance() {
	C.uv_disable_stdio_inheritance()
}

// dl functions

fn C.uv_dlopen(const_filename &char, lib &C.uv_lib_t) int

pub fn dlopen(const_filename &char, lib &C.uv_lib_t) int {
	return C.uv_dlopen(const_filename, lib)
}

fn C.uv_dlclose(lib &C.uv_lib_t)

pub fn dlclose(lib &C.uv_lib_t) {
	C.uv_dlclose(lib)
}

fn C.uv_dlsym(lib &C.uv_lib_t, const_name &char, ptr &voidptr) int

pub fn dlsym(lib &C.uv_lib_t, const_name &char, ptr &voidptr) int {
	return C.uv_dlsym(lib, const_name, ptr)
}

fn C.uv_dlerror(const_lib &C.uv_lib_t) &char

pub fn dlerror(const_lib &C.uv_lib_t) string {
	unsafe {
		return cstring_to_vstring(C.uv_dlerror(const_lib))
	}
}

// // mutex functions

// fn C.uv_mutex_init(handle &C.uv_mutex_t) int

// pub fn mutex_init(handle &C.uv_mutex_t) int {
// 	return C.uv_mutex_init(handle)
// }

// fn C.uv_mutex_init_recursive(handle &C.uv_mutex_t) int

// pub fn mutex_init_recursive(handle &C.uv_mutex_t) int {
// 	return C.uv_mutex_init_recursive(handle)
// }

// fn C.uv_mutex_destroy(handle &C.uv_mutex_t)

// pub fn mutex_destroy(handle &C.uv_mutex_t) {
// 	C.uv_mutex_destroy(handle)
// }

// fn C.uv_mutex_lock(handle &C.uv_mutex_t)

// pub fn mutex_lock(handle &C.uv_mutex_t) {
// 	C.uv_mutex_lock(handle)
// }

// fn C.uv_mutex_trylock(handle &C.uv_mutex_t) int

// pub fn mutex_trylock(handle &C.uv_mutex_t) int {
// 	return C.uv_mutex_trylock(handle)
// }

// fn C.uv_mutex_unlock(handle &C.uv_mutex_t)

// pub fn mutex_unlock(handle &C.uv_mutex_t) {
// 	C.uv_mutex_unlock(handle)
// }

// // lock functions

// fn C.uv_rwlock_init(handle &C.uv_rwlock_t) int

// pub fn rwlock_init(handle &C.uv_rwlock_t) int {
// 	return C.uv_rwlock_init(handle)
// }

// fn C.uv_rwlock_destroy(handle &C.uv_rwlock_t)

// pub fn rwlock_destroy(handle &C.uv_rwlock_t) {
// 	C.uv_rwlock_destroy(handle)
// }

// fn C.uv_rwlock_rdlock(handle &C.uv_rwlock_t)

// pub fn rwlock_rdlock(handle &C.uv_rwlock_t) {
// 	C.uv_rwlock_rdlock(handle)
// }

// fn C.uv_rwlock_tryrdlock(handle &C.uv_rwlock_t) int

// pub fn rwlock_tryrdlock(handle &C.uv_rwlock_t) int {
// 	return C.uv_rwlock_tryrdlock(handle)
// }

// fn C.uv_rwlock_rdunlock(handle &C.uv_rwlock_t)

// pub fn rwlock_rdunlock(handle &C.uv_rwlock_t) {
// 	C.uv_rwlock_rdunlock(handle)
// }

// fn C.uv_rwlock_wrlock(handle &C.uv_rwlock_t)

// pub fn rwlock_wrlock(handle &C.uv_rwlock_t) {
// 	C.uv_rwlock_wrlock(handle)
// }

// fn C.uv_rwlock_trywrlock(handle &C.uv_rwlock_t) int

// pub fn rwlock_trywrlock(handle &C.uv_rwlock_t) int {
// 	return C.uv_rwlock_trywrlock(handle)
// }

// fn C.uv_rwlock_wrunlock(handle &C.uv_rwlock_t)

// pub fn rwlock_wrunlock(handle &C.uv_rwlock_t) {
// 	C.uv_rwlock_wrunlock(handle)
// }

// semaphore functions

// fn C.uv_sem_init(sem &C.uv_sem_t, value usize) int

// pub fn sem_init(sem &C.uv_sem_t, value usize) int {
// 	return C.uv_sem_init(sem, value)
// }

// fn C.uv_sem_destroy(sem &C.uv_sem_t)

// pub fn sem_destroy(sem &C.uv_sem_t) {
// 	C.uv_sem_destroy(sem)
// }

// fn C.uv_sem_post(sem &C.uv_sem_t)

// pub fn sem_post(sem &C.uv_sem_t) {
// 	C.uv_sem_post(sem)
// }

// fn C.uv_sem_wait(sem &C.uv_sem_t)

// pub fn sem_wait(sem &C.uv_sem_t) {
// 	C.uv_sem_wait(sem)
// }

// fn C.uv_sem_trywait(sem &C.uv_sem_t) int

// pub fn sem_trywait(sem &C.uv_sem_t) int {
// 	return C.uv_sem_trywait(sem)
// }

// // condition functions

// fn C.uv_cond_init(handle &C.uv_cond_t) int

// pub fn cond_init(handle &C.uv_cond_t) int {
// 	return C.uv_cond_init(handle)
// }

// fn C.uv_cond_destroy(handle &C.uv_cond_t)

// pub fn cond_destroy(handle &C.uv_cond_t) {
// 	C.uv_cond_destroy(handle)
// }

// fn C.uv_cond_signal(handle &C.uv_cond_t)

// pub fn cond_signal(handle &C.uv_cond_t) {
// 	C.uv_cond_signal(handle)
// }

// fn C.uv_cond_broadcast(handle &C.uv_cond_t)

// pub fn cond_broadcast(handle &C.uv_cond_t) {
// 	C.uv_cond_broadcast(handle)
// }

// fn C.uv_cond_wait(handle &C.uv_cond_t, mutex &C.uv_mutex_t)

// pub fn cond_wait(handle &C.uv_cond_t, mutex &C.uv_mutex_t) {
// 	C.uv_cond_wait(handle, mutex)
// }

// fn C.uv_cond_timedwait(handle &C.uv_cond_t, mutex &C.uv_mutex_t, timeout u64)

// pub fn cond_timedwait(handle &C.uv_cond_t, mutex &C.uv_mutex_t, timeout u64) {
// 	C.uv_cond_timedwait(handle, mutex, timeout)
// }

// // barrier functions

// fn C.uv_barrier_init(handle &C.uv_barrier_t, count usize) int

// pub fn barrier_init(handle &C.uv_barrier_t, count usize) int {
// 	return C.uv_barrier_init(handle, count)
// }

// fn C.uv_barrier_destroy(handle &C.uv_barrier_t)

// pub fn barrier_destroy(handle &C.uv_barrier_t) {
// 	C.uv_barrier_destroy(handle)
// }

// fn C.uv_barrier_wait(handle &C.uv_barrier_t)

// pub fn barrier_wait(handle &C.uv_barrier_t) {
// 	C.uv_barrier_wait(handle)
// }

fn C.uv_once(guard &C.uv_once_t, cb fn ())

pub fn once(guard &C.uv_once_t, cb fn ()) {
	C.uv_once(guard, cb)
}

// pub type Uv_timeval = C.uv_timeval_t | C.uv_timeval64_t

struct Uv_timeval {
	tv_sec  i64
	tv_usec i64
}

fn C.uv_gettimeofday(tv &C.uv_timeval_t) int
fn C.uv_gettimeofday(tv &C.uv_timeval64_t) int

// TODO i may be doing this wrong, the static library defines C.uv_timeval64_t and building from source
// defines C.uv_timeval_t
pub fn gettimeofday(tv &Uv_timeval) int {
	$if compile_static {
		return C.uv_gettimeofday(&C.uv_timeval64_t(tv))
	} $else {
		// panic('uv_gettimeofday is not available in static build')
		// return -1
		return C.uv_gettimeofday(&C.uv_timeval64_t(tv))
	}
}

// // key functions

// fn C.uv_key_create(key &C.uv_key_t) int

// pub fn key_create(key &C.uv_key_t) int {
// 	return C.uv_key_create(key)
// }

// fn C.uv_key_delete(key &C.uv_key_t)

// pub fn key_delete(key &C.uv_key_t) {
// 	C.uv_key_delete(key)
// }

// fn C.uv_key_get(key &C.uv_key_t) &voidptr

// pub fn key_get(key &C.uv_key_t) &voidptr {
// 	return C.uv_key_get(key)
// }

// fn C.uv_key_set(key &C.uv_key_t, value &voidptr)

// pub fn key_set(key &C.uv_key_t, value &voidptr) {
// 	C.uv_key_set(key, value)
// }

// // thread functions

// fn C.uv_thread_create(tid &C.uv_thread_t, entry fn (arg voidptr), arg voidptr) int

// pub fn thread_create(tid &C.uv_thread_t, entry fn (arg &voidptr), arg &voidptr) int {
// 	return C.uv_thread_create(tid, entry, arg)
// }

// fn C.uv_thread_setaffinity(tid &C.uv_thread_t, cpumask &char, oldmask &char, mask_size usize) int

// pub fn thread_setaffinity(tid &C.uv_thread_t, cpumask &char, oldmask &char, mask_size usize) int {
// 	return C.uv_thread_setaffinity(tid, cpumask, oldmask, mask_size)
// }

// fn C.uv_thread_getaffinity(tid &C.uv_thread_t, cpumask &char, mask_size usize) int

// pub fn thread_getaffinity(tid &C.uv_thread_t, cpumask &char, mask_size usize) int {
// 	return C.uv_thread_getaffinity(tid, cpumask, mask_size)
// }

// fn C.uv_thread_getcpu() int

// pub fn thread_getcpu() int {
// 	return C.uv_thread_getcpu()
// }

// fn C.uv_thread_join(tid &C.uv_thread_t)

// pub fn thread_join(tid &C.uv_thread_t) {
// 	C.uv_thread_join(tid)
// }

// fn C.uv_thread_self() C.uv_thread_t

// pub fn thread_self() C.uv_thread_t {
// 	return C.uv_thread_self()
// }

// fn C.uv_thread_equal(const_t1 &C.uv_thread_t, const_t2 &C.uv_thread_t) int

// pub fn thread_equal(const_t1 &C.uv_thread_t, const_t2 &C.uv_thread_t) int {
// 	return C.uv_thread_equal(const_t1, const_t2)
// }

// loop functions 2nd

// fn C.uv_loop_get_data(const_loop &C.uv_loop_t) &voidptr

// pub fn loop_get_data(const_loop &C.uv_loop_t) &voidptr {
// 	return C.uv_loop_get_data(const_loop)
// }

// fn C.uv_loop_set_data(loop &C.uv_loop_t, data &voidptr)

// pub fn loop_set_data(loop &C.uv_loop_t, data &voidptr) {
// 	C.uv_loop_set_data(loop, data)
// }

//  string util functions
fn C.uv_utf16_length_as_wtf8(const_utf16 &u16, utf16_len usize) usize

pub fn utf16_length_as_wtf8(const_utf16 &u16, utf16_len usize) usize {
	return C.uv_utf16_length_as_wtf8(const_utf16, utf16_len)
}

fn C.uv_utf16_to_wtf8(const_utf16 &u16, utf16_len usize, wtf8_ptr &&char, wtf8_len_ptr &usize) int

pub fn utf16_to_wtf8(const_utf16 &u16, utf16_len usize, wtf8_ptr &&char, wtf8_len_ptr &usize) int {
	return C.uv_utf16_to_wtf8(const_utf16, utf16_len, wtf8_ptr, wtf8_len_ptr)
}

fn C.uv_wtf8_length_as_utf16(const_wtf8 &char) usize

pub fn wtf8_length_as_utf16(const_wtf8 &char) usize {
	return C.uv_wtf8_length_as_utf16(const_wtf8)
}

fn C.uv_wtf8_to_utf16(const_wtf8 &char, wtf8_len &u16, utf16_len usize)

pub fn wtf8_to_utf16(const_wtf8 &char, wtf8_len &u16, utf16_len usize) {
	C.uv_wtf8_to_utf16(const_wtf8, wtf8_len, utf16_len)
}
