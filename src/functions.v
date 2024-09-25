module main

fn C.uv_version() &u32

pub fn version() &u32 {
	return C.uv_version()
}

fn C.uv_version_string() &char

pub fn version_string() &char {
	return C.uv_version_string()
}

fn C.uv_library_shutdown()

pub fn library_shutdown() {
	C.uv_library_shutdown()
}

// typedef void* (*uv_malloc_func)(size_t size);
pub type Malloc_fn = fn (size usize) &u8

// typedef void* (*uv_realloc_func)(void* ptr, size_t size);
pub type Realloc_fn = fn (ptr voidptr, size usize) &u8

// typedef void* (*uv_calloc_func)(size_t count, size_t size);
pub type Calloc_fn = fn (count usize, size usize) &u8

// typedef void (*uv_free_func)(void* ptr);
pub type Free_fn = fn (ptr voidptr) voidptr

fn C.uv_replace_allocator(malloc Malloc_fn, realloc Realloc_fn, calloc Calloc_fn, free Free_fn) int
pub fn replace_allocator(malloc_fn Malloc_fn, realloc_cb Realloc_fn, calloc_cb Calloc_fn, free_cb Free_fn) int {
	return C.uv_replace_allocator(malloc_fn, realloc_cb, calloc_cb, free_cb)
}

pub fn default_loop() &C.uv_loop_t {
	return C.uv_default_loop()
}

pub fn loop_init(loop &C.uv_loop_t) int {
	return C.uv_loop_init(loop)
}

pub fn loop_close(loop &C.uv_loop_t) int {
	return C.uv_loop_close(loop)
}

// this is deprecated, allocate the loop manually and use loop_init instead
@[deprecated: 'allocate the loop manually and use loop_init instead']
pub fn loop_new() &C.uv_loop_t {
	return C.uv_loop_new()
}

// this function is depracated, use loop_close and free the memory manually instead
@[deprecated: 'use loop_close and free the memory manually instead']
pub fn loop_delete(loop &C.uv_loop_t) {
	C.uv_loop_delete(loop)
}

pub fn loop_size() usize {
	return C.uv_loop_size()
}

fn C.uv_loop_alive(const_loop &C.uv_loop_t) int

pub fn loop_alive(const_loop &C.uv_loop_t) int {
	return C.uv_loop_alive(const_loop)
}

// TODO idk how to handle the ... variadic
fn C.uv_loop_configure(loop &C.uv_loop_t, option Uv_loop_option, ...) int

// UV_EXTERN int uv_loop_configure(uv_loop_t* loop, uv_loop_option option, ...);

// pub fn loop_configure(loop &C.uv_loop_t, option Uv_loop_option, ...voidptr) int {
// 	return C.uv_loop_configure(loop, option, ...voidptr)
// }

fn C.uv_loop_fork(loop &C.uv_loop_t) int

pub fn loop_fork(loop &C.uv_loop_t) int {
	return C.uv_loop_fork(loop)
}

pub fn run(loop &C.uv_loop_t, mode Mode) int {
	return C.uv_run(loop, mode)
}

pub fn stop(loop &C.uv_loop_t) {
	C.uv_stop(loop)
}

pub fn ref(handle &C.uv_handle_t) {
	C.uv_ref(handle)
}

pub fn unref(handle &C.uv_handle_t) {
	C.uv_unref(handle)
}

pub fn has_ref(const_handle &C.uv_handle_t) int {
	return C.uv_has_ref(const_handle)
}

pub fn update_time(loop &C.uv_loop_t) {
	C.uv_update_time(loop)
}

pub fn now(const_loop &C.uv_loop_t) u64 {
	return C.uv_now(const_loop)
}

pub fn backend_fd(loop &C.uv_loop_t) int {
	return C.uv_backend_fd(loop)
}

pub fn backend_timeout(loop &C.uv_loop_t) int {
	return C.uv_backend_timeout(loop)
}

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

pub enum Uv_clock_id {
	monotonic = 0
	realtime
}

pub type FsEvent_cb = fn (handle &C.uv_fs_event_t, const_filename &char, events int, status int)

pub type FsPoll_cb = fn (handle &C.uv_fs_poll_t, status int, const_prev &C.uv_stat_t, const_curr &C.uv_stat_t)

pub type Signal_cb = fn (handle &C.uv_signal_t, signum int)

fn C.uv_translate_sys_error(sys_errno int) int

pub fn translate_sys_error(sys_errno int) int {
	return C.uv_translate_sys_error(sys_errno)
}

fn C.uv_strerror(err int) &char

pub fn strerror(err int) &char {
	return C.uv_strerror(err)
}

fn C.uv_err_name_r(err int, buff &char, buflen u64) &char

pub fn err_name_r(err int, buff &char, buflen u64) &char {
	return C.uv_err_name_r(err, buff, buflen)
}

fn C.uv_err_name(const_err int) &char

pub fn err_name(const_err int) &char {
	return C.uv_err_name(const_err)
}

fn C.uv_shutdown(req &C.uv_shutdown_t, handle &C.uv_stream_t, cb Shutdown_cb) int

pub fn shutdown(req &C.uv_shutdown_t, handle &C.uv_stream_t, cb Shutdown_cb) int {
	return C.uv_shutdown(req, handle, cb)
}

// handle functions

fn C.uv_handle_size(handle_type Uv_handle_type) usize

pub fn handle_size(handle_type Uv_handle_type) usize {
	return C.uv_handle_size(handle_type)
}

fn C.uv_handle_get_type(const_handle &C.uv_handle_t) Uv_handle_type

pub fn handle_get_type(const_handle &C.uv_handle_t) Uv_handle_type {
	return C.uv_handle_get_type(const_handle)
}

fn C.uv_handle_type_name(handle_type Uv_handle_type) &char

pub fn handle_type_name(const_handle_type Uv_handle_type) &char {
	return C.uv_handle_type_name(const_handle_type)
}

fn C.uv_handle_get_data(const_handle &C.uv_handle_t) voidptr

pub fn handle_get_data(const_handle &C.uv_handle_t) voidptr {
	return C.uv_handle_get_data(const_handle)
}

fn C.uv_handle_get_loop(const_handle &C.uv_handle_t) &C.uv_loop_t

pub fn handle_get_loop(const_handle &C.uv_handle_t) &C.uv_loop_t {
	return C.uv_handle_get_loop(const_handle)
}

fn C.uv_handle_set_data(handle &C.uv_handle_t, data voidptr)

pub fn handle_set_data(handle &C.uv_handle_t, data voidptr) {
	C.uv_handle_set_data(handle, data)
}

// request functions

fn C.uv_req_size(req_type Uv_req_type) usize

pub fn req_size(req_type Uv_req_type) usize {
	return C.uv_req_size(req_type)
}

fn C.uv_req_get_data(const_req &C.uv_req_t) voidptr

pub fn req_get_data(const_req &C.uv_req_t) voidptr {
	return C.uv_req_get_data(const_req)
}

fn C.uv_req_set_data(req &C.uv_req_t, data voidptr)

pub fn req_set_data(req &C.uv_req_t, data voidptr) {
	C.uv_req_set_data(req, data)
}

fn C.uv_req_get_type(const_req &C.uv_req_t) Uv_req_type

pub fn req_get_type(const_req &C.uv_req_t) Uv_req_type {
	return C.uv_req_get_type(const_req)
}

fn C.uv_req_type_name(req_type Uv_req_type) &char

pub fn req_type_name(const_req_type Uv_req_type) &char {
	return C.uv_req_type_name(const_req_type)
}

fn C.uv_is_active(const_handle &C.uv_handle_t) int

pub fn is_active(const_handle &C.uv_handle_t) int {
	return C.uv_is_active(const_handle)
}

pub fn walk(loop &C.uv_loop_t, walk_cb fn (handle &C.uv_handle_t, arg voidptr), arg voidptr) {
	C.uv_walk(loop, walk_cb, arg)
}

// ANCHOR this is up to line 500 of uv.h

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

fn C.uv_fileno(const_handle &C.uv_handle_t, fd &Uv_os_fd_int) int

pub type Uv_os_fd_int = int

pub fn fileno(const_handle &C.uv_handle_t, fd &Uv_os_fd_int) int {
	return C.uv_fileno(const_handle, fd)
}

fn C.uv_buf_init(base &char, len usize) C.uv_buf_t

pub fn buf_init(base &char, len usize) C.uv_buf_t {
	return C.uv_buf_init(base, len)
}

// TODO fds should be a fixed array of size 2 that holds 2 ints
fn C.uv_pipe(fds []int, read_flags int, write_flags int) int

pub fn pipe(fds []int, read_flags int, write_flags int) int {
	return C.uv_pipe(fds, read_flags, write_flags)
}

// TODO socker_vector should be a fixed array of size 2 that holds 2 ints
fn C.uv_socketpair(socker_type int, protocol int, socket_vector []int, flags0 int, flags1 int) int

pub fn socketpair(socker_type int, protocol int, socket_vector []int, flags0 int, flags1 int) int {
	return C.uv_socketpair(socker_type, protocol, socket_vector, flags0, flags1)
}

fn C.uv_stream_get_write_queue_size(const_stream &C.uv_stream_t) usize

pub fn stream_get_write_queue_size(const_stream &C.uv_stream_t) usize {
	return C.uv_stream_get_write_queue_size(const_stream)
}

fn C.uv_listen(stream &C.uv_stream_t, backlog int, cb Connection_cb) int

pub fn listen(stream &C.uv_stream_t, backlog int, cb Connection_cb) int {
	return C.uv_listen(stream, backlog, cb)
}

fn C.uv_accept(server &C.uv_stream_t, client &C.uv_stream_t) int

pub fn accept(server &C.uv_stream_t, client &C.uv_stream_t) int {
	return C.uv_accept(server, client)
}

fn C.uv_read_start(stream &C.uv_stream_t, alloc_cb Alloc_cb, read_cb Read_cb) int

pub fn read_start(stream &C.uv_stream_t, alloc_cb Alloc_cb, read_cb Read_cb) int {
	return C.uv_read_start(stream, alloc_cb, read_cb)
}

fn C.uv_read_stop(stream &C.uv_stream_t) int

pub fn read_stop(stream &C.uv_stream_t) int {
	return C.uv_read_stop(stream)
}

// TODO bufs is written as const uv_buf_t bufs[] in c, but I don't know how to handle that in v
fn C.uv_write(req &C.uv_write_t, handle &C.uv_stream_t, const_bufs []&C.uv_buf_t, nbufs usize, cb Write_cb) int

pub fn write(req &C.uv_write_t, handle &C.uv_stream_t, const_bufs []&C.uv_buf_t, nbufs usize, cb Write_cb) int {
	return C.uv_write(req, handle, const_bufs, nbufs, cb)
}

// TODO bufs is written as const uv_buf_t bufs[] in c, but I don't know how to handle that in v
fn C.uv_write2(req &C.uv_write_t, handle &C.uv_stream_t, const_bufs []&C.uv_buf_t, nbufs usize, send_handle &C.uv_stream_t, cb Write_cb) int

pub fn write2(req &C.uv_write_t, handle &C.uv_stream_t, const_bufs []&C.uv_buf_t, nbufs usize, send_handle &C.uv_stream_t, cb Write_cb) int {
	return C.uv_write2(req, handle, const_bufs, nbufs, send_handle, cb)
}

fn C.uv_try_write(handle &C.uv_stream_t, const_bufs []&C.uv_buf_t, nbufs usize) int

pub fn try_write(handle &C.uv_stream_t, const_bufs []&C.uv_buf_t, nbufs usize) int {
	return C.uv_try_write(handle, const_bufs, nbufs)
}

fn C.uv_try_write2(handle &C.uv_stream_t, const_bufs []&C.uv_buf_t, nbufs usize, send_handle &C.uv_stream_t) int

pub fn try_write2(handle &C.uv_stream_t, const_bufs []&C.uv_buf_t, nbufs usize, send_handle &C.uv_stream_t) int {
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

fn C.uv_is_closing(const_handle &C.uv_handle_t) int

pub fn is_closing(const_handle &C.uv_handle_t) int {
	return C.uv_is_closing(const_handle)
}

// tcp functions

pub fn tcp_init(loop &C.uv_loop_t, handle &C.uv_tcp_t) int {
	return C.uv_tcp_init(loop, handle)
}

fn C.uv_tcp_init_ex(loop &C.uv_loop_t, handle &C.uv_tcp_t, flags usize) int

pub fn tcp_init_ex(loop &C.uv_loop_t, handle &C.uv_tcp_t, flags usize) int {
	return C.uv_tcp_init_ex(loop, handle, flags)
}

pub fn tcp_open(handle &C.uv_tcp_t, sock int) int {
	return C.uv_tcp_open(handle, sock)
}

pub fn tcp_nodelay(handle &C.uv_tcp_t, enable int) int {
	return C.uv_tcp_nodelay(handle, enable)
}

pub fn tcp_keepalive(handle &C.uv_tcp_t, enable int, delay u32) int {
	return C.uv_tcp_keepalive(handle, enable, delay)
}

pub fn tcp_simultaneous_accepts(handle &C.uv_tcp_t, enable int) int {
	return C.uv_tcp_simultaneous_accepts(handle, enable)
}

pub enum Uv_tcp_flags {
	tcp_ipv6_only = 1
	tcp_reuse_port
}

pub fn tcp_bind(handle &C.uv_tcp_t, const_sockaddr &C.sockaddr, flags int) int {
	return C.uv_tcp_bind(handle, const_sockaddr, flags)
}

// TODO maybe need to change namelen to usize or isize
pub fn tcp_getsockname(const_handle &C.uv_tcp_t, name &C.sockaddr, namelen &int) int {
	return C.uv_tcp_getsockname(const_handle, name, namelen)
}

pub fn tcp_getpeername(const_handle &C.uv_tcp_t, name &C.sockaddr, namelen &int) int {
	return C.uv_tcp_getpeername(const_handle, name, namelen)
}

pub fn tcp_connect(req &C.uv_connect_t, handle &C.uv_tcp_t, const_sockaddr &C.sockaddr, cb fn (req &C.uv_connect_t, status int)) int {
	return C.uv_tcp_connect(req, handle, const_sockaddr, cb)
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

pub type Udp_send_cb = fn (req &C.uv_udp_send_t, status int)

pub type Udp_recv_cb = fn (handle &C.uv_udp_t, nread isize, const_buf &C.uv_buf_t, const_sockaddr &C.sockaddr, flags Uv_udp_flags)

// udp functions

pub fn udp_init(loop &C.uv_loop_t, handle &C.uv_udp_t) int {
	return C.uv_udp_init(loop, handle)
}

fn C.uv_udp_init_ex(loop &C.uv_loop_t, handle &C.uv_udp_t, flags Uv_udp_flags) int

pub fn udp_init_ex(loop &C.uv_loop_t, handle &C.uv_udp_t, flags Uv_udp_flags) int {
	return C.uv_udp_init_ex(loop, handle, flags)
}

pub fn udp_open(handle &C.uv_udp_t, sock int) int {
	return C.uv_udp_open(handle, sock)
}

pub fn udp_bind(handle &C.uv_udp_t, const_sockaddr &C.sockaddr, flags int) int {
	return C.uv_udp_bind(handle, const_sockaddr, flags)
}

fn C.uv_udp_connect(handle &C.uv_udp_t, const_sockaddr &C.sockaddr) int

pub fn udp_connect(handle &C.uv_udp_t, const_sockaddr &C.sockaddr) int {
	return C.uv_udp_connect(handle, const_sockaddr)
}

fn C.uv_udp_getpeername(const_handle &C.uv_udp_t, name &C.sockaddr, namelen &int) int

pub fn udp_getpeername(const_handle &C.uv_udp_t, name &C.sockaddr, namelen &int) int {
	return C.uv_udp_getpeername(const_handle, name, namelen)
}

pub fn udp_getsockname(handle &C.uv_udp_t, name &C.sockaddr, namelen &int) int {
	return C.uv_udp_getsockname(handle, name, namelen)
}

pub fn udp_set_membership(handle &C.uv_udp_t, multicast_addr &char, interface_addr &char, membership Uv_membership) int {
	return C.uv_udp_set_membership(handle, multicast_addr, interface_addr, membership)
}

fn C.uv_udp_set_source_membership(handle &C.uv_udp_t, const_multicast_addr &char, const_interface_addr &char, const_source_addr &char, membership Uv_membership) int

pub fn udp_set_source_membership(handle &C.uv_udp_t, const_multicast_addr &char, const_interface_addr &char, const_source_addr &char, membership Uv_membership) int {
	return C.uv_udp_set_source_membership(handle, const_multicast_addr, const_interface_addr,
		const_source_addr, membership)
}

pub fn udp_set_multicast_loop(handle &C.uv_udp_t, on int) int {
	return C.uv_udp_set_multicast_loop(handle, on)
}

pub fn udp_set_multicast_ttl(handle &C.uv_udp_t, ttl int) int {
	return C.uv_udp_set_multicast_ttl(handle, ttl)
}

pub fn udp_set_multicast_interface(handle &C.uv_udp_t, const_interface_addr &char) int {
	return C.uv_udp_set_multicast_interface(handle, const_interface_addr)
}

pub fn udp_set_broadcast(handle &C.uv_udp_t, on int) int {
	return C.uv_udp_set_broadcast(handle, on)
}

pub fn udp_set_ttl(handle &C.uv_udp_t, ttl int) int {
	return C.uv_udp_set_ttl(handle, ttl)
}

pub fn udp_send(req &C.uv_udp_send_t, handle &C.uv_udp_t, const_bufs []&C.uv_buf_t, nbufs u32, addr &C.sockaddr, cb fn (req &C.uv_udp_send_t, status int)) int {
	return C.uv_udp_send(req, handle, const_bufs, nbufs, addr, cb)
}

fn C.uv_udp_try_send(handle &C.uv_udp_t, const_bufs []&C.uv_buf_t, nbufs u32, addr &C.sockaddr) int

pub fn udp_try_send(handle &C.uv_udp_t, const_bufs []&C.uv_buf_t, nbufs u32, const_sockaddr &C.sockaddr) int {
	return C.uv_udp_try_send(handle, const_bufs, nbufs, const_sockaddr)
}

pub fn udp_recv_start(handle &C.uv_udp_t, alloc_cb fn (handle &C.uv_handle_t, suggested_size usize, buf &C.uv_buf_t), recv_cb fn (handle &C.uv_udp_t, nread isize, buf &C.uv_buf_t, addr &C.sockaddr, flags u32)) int {
	return C.uv_udp_recv_start(handle, alloc_cb, recv_cb)
}

fn C.uv_udp_using_recvmmsg(const_handle &C.uv_udp_t) int

pub fn udp_using_recvmmsg(const_handle &C.uv_udp_t) int {
	return C.uv_udp_using_recvmmsg(const_handle)
}

pub fn udp_recv_stop(handle &C.uv_udp_t) int {
	return C.uv_udp_recv_stop(handle)
}

fn C.uv_udp_get_send_queue_size(const_handle &C.uv_udp_t) usize

pub fn udp_get_send_queue_size(const_handle &C.uv_udp_t) usize {
	return C.uv_udp_get_send_queue_size(const_handle)
}

fn C.uv_udp_get_send_queue_count(const_handle &C.uv_udp_t) usize

pub fn udp_get_send_queue_count(const_handle &C.uv_udp_t) usize {
	return C.uv_udp_get_send_queue_count(const_handle)
}

// tty functions

pub enum Uv_tty_mode {
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

fn C.uv_tty_init(loop &C.uv_loop_t, handle &C.uv_tty_t, fd int, readable int) int

pub fn tty_init(loop &C.uv_loop_t, handle &C.uv_tty_t, fd int, readable int) int {
	return C.uv_tty_init(loop, handle, fd, readable)
}

fn C.uv_tty_set_mode(handle &C.uv_tty_t, mode Uv_tty_mode) int

pub fn tty_set_mode(handle &C.uv_tty_t, mode Uv_tty_mode) int {
	return C.uv_tty_set_mode(handle, mode)
}

fn C.uv_tty_reset_mode() int

pub fn tty_reset_mode() int {
	return C.uv_tty_reset_mode()
}

fn C.uv_tty_get_winsize(handle &C.uv_tty_t, width &int, height &int) int

pub fn tty_get_winsize(handle &C.uv_tty_t, width &int, height &int) int {
	return C.uv_tty_get_winsize(handle, width, height)
}

fn C.uv_tty_set_vterm_state(state Uv_tty_vtermstate) int

pub fn tty_set_vterm_state(state Uv_tty_vtermstate) int {
	return C.uv_tty_set_vterm_state(state)
}

fn C.uv_tty_get_vterm_state(state &Uv_tty_vtermstate) int

pub fn tty_get_vterm_state(state &Uv_tty_vtermstate) int {
	return C.uv_tty_get_vterm_state(state)
}

fn C.uv_guess_handle(fd int) Uv_handle_type

pub fn guess_handle(fd int) Uv_handle_type {
	return C.uv_guess_handle(fd)
}

// pipe functions

pub fn pipe_init(loop &C.uv_loop_t, handle &C.uv_pipe_t, ipc int) int {
	return C.uv_pipe_init(loop, handle, ipc)
}

pub fn pipe_open(handle &C.uv_pipe_t, file int) int {
	return C.uv_pipe_open(handle, file)
}

pub fn pipe_bind(handle &C.uv_pipe_t, const_name &char) int {
	return C.uv_pipe_bind(handle, const_name)
}

fn C.uv_pipe_bind2(handle &C.uv_pipe_t, const_name &char, namelen usize, flags usize) int
pub fn pipe_bind2(handle &C.uv_pipe_t, const_name &char, namelen usize, flags usize) int {
	return C.uv_pipe_bind2(handle, const_name, namelen, flags)
}

pub fn pipe_connect(req &C.uv_connect_t, handle &C.uv_pipe_t, const_name &char, cb fn (req &C.uv_connect_t, status int)) {
	C.uv_pipe_connect(req, handle, const_name, cb)
}

fn C.uv_pipe_connect2(req &C.uv_connect_t, handle &C.uv_pipe_t, const_name &char, flags usize, cb fn (req &C.uv_connect_t, status int)) int

pub fn pipe_connect2(req &C.uv_connect_t, handle &C.uv_pipe_t, const_name &char, flags usize, cb fn (req &C.uv_connect_t, status int)) int {
	return C.uv_pipe_connect2(req, handle, const_name, flags, cb)
}

pub fn pipe_getsockname(handle &C.uv_pipe_t, name &char, namelen &usize) int {
	return C.uv_pipe_getsockname(handle, name, namelen)
}

pub fn pipe_getpeername(handle &C.uv_pipe_t, name &char, namelen &usize) int {
	return C.uv_pipe_getpeername(handle, name, namelen)
}

pub fn pipe_pending_instances(handle &C.uv_pipe_t, count int) {
	C.uv_pipe_pending_instances(handle, count)
}

pub fn pipe_pending_count(handle &C.uv_pipe_t) int {
	return C.uv_pipe_pending_count(handle)
}

pub fn pipe_pending_type(handle &C.uv_pipe_t) int {
	return C.uv_pipe_pending_type(handle)
}

pub fn pipe_chmod(handle &C.uv_pipe_t, flags int) int {
	return C.uv_pipe_chmod(handle, flags)
}

// ANCHOR - this is checked up to line 884 of uv.h
// timer functions

pub fn timer_init(loop &C.uv_loop_t, handle &C.uv_timer_t) int {
	return C.uv_timer_init(loop, handle)
}

pub fn timer_start(handle &C.uv_timer_t, cb fn (handle &C.uv_timer_t), timeout u64, repeat u64) int {
	return C.uv_timer_start(handle, cb, timeout, repeat)
}

pub fn timer_stop(handle &C.uv_timer_t) int {
	return C.uv_timer_stop(handle)
}

pub fn timer_again(handle &C.uv_timer_t) int {
	return C.uv_timer_again(handle)
}

pub fn timer_set_repeat(handle &C.uv_timer_t, repeat u64) {
	C.uv_timer_set_repeat(handle, repeat)
}

pub fn timer_get_repeat(handle &C.uv_timer_t) u64 {
	return C.uv_timer_get_repeat(handle)
}

// poll functions

pub fn poll_init(loop &C.uv_loop_t, handle &C.uv_poll_t, fd int) int {
	return C.uv_poll_init(loop, handle, fd)
}

pub fn poll_start(handle &C.uv_poll_t, events int, cb fn (handle &C.uv_poll_t, status int, events int)) int {
	return C.uv_poll_start(handle, events, cb)
}

pub fn poll_stop(handle &C.uv_poll_t) int {
	return C.uv_poll_stop(handle)
}

// signal functions

pub fn signal_init(loop &C.uv_loop_t, handle &C.uv_signal_t) int {
	return C.uv_signal_init(loop, handle)
}

pub fn signal_start(handle &C.uv_signal_t, cb fn (handle &C.uv_signal_t, signum int), signum int) int {
	return C.uv_signal_start(handle, cb, signum)
}

pub fn signal_stop(handle &C.uv_signal_t) int {
	return C.uv_signal_stop(handle)
}

// prepare functions

pub fn prepare_init(loop &C.uv_loop_t, handle &C.uv_prepare_t) int {
	return C.uv_prepare_init(loop, handle)
}

pub fn prepare_start(handle &C.uv_prepare_t, cb fn (handle &C.uv_prepare_t)) int {
	return C.uv_prepare_start(handle, cb)
}

pub fn prepare_stop(handle &C.uv_prepare_t) int {
	return C.uv_prepare_stop(handle)
}

// check functions

pub fn check_init(loop &C.uv_loop_t, handle &C.uv_check_t) int {
	return C.uv_check_init(loop, handle)
}

pub fn check_start(handle &C.uv_check_t, cb fn (handle &C.uv_check_t)) int {
	return C.uv_check_start(handle, cb)
}

pub fn check_stop(handle &C.uv_check_t) int {
	return C.uv_check_stop(handle)
}

// idle functions

pub fn idle_init(loop &C.uv_loop_t, handle &C.uv_idle_t) int {
	return C.uv_idle_init(loop, handle)
}

pub fn idle_start(handle &C.uv_idle_t, cb fn (handle &C.uv_idle_t)) int {
	return C.uv_idle_start(handle, cb)
}

pub fn idle_stop(handle &C.uv_idle_t) int {
	return C.uv_idle_stop(handle)
}

// async functions

pub fn async_init(loop &C.uv_loop_t, handle &C.uv_async_t, cb fn (handle &C.uv_async_t)) int {
	return C.uv_async_init(loop, handle, cb)
}

pub fn async_send(handle &C.uv_async_t) int {
	return C.uv_async_send(handle)
}

// address functions

// pub fn getaddrinfo(loop &C.uv_loop_t, req &C.uv_getaddrinfo_t, getaddrinfo_cb fn (req &C.uv_getaddrinfo_t, status int, res &C.addrinfo, node &char, service &char, hints &C.addrinfo)) int {
// 	return C.uv_getaddrinfo(loop, req, getaddrinfo_cb, node, service, hints)
// }

pub fn freeaddrinfo(ai &C.addrinfo) {
	C.uv_freeaddrinfo(ai)
}

pub fn ip4_addr(ip &char, port int, addr &C.sockaddr) int {
	return C.uv_ip4_addr(ip, port, addr)
}

// process functions

pub fn uv_spawn(loop &C.uv_loop_t, handle &C.uv_process_t, options &C.uv_process_options_t) int {
	return C.uv_spawn(loop, handle, options)
}

pub fn process_kill(handle &C.uv_process_t, signum int) int {
	return C.uv_process_kill(handle, signum)
}

pub fn kill(pid int, signum int) int {
	return C.uv_kill(pid, signum)
}

// fs functions

pub fn fs_open(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, flags int, mode int, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_open(loop, req, path, flags, mode, cb)
}

pub fn fs_close(loop &C.uv_loop_t, req &C.uv_fs_t, file int, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_close(loop, req, file, cb)
}

pub fn fs_read(loop &C.uv_loop_t, req &C.uv_fs_t, file int, bufs &C.uv_buf_t, nbufs u32, offset i64, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_read(loop, req, file, bufs, nbufs, offset, cb)
}

pub fn fs_write(loop &C.uv_loop_t, req &C.uv_fs_t, file int, bufs &C.uv_buf_t, nbufs u32, offset i64, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_write(loop, req, file, bufs, nbufs, offset, cb)
}

pub fn fs_unlink(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_unlink(loop, req, path, cb)
}

pub fn fs_mkdir(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, mode int, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_mkdir(loop, req, path, mode, cb)
}

pub fn fs_rmdir(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_rmdir(loop, req, path, cb)
}

pub fn fs_scandir(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, flags int, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_scandir(loop, req, path, flags, cb)
}

pub fn fs_scandir_next(req &C.uv_fs_t, ent &C.uv_dirent_t) int {
	return C.uv_fs_scandir_next(req, ent)
}

pub fn fs_stat(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_stat(loop, req, path, cb)
}

pub fn fs_fstat(loop &C.uv_loop_t, req &C.uv_fs_t, file int, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_fstat(loop, req, file, cb)
}

pub fn fs_rename(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, new_path &char, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_rename(loop, req, path, new_path, cb)
}

pub fn fs_fsync(loop &C.uv_loop_t, req &C.uv_fs_t, file int, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_fsync(loop, req, file, cb)
}

pub fn fs_fdatasync(loop &C.uv_loop_t, req &C.uv_fs_t, file int, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_fdatasync(loop, req, file, cb)
}

pub fn fs_ftruncate(loop &C.uv_loop_t, req &C.uv_fs_t, file int, offset i64, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_ftruncate(loop, req, file, offset, cb)
}

pub fn fs_sendfile(loop &C.uv_loop_t, req &C.uv_fs_t, out_fd int, in_fd int, in_offset i64, length usize, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_sendfile(loop, req, out_fd, in_fd, in_offset, length, cb)
}

pub fn fs_access(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, mode int, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_access(loop, req, path, mode, cb)
}

pub fn fs_chmod(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, mode int, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_chmod(loop, req, path, mode, cb)
}

pub fn fs_fchmod(loop &C.uv_loop_t, req &C.uv_fs_t, file int, mode int, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_fchmod(loop, req, file, mode, cb)
}

pub fn fs_utime(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, atime f64, mtime f64, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_utime(loop, req, path, atime, mtime, cb)
}

pub fn fs_futime(loop &C.uv_loop_t, req &C.uv_fs_t, file int, atime f64, mtime f64, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_futime(loop, req, file, atime, mtime, cb)
}

pub fn fs_lstat(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_lstat(loop, req, path, cb)
}

pub fn fs_link(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, new_path &char, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_link(loop, req, path, new_path, cb)
}

pub fn fs_symlink(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, new_path &char, flags int, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_symlink(loop, req, path, new_path, flags, cb)
}

pub fn fs_readlink(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_readlink(loop, req, path, cb)
}

pub fn fs_realpath(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_realpath(loop, req, path, cb)
}

pub fn fs_chown(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, uid u32, gid u32, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_chown(loop, req, path, uid, gid, cb)
}

pub fn fs_fchown(loop &C.uv_loop_t, req &C.uv_fs_t, file int, uid u32, gid u32, cb fn (req &C.uv_fs_t)) {
	C.uv_fs_fchown(loop, req, file, uid, gid, cb)
}

pub fn fs_event_init(loop &C.uv_loop_t, handle &C.uv_fs_event_t) int {
	return C.uv_fs_event_init(loop, handle)
}

pub fn fs_event_start(handle &C.uv_fs_event_t, cb fn (handle &C.uv_fs_event_t, filename &char, events int, status int), path &&char, flags int) int {
	return C.uv_fs_event_start(handle, cb, path, flags)
}

pub fn fs_event_stop(handle &C.uv_fs_event_t) int {
	return C.uv_fs_event_stop(handle)
}

pub fn fs_poll_init(loop &C.uv_loop_t, handle &C.uv_fs_poll_t) int {
	return C.uv_fs_poll_init(loop, handle)
}

pub fn fs_poll_start(handle &C.uv_fs_poll_t, cb fn (handle &C.uv_fs_poll_t, status int, prev &C.uv_stat_t, curr &C.uv_stat_t), path &char, interval u32) int {
	return C.uv_fs_poll_start(handle, cb, path, interval)
}

pub fn fs_poll_stop(handle &C.uv_fs_poll_t) int {
	return C.uv_fs_poll_stop(handle)
}

// misc functions

pub fn queue_work(loop &C.uv_loop_t, work &C.uv_work_t, work_cb fn (work &C.uv_work_t), after_work_cb fn (work &C.uv_work_t, status int)) {
	C.uv_queue_work(loop, work, work_cb, after_work_cb)
}
