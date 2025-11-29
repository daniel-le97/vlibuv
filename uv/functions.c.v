module uv

#define INIT_IPV6_ADDR() ((struct sockaddr_in6*)memdup(&(struct sockaddr_in6){EMPTY_STRUCT_INITIALIZATION}, sizeof(struct sockaddr_in6)))

fn C.INIT_IPV6_ADDR() voidptr

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

fn C.uv_default_loop() &Uv_loop_t

pub fn default_loop() &Uv_loop_t {
	return C.uv_default_loop()
}

fn C.uv_loop_init(loop &Uv_loop_t) int

pub fn loop_init(loop &Uv_loop_t) int {
	return C.uv_loop_init(loop)
}

fn C.uv_loop_close(loop &Uv_loop_t) int

pub fn loop_close(loop &Uv_loop_t) int {
	return C.uv_loop_close(loop)
}

fn C.uv_loop_new() &Uv_loop_t

// this is deprecated, allocate the loop manually and use loop_init instead
@[deprecated: 'allocate the loop manually and use loop_init instead']
pub fn loop_new() &Uv_loop_t {
	return C.uv_loop_new()
}

fn C.uv_loop_delete(loop &Uv_loop_t)

// this function is deprecated, use loop_close and free the memory manually instead
@[deprecated: 'use loop_close and free the memory manually instead']
pub fn loop_delete(loop &Uv_loop_t) {
	C.uv_loop_delete(loop)
}

fn C.uv_loop_size() usize

pub fn loop_size() usize {
	return C.uv_loop_size()
}

fn C.uv_loop_alive(const_loop &Uv_loop_t) int

pub fn loop_alive(const_loop &Uv_loop_t) int {
	return C.uv_loop_alive(const_loop)
}

fn C.uv_loop_configure(loop &Uv_loop_t, option int, ...voidptr) int

pub fn loop_configure(loop &Uv_loop_t, option Uv_loop_option, args ...voidptr) int {
	return C.uv_loop_configure(loop, int(option), ...args)
}

fn C.uv_loop_fork(loop &Uv_loop_t) int

pub fn loop_fork(loop &Uv_loop_t) int {
	return C.uv_loop_fork(loop)
}

fn C.uv_run(loop &Uv_loop_t, mode int) int

pub fn run(loop &Uv_loop_t, mode Mode) int {
	return C.uv_run(loop, int(mode))
}

fn C.uv_stop(loop &Uv_loop_t)

pub fn stop(loop &Uv_loop_t) {
	C.uv_stop(loop)
}

fn C.uv_ref(handle &Uv_handle_t)

pub fn ref(handle &Uv_handle_t) {
	C.uv_ref(handle)
}

fn C.uv_unref(handle &Uv_handle_t)

pub fn unref(handle &Uv_handle_t) {
	C.uv_unref(handle)
}

fn C.uv_has_ref(handle &Uv_handle_t) int

pub fn has_ref(const_handle &Uv_handle_t) int {
	return C.uv_has_ref(const_handle)
}

fn C.uv_update_time(loop &Uv_loop_t)

pub fn update_time(loop &Uv_loop_t) {
	C.uv_update_time(loop)
}

fn C.uv_now(loop &Uv_loop_t) u64

pub fn now(const_loop &Uv_loop_t) u64 {
	return C.uv_now(const_loop)
}

fn C.uv_backend_fd(loop &Uv_loop_t) int

pub fn backend_fd(loop &Uv_loop_t) int {
	return C.uv_backend_fd(loop)
}

fn C.uv_backend_timeout(loop &Uv_loop_t) int

pub fn backend_timeout(loop &Uv_loop_t) int {
	return C.uv_backend_timeout(loop)
}

pub type Alloc_cb = fn (handle &Uv_handle_t, suggested_size usize, buf &Uv_buf_t)

pub type Read_cb = fn (stream &Uv_stream_t, nread isize, buf &Uv_buf_t)

pub type Write_cb = fn (req &Uv_write_t, status int)

pub type Connect_cb = fn (req &Uv_connect_t, status int)

pub type Shutdown_cb = fn (req &Uv_shutdown_t, status int)

pub type Connection_cb = fn (server &Uv_stream_t, status int)

pub type Close_cb = fn (handle &Uv_handle_t)

pub type Poll_cb = fn (handle &Uv_poll_t, status int, events int)

pub type Timer_cb = fn (handle &Uv_timer_t)

pub type Async_cb = fn (handle &Uv_async_t)

pub type Prepare_cb = fn (handle &Uv_prepare_t)

pub type Check_cb = fn (handle &Uv_check_t)

pub type Idle_cb = fn (handle &Uv_idle_t)

pub type Exit_cb = fn (handle &Uv_process_t, exit_status i64, term_signal int)

pub type Walk_cb = fn (handle &Uv_handle_t, arg voidptr)

pub type Fs_cb = fn (req &Uv_fs_t)

pub type Work_cb = fn (req &Uv_work_t)

pub type AfterWork_cb = fn (req &Uv_work_t, status int)

pub type Getaddrinfo_cb = fn (req &Uv_getaddrinfo_t, status int, res &C.addrinfo)

pub type Getnameinfo_cb = fn (req &Uv_getnameinfo_t, status int, hostname &char, service &char)

pub type Random_cb = fn (req &Uv_random_t, status int, buf voidptr, buflen usize)

pub type FsEvent_cb = fn (handle &Uv_fs_event_t, const_filename &char, events int, status int)

pub type FsPoll_cb = fn (handle &Uv_fs_poll_t, status int, const_prev &Uv_stat_t, const_curr &Uv_stat_t)

pub type Signal_cb = fn (handle &Uv_signal_t, signum int)

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

fn C.uv_shutdown(req &Uv_shutdown_t, handle &Uv_stream_t, cb Shutdown_cb) int

pub fn shutdown(req &Uv_shutdown_t, handle &Uv_stream_t, cb Shutdown_cb) int {
	return C.uv_shutdown(req, handle, cb)
}

// handle functions

fn C.uv_handle_size(handle_type int) usize

pub fn handle_size(handle_type Uv_handle_type) usize {
	return C.uv_handle_size(int(handle_type))
}

fn C.uv_handle_get_type(const_handle &Uv_handle_t) Uv_handle_type

pub fn handle_get_type(const_handle &Uv_handle_t) Uv_handle_type {
	// handle := const_handle['type']
	unsafe {
		return Uv_handle_type(C.uv_handle_get_type(const_handle))
	}
}

fn C.uv_handle_type_name(handle_type int) &char

pub fn handle_type_name(const_handle_type Uv_handle_type) string {
	unsafe {
		return cstring_to_vstring(C.uv_handle_type_name(int(const_handle_type)))
	}
}

fn C.uv_handle_get_data(const_handle &Uv_handle_t) voidptr

pub fn handle_get_data(const_handle &Uv_handle_t) voidptr {
	return C.uv_handle_get_data(const_handle)
}

fn C.uv_handle_get_loop(const_handle &Uv_handle_t) &Uv_loop_t

pub fn handle_get_loop(const_handle &Uv_handle_t) &Uv_loop_t {
	return C.uv_handle_get_loop(const_handle)
}

fn C.uv_handle_set_data(handle &Uv_handle_t, data voidptr)

pub fn handle_set_data(handle &Uv_handle_t, data voidptr) {
	C.uv_handle_set_data(handle, data)
}

// request functions

fn C.uv_req_size(req_type int) usize

pub fn req_size(req_type Uv_req_type) usize {
	return C.uv_req_size(int(req_type))
}

fn C.uv_req_get_data(const_req &Uv_req_t) voidptr

pub fn req_get_data(const_req &Uv_req_t) voidptr {
	return C.uv_req_get_data(const_req)
}

fn C.uv_req_set_data(req &Uv_req_t, data voidptr)

pub fn req_set_data(req &Uv_req_t, data voidptr) {
	C.uv_req_set_data(req, data)
}

fn C.uv_req_get_type(const_req &Uv_req_t) Uv_req_type

pub fn req_get_type(const_req &Uv_req_t) Uv_req_type {
	unsafe {
		return Uv_req_type(C.uv_req_get_type(const_req))
	}
}

fn C.uv_req_type_name(req_type int) &char

pub fn req_type_name(const_req_type Uv_req_type) string {
	unsafe {
		return cstring_to_vstring(C.uv_req_type_name(int(const_req_type)))
	}
}

fn C.uv_is_active(const_handle &Uv_handle_t) int

pub fn is_active(const_handle &Uv_handle_t) int {
	return C.uv_is_active(const_handle)
}

fn C.uv_walk(loop &Uv_loop_t, walk_cb fn (handle &Uv_handle_t, arg voidptr), arg voidptr)

pub fn walk(loop &Uv_loop_t, walk_cb fn (handle &Uv_handle_t, arg voidptr), arg voidptr) {
	C.uv_walk(loop, walk_cb, arg)
}

fn C.uv_print_all_handles(loop &Uv_loop_t, file &C.FILE)

pub fn print_all_handles(loop &Uv_loop_t, file &C.FILE) {
	C.uv_print_all_handles(loop, file)
}

fn C.uv_print_active_handles(loop &Uv_loop_t, file &C.FILE)

pub fn print_active_handles(loop &Uv_loop_t, file &C.FILE) {
	C.uv_print_active_handles(loop, file)
}

fn C.uv_close(handle &Uv_handle_t, close_cb fn (handle &Uv_handle_t))

pub fn close(handle &Uv_handle_t, close_cb fn (handle &Uv_handle_t)) {
	C.uv_close(handle, close_cb)
}

fn C.uv_send_buffer_size(handle &Uv_handle_t, value &int) int

pub fn send_buffer_size(handle &Uv_handle_t, value &int) int {
	return C.uv_send_buffer_size(handle, value)
}

fn C.uv_recv_buffer_size(handle &Uv_handle_t, value &int) int

pub fn recv_buffer_size(handle &Uv_handle_t, value &int) int {
	return C.uv_recv_buffer_size(handle, value)
}

fn C.uv_fileno(const_handle &Uv_handle_t, fd &int) int

pub fn fileno(const_handle &Uv_handle_t, fd &int) int {
	return C.uv_fileno(const_handle, fd)
}

// pub type Buf = u8 | char

fn C.uv_buf_init(base &char, len usize) Uv_buf_t

pub fn buf_init(base &u8, len usize) Uv_buf_t {
	return C.uv_buf_init(&char(base), len)
}

fn C.uv_pipe(fds [2]int, read_flags int, write_flags int) int

pub fn pipe(fds [2]int, read_flags int, write_flags int) int {
	return C.uv_pipe(fds, read_flags, write_flags)
}

fn C.uv_socketpair(socker_type int, protocol int, socket_vector [2]int, flags0 int, flags1 int) int

pub fn socketpair(socker_type int, protocol int, socket_vector [2]int, flags0 int, flags1 int) int {
	return C.uv_socketpair(socker_type, protocol, socket_vector, flags0, flags1)
}

fn C.uv_stream_get_write_queue_size(const_stream &Uv_stream_t) usize

pub fn stream_get_write_queue_size(const_stream &Uv_stream_t) usize {
	return C.uv_stream_get_write_queue_size(const_stream)
}

fn C.uv_listen(stream &Uv_stream_t, backlog int, cb Connection_cb) int

pub fn listen(stream &Uv_stream_t, backlog int, cb Connection_cb) int {
	return C.uv_listen(stream, backlog, cb)
}

fn C.uv_accept(server &Uv_stream_t, client &Uv_stream_t) int

pub fn accept(server &Uv_stream_t, client &Uv_stream_t) int {
	return C.uv_accept(server, client)
}

fn C.uv_read_start(stream &Uv_stream_t, alloc_cb Alloc_cb, read_cb Read_cb) int

pub fn read_start(stream &Uv_stream_t, alloc_cb Alloc_cb, read_cb Read_cb) int {
	return C.uv_read_start(stream, alloc_cb, read_cb)
}

fn C.uv_read_stop(stream &Uv_stream_t) int

pub fn read_stop(stream &Uv_stream_t) int {
	return C.uv_read_stop(stream)
}

// TODO bufs is written as const uv_buf_t bufs[] in c, but I don't know how to handle that in v
fn C.uv_write(req &Uv_write_t, handle &Uv_stream_t, const_bufs &Uv_buf_t, nbufs usize, cb Write_cb) int

// writes to the buffer
pub fn write(req &Uv_write_t, handle &Uv_stream_t, const_bufs &Uv_buf_t, nbufs usize, cb Write_cb) int {
	return C.uv_write(req, handle, const_bufs, nbufs, cb)
}

// TODO bufs is written as const uv_buf_t bufs[] in c, but I don't know how to handle that in v
fn C.uv_write2(req &Uv_write_t, handle &Uv_stream_t, const_bufs &Uv_buf_t, nbufs usize, send_handle &Uv_stream_t, cb Write_cb) int

pub fn write2(req &Uv_write_t, handle &Uv_stream_t, const_bufs &Uv_buf_t, nbufs usize, send_handle &Uv_stream_t, cb Write_cb) int {
	return C.uv_write2(req, handle, const_bufs, nbufs, send_handle, cb)
}

fn C.uv_try_write(handle &Uv_stream_t, const_bufs &Uv_buf_t, nbufs usize) int

pub fn try_write(handle &Uv_stream_t, const_bufs &Uv_buf_t, nbufs usize) int {
	return C.uv_try_write(handle, const_bufs, nbufs)
}

fn C.uv_try_write2(handle &Uv_stream_t, const_bufs &Uv_buf_t, nbufs usize, send_handle &Uv_stream_t) int

pub fn try_write2(handle &Uv_stream_t, const_bufs &Uv_buf_t, nbufs usize, send_handle &Uv_stream_t) int {
	return C.uv_try_write2(handle, const_bufs, nbufs, send_handle)
}

fn C.uv_is_readable(const_handle &Uv_stream_t) int

pub fn is_readable(const_handle &Uv_stream_t) int {
	return C.uv_is_readable(const_handle)
}

fn C.uv_is_writable(const_handle &Uv_stream_t) int

pub fn is_writable(const_handle &Uv_stream_t) int {
	return C.uv_is_writable(const_handle)
}

fn C.uv_stream_set_blocking(handle &Uv_stream_t, blocking int) int

pub fn stream_set_blocking(handle &Uv_stream_t, blocking int) int {
	return C.uv_stream_set_blocking(handle, blocking)
}

fn C.uv_is_closing(const_handle &Uv_handle_t) int

pub fn is_closing(const_handle &Uv_handle_t) int {
	return C.uv_is_closing(const_handle)
}

// tcp functions

fn C.uv_tcp_init(loop &Uv_loop_t, handle &Uv_tcp_t) int

pub fn tcp_init(loop &Uv_loop_t, handle &Uv_tcp_t) int {
	return C.uv_tcp_init(loop, handle)
}

fn C.uv_tcp_init_ex(loop &Uv_loop_t, handle &Uv_tcp_t, flags usize) int

pub fn tcp_init_ex(loop &Uv_loop_t, handle &Uv_tcp_t, flags usize) int {
	return C.uv_tcp_init_ex(loop, handle, flags)
}

fn C.uv_tcp_open(handle &Uv_tcp_t, sock int) int

pub fn tcp_open(handle &Uv_tcp_t, sock int) int {
	return C.uv_tcp_open(handle, sock)
}

fn C.uv_tcp_nodelay(handle &Uv_tcp_t, enable int) int

pub fn tcp_nodelay(handle &Uv_tcp_t, enable int) int {
	return C.uv_tcp_nodelay(handle, enable)
}

fn C.uv_tcp_keepalive(handle &Uv_tcp_t, enable int, delay u32) int

pub fn tcp_keepalive(handle &Uv_tcp_t, enable int, delay u32) int {
	return C.uv_tcp_keepalive(handle, enable, delay)
}

fn C.uv_tcp_simultaneous_accepts(handle &Uv_tcp_t, enable int) int

pub fn tcp_simultaneous_accepts(handle &Uv_tcp_t, enable int) int {
	return C.uv_tcp_simultaneous_accepts(handle, enable)
}

fn C.uv_tcp_bind(handle &Uv_tcp_t, addr &C.sockaddr, flags u32) int

pub fn tcp_bind(handle &Uv_tcp_t, const_sockaddr &C.sockaddr, flags int) int {
	return C.uv_tcp_bind(handle, const_sockaddr, flags)
}

fn C.uv_tcp_getsockname(handle &Uv_tcp_t, name &C.sockaddr, namelen &int) int

pub fn tcp_getsockname(const_handle &Uv_tcp_t, name &C.sockaddr, namelen &int) int {
	return C.uv_tcp_getsockname(const_handle, name, namelen)
}

fn C.uv_tcp_getpeername(handle &Uv_tcp_t, name &C.sockaddr, namelen &int) int

pub fn tcp_getpeername(const_handle &Uv_tcp_t, name &C.sockaddr, namelen &int) int {
	return C.uv_tcp_getpeername(const_handle, name, namelen)
}

fn C.uv_tcp_connect(req &Uv_connect_t, handle &Uv_tcp_t, addr &C.sockaddr, cb fn (req &Uv_connect_t, status int)) int

pub fn tcp_connect(req &Uv_connect_t, handle &Uv_tcp_t, const_sockaddr &C.sockaddr, cb fn (req &Uv_connect_t, status int)) int {
	return C.uv_tcp_connect(req, handle, const_sockaddr, cb)
}

pub type Udp_send_cb = fn (req &Uv_udp_send_t, status int)

pub type Udp_recv_cb = fn (handle &Uv_udp_t, nread isize, const_buf &Uv_buf_t, const_sockaddr &C.sockaddr, flags Uv_udp_flags)

// udp functions

fn C.uv_udp_init(loop &Uv_loop_t, handle &Uv_udp_t) int

pub fn udp_init(loop &Uv_loop_t, handle &Uv_udp_t) int {
	return C.uv_udp_init(loop, handle)
}

fn C.uv_udp_init_ex(loop &Uv_loop_t, handle &Uv_udp_t, flags Uv_udp_flags) int

pub fn udp_init_ex(loop &Uv_loop_t, handle &Uv_udp_t, flags Uv_udp_flags) int {
	return C.uv_udp_init_ex(loop, handle, flags)
}

fn C.uv_udp_open(handle &Uv_udp_t, sock int) int

pub fn udp_open(handle &Uv_udp_t, sock int) int {
	return C.uv_udp_open(handle, sock)
}

fn C.uv_udp_bind(handle &Uv_udp_t, addr &C.sockaddr, flags u32) int

pub fn udp_bind(handle &Uv_udp_t, const_sockaddr &C.sockaddr, flags int) int {
	return C.uv_udp_bind(handle, const_sockaddr, flags)
}

fn C.uv_udp_connect(handle &Uv_udp_t, const_sockaddr &C.sockaddr) int

pub fn udp_connect(handle &Uv_udp_t, const_sockaddr &C.sockaddr) int {
	return C.uv_udp_connect(handle, const_sockaddr)
}

fn C.uv_udp_getpeername(const_handle &Uv_udp_t, name &C.sockaddr, namelen &int) int

pub fn udp_getpeername(const_handle &Uv_udp_t, name &C.sockaddr, namelen &int) int {
	return C.uv_udp_getpeername(const_handle, name, namelen)
}

fn C.uv_udp_getsockname(handle &Uv_udp_t, name &C.sockaddr, namelen &int) int

pub fn udp_getsockname(handle &Uv_udp_t, name &C.sockaddr, namelen &int) int {
	return C.uv_udp_getsockname(handle, name, namelen)
}

fn C.uv_udp_set_membership(handle &Uv_udp_t, multicast_addr &char, interface_addr &char, membership int) int

pub fn udp_set_membership(handle &Uv_udp_t, multicast_addr &char, interface_addr &char, membership Uv_membership) int {
	return C.uv_udp_set_membership(handle, multicast_addr, interface_addr, int(membership))
}

fn C.uv_udp_set_source_membership(handle &Uv_udp_t, const_multicast_addr &char, const_interface_addr &char, const_source_addr &char, membership int) int

pub fn udp_set_source_membership(handle &Uv_udp_t, const_multicast_addr &char, const_interface_addr &char, const_source_addr &char, membership Uv_membership) int {
	return C.uv_udp_set_source_membership(handle, const_multicast_addr, const_interface_addr,
		const_source_addr, int(membership))
}

fn C.uv_udp_set_multicast_loop(handle &Uv_udp_t, on int) int

pub fn udp_set_multicast_loop(handle &Uv_udp_t, on int) int {
	return C.uv_udp_set_multicast_loop(handle, on)
}

fn C.uv_udp_set_multicast_ttl(handle &Uv_udp_t, ttl int) int

pub fn udp_set_multicast_ttl(handle &Uv_udp_t, ttl int) int {
	return C.uv_udp_set_multicast_ttl(handle, ttl)
}

fn C.uv_udp_set_multicast_interface(handle &Uv_udp_t, interface_addr &char) int

pub fn udp_set_multicast_interface(handle &Uv_udp_t, const_interface_addr &char) int {
	return C.uv_udp_set_multicast_interface(handle, const_interface_addr)
}

fn C.uv_udp_set_broadcast(handle &Uv_udp_t, on int) int

pub fn udp_set_broadcast(handle &Uv_udp_t, on int) int {
	return C.uv_udp_set_broadcast(handle, on)
}

fn C.uv_udp_set_ttl(handle &Uv_udp_t, ttl int) int

pub fn udp_set_ttl(handle &Uv_udp_t, ttl int) int {
	return C.uv_udp_set_ttl(handle, ttl)
}

fn C.uv_udp_send(req &Uv_udp_send_t, handle &Uv_udp_t, bufs &Uv_buf_t, nbufs u32, addr &C.sockaddr, cb fn (req &Uv_udp_send_t, status int)) int

pub fn udp_send(req &Uv_udp_send_t, handle &Uv_udp_t, const_bufs &Uv_buf_t, nbufs u32, addr &C.sockaddr, cb fn (req &Uv_udp_send_t, status int)) int {
	return C.uv_udp_send(req, handle, const_bufs, nbufs, addr, cb)
}

fn C.uv_udp_try_send(handle &Uv_udp_t, const_bufs &Uv_buf_t, nbufs u32, addr &C.sockaddr) int

pub fn udp_try_send(handle &Uv_udp_t, const_bufs &Uv_buf_t, nbufs u32, const_sockaddr &C.sockaddr) int {
	return C.uv_udp_try_send(handle, const_bufs, nbufs, const_sockaddr)
}

fn C.uv_udp_recv_start(handle &Uv_udp_t, alloc_cb fn (handle &Uv_handle_t, suggested_size usize, buf &Uv_buf_t), recv_cb fn (handle &Uv_udp_t, nread isize, buf &Uv_buf_t, addr &C.sockaddr, flags u32)) int

pub fn udp_recv_start(handle &Uv_udp_t, alloc_cb fn (handle &Uv_handle_t, suggested_size usize, buf &Uv_buf_t), recv_cb fn (handle &Uv_udp_t, nread isize, buf &Uv_buf_t, addr &C.sockaddr, flags u32)) int {
	return C.uv_udp_recv_start(handle, alloc_cb, recv_cb)
}

fn C.uv_udp_using_recvmmsg(const_handle &Uv_udp_t) int

pub fn udp_using_recvmmsg(const_handle &Uv_udp_t) int {
	return C.uv_udp_using_recvmmsg(const_handle)
}

fn C.uv_udp_recv_stop(handle &Uv_udp_t) int

pub fn udp_recv_stop(handle &Uv_udp_t) int {
	return C.uv_udp_recv_stop(handle)
}

fn C.uv_udp_get_send_queue_size(const_handle &Uv_udp_t) usize

pub fn udp_get_send_queue_size(const_handle &Uv_udp_t) usize {
	return C.uv_udp_get_send_queue_size(const_handle)
}

fn C.uv_udp_get_send_queue_count(const_handle &Uv_udp_t) usize

pub fn udp_get_send_queue_count(const_handle &Uv_udp_t) usize {
	return C.uv_udp_get_send_queue_count(const_handle)
}

// tty functions

fn C.uv_tty_init(loop &Uv_loop_t, handle &Uv_tty_t, fd int, readable int) int

pub fn tty_init(loop &Uv_loop_t, handle &Uv_tty_t, fd int, readable int) int {
	return C.uv_tty_init(loop, handle, fd, readable)
}

fn C.uv_tty_set_mode(handle &Uv_tty_t, mode int) int

pub fn tty_set_mode(handle &Uv_tty_t, mode Uv_tty_mode) int {
	return C.uv_tty_set_mode(handle, int(mode))
}

fn C.uv_tty_reset_mode() int

pub fn tty_reset_mode() int {
	return C.uv_tty_reset_mode()
}

fn C.uv_tty_get_winsize(handle &Uv_tty_t, width &int, height &int) int

pub fn tty_get_winsize(handle &Uv_tty_t, width &int, height &int) int {
	return C.uv_tty_get_winsize(handle, width, height)
}

fn C.uv_tty_set_vterm_state(state int)

pub fn tty_set_vterm_state(state Uv_tty_vtermstate) {
	C.uv_tty_set_vterm_state(int(state))
}

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

// pipe functions

fn C.uv_pipe_init(loop &Uv_loop_t, handle &Uv_pipe_t, ipc int) int

pub fn pipe_init(loop &Uv_loop_t, handle &Uv_pipe_t, ipc int) int {
	return C.uv_pipe_init(loop, handle, ipc)
}

fn C.uv_pipe_open(handle &Uv_pipe_t, file int) int

pub fn pipe_open(handle &Uv_pipe_t, file int) int {
	return C.uv_pipe_open(handle, file)
}

fn C.uv_pipe_bind(handle &Uv_pipe_t, name &char) int

pub fn pipe_bind(handle &Uv_pipe_t, const_name &char) int {
	return C.uv_pipe_bind(handle, const_name)
}

fn C.uv_pipe_bind2(handle &Uv_pipe_t, const_name &char, namelen usize, flags usize) int

pub fn pipe_bind2(handle &Uv_pipe_t, const_name &char, namelen usize, flags usize) int {
	return C.uv_pipe_bind2(handle, const_name, namelen, flags)
}

fn C.uv_pipe_connect(req &Uv_connect_t, handle &Uv_pipe_t, name &char, cb fn (req &Uv_connect_t, status int))

pub fn pipe_connect(req &Uv_connect_t, handle &Uv_pipe_t, const_name &char, cb fn (req &Uv_connect_t, status int)) {
	C.uv_pipe_connect(req, handle, const_name, cb)
}

fn C.uv_pipe_connect2(req &Uv_connect_t, handle &Uv_pipe_t, const_name &char, namelen usize, flags usize, cb fn (req &Uv_connect_t, status int)) int

pub fn pipe_connect2(req &Uv_connect_t, handle &Uv_pipe_t, const_name &char, namelen usize, flags usize, cb fn (req &Uv_connect_t, status int)) int {
	return C.uv_pipe_connect2(req, handle, const_name, namelen, flags, cb)
}

fn C.uv_pipe_getsockname(handle &Uv_pipe_t, buffer &char, size &usize) int

pub fn pipe_getsockname(handle &Uv_pipe_t, name &char, namelen &usize) int {
	return C.uv_pipe_getsockname(handle, name, namelen)
}

fn C.uv_pipe_getpeername(handle &Uv_pipe_t, buffer &char, size &usize) int

pub fn pipe_getpeername(handle &Uv_pipe_t, name &char, namelen &usize) int {
	return C.uv_pipe_getpeername(handle, name, namelen)
}

fn C.uv_pipe_pending_instances(handle &Uv_pipe_t, count int)

pub fn pipe_pending_instances(handle &Uv_pipe_t, count int) {
	C.uv_pipe_pending_instances(handle, count)
}

fn C.uv_pipe_pending_count(handle &Uv_pipe_t) int

pub fn pipe_pending_count(handle &Uv_pipe_t) int {
	return C.uv_pipe_pending_count(handle)
}

fn C.uv_pipe_pending_type(handle &Uv_pipe_t) int

pub fn pipe_pending_type(handle &Uv_pipe_t) int {
	return C.uv_pipe_pending_type(handle)
}

fn C.uv_pipe_chmod(handle &Uv_pipe_t, flags int) int

pub fn pipe_chmod(handle &Uv_pipe_t, flags int) int {
	return C.uv_pipe_chmod(handle, flags)
}

// poll functions

fn C.uv_poll_init(loop &Uv_loop_t, handle &Uv_poll_t, fd int) int

pub fn poll_init(loop &Uv_loop_t, handle &Uv_poll_t, fd int) int {
	return C.uv_poll_init(loop, handle, fd)
}

fn C.uv_poll_init_socket(loop &Uv_loop_t, handle &Uv_poll_t, socket int) int

pub fn poll_init_socket(loop &Uv_loop_t, handle &Uv_poll_t, socket int) int {
	$if $d('uv_static', false) {
		return C.uv_poll_init_socket(loop, handle, socket)
	} $else {
		panic('uv_poll_init_socket is not available when building from source')
		return -1
	}
}

fn C.uv_poll_start(handle &Uv_poll_t, events int, cb fn (handle &Uv_poll_t, status int, events int)) int

pub fn poll_start(handle &Uv_poll_t, events int, cb fn (handle &Uv_poll_t, status int, events int)) int {
	return C.uv_poll_start(handle, events, cb)
}

fn C.uv_poll_stop(handle &Uv_poll_t) int

pub fn poll_stop(handle &Uv_poll_t) int {
	return C.uv_poll_stop(handle)
}

// prepare functions

fn C.uv_prepare_init(loop &Uv_loop_t, handle &Uv_prepare_t) int

pub fn prepare_init(loop &Uv_loop_t, handle &Uv_prepare_t) int {
	return C.uv_prepare_init(loop, handle)
}

fn C.uv_prepare_start(handle &Uv_prepare_t, cb fn (handle &Uv_prepare_t)) int

pub fn prepare_start(handle &Uv_prepare_t, cb fn (handle &Uv_prepare_t)) int {
	return C.uv_prepare_start(handle, cb)
}

fn C.uv_prepare_stop(handle &Uv_prepare_t) int

pub fn prepare_stop(handle &Uv_prepare_t) int {
	return C.uv_prepare_stop(handle)
}

// check functions

fn C.uv_check_init(loop &Uv_loop_t, handle &Uv_check_t) int

pub fn check_init(loop &Uv_loop_t, handle &Uv_check_t) int {
	return C.uv_check_init(loop, handle)
}

fn C.uv_check_start(handle &Uv_check_t, cb fn (handle &Uv_check_t)) int

pub fn check_start(handle &Uv_check_t, cb fn (handle &Uv_check_t)) int {
	return C.uv_check_start(handle, cb)
}

fn C.uv_check_stop(handle &Uv_check_t) int

pub fn check_stop(handle &Uv_check_t) int {
	return C.uv_check_stop(handle)
}

// idle functions

fn C.uv_idle_init(loop &Uv_loop_t, handle &Uv_idle_t) int

pub fn idle_init(loop &Uv_loop_t, handle &Uv_idle_t) int {
	return C.uv_idle_init(loop, handle)
}

fn C.uv_idle_start(handle &Uv_idle_t, cb fn (handle &Uv_idle_t)) int

pub fn idle_start(handle &Uv_idle_t, cb fn (handle &Uv_idle_t)) int {
	return C.uv_idle_start(handle, cb)
}

fn C.uv_idle_stop(handle &Uv_idle_t) int

pub fn idle_stop(handle &Uv_idle_t) int {
	return C.uv_idle_stop(handle)
}

// async functions
fn C.uv_async_init(loop &Uv_loop_t, handle &Uv_async_t, cb fn (handle &Uv_async_t)) int

pub fn async_init(loop &Uv_loop_t, handle &Uv_async_t, cb fn (handle &Uv_async_t)) int {
	return C.uv_async_init(loop, handle, cb)
}

fn C.uv_async_send(handle &Uv_async_t) int

pub fn async_send(handle &Uv_async_t) int {
	return C.uv_async_send(handle)
}

// timer functions

fn C.uv_timer_init(loop &Uv_loop_t, handle &Uv_timer_t) int

pub fn timer_init(loop &Uv_loop_t, handle &Uv_timer_t) int {
	return C.uv_timer_init(loop, handle)
}

fn C.uv_timer_start(handle &Uv_timer_t, cb fn (handle &Uv_timer_t), timeout u64, repeat u64) int

pub fn timer_start(handle &Uv_timer_t, cb fn (handle &Uv_timer_t), timeout u64, repeat u64) int {
	return C.uv_timer_start(handle, cb, timeout, repeat)
}

fn C.uv_timer_stop(handle &Uv_timer_t) int

pub fn timer_stop(handle &Uv_timer_t) int {
	return C.uv_timer_stop(handle)
}

fn C.uv_timer_again(handle &Uv_timer_t) int

pub fn timer_again(handle &Uv_timer_t) int {
	return C.uv_timer_again(handle)
}

fn C.uv_timer_set_repeat(handle &Uv_timer_t, repeat u64)

pub fn timer_set_repeat(handle &Uv_timer_t, repeat u64) {
	C.uv_timer_set_repeat(handle, repeat)
}

fn C.uv_timer_get_repeat(handle &Uv_timer_t) u64

pub fn timer_get_repeat(const_handle &Uv_timer_t) u64 {
	return C.uv_timer_get_repeat(const_handle)
}

fn C.uv_timer_get_due_in(const_handle &Uv_timer_t) u64

pub fn timer_get_due_in(const_handle &Uv_timer_t) u64 {
	return C.uv_timer_get_due_in(const_handle)
}

// address/name functions

fn C.uv_getaddrinfo(loop &Uv_loop_t, req &Uv_getaddrinfo_t, cb fn (req &Uv_getaddrinfo_t, status int, res &C.addrinfo), const_node &char, const_service &char, const_hints &C.addrinfo) int

pub fn getaddrinfo(loop &Uv_loop_t, req &Uv_getaddrinfo_t, cb fn (req &Uv_getaddrinfo_t, status int, res &C.addrinfo), const_node &char, const_service &char, const_hints &C.addrinfo) int {
	return C.uv_getaddrinfo(loop, req, cb, const_node, const_service, const_hints)
}

fn C.uv_freeaddrinfo(addr &C.addrinfo)

pub fn freeaddrinfo(ai &C.addrinfo) {
	C.uv_freeaddrinfo(ai)
}

fn C.uv_getnameinfo(loop &Uv_loop_t, req &Uv_getnameinfo_t, cb fn (req &Uv_getnameinfo_t, status int, hostname &char, service &char), const_sockaddr &C.sockaddr, flags int) int

pub fn getnameinfo(loop &Uv_loop_t, req &Uv_getnameinfo_t, cb fn (req &Uv_getnameinfo_t, status int, hostname &char, service &char), const_sockaddr &C.sockaddr, flags int) int {
	return C.uv_getnameinfo(loop, req, cb, const_sockaddr, flags)
}

// process functions

fn C.uv_spawn(loop &Uv_loop_t, handle &Uv_process_t, options &Uv_process_options_t) int

pub fn uv_spawn(loop &Uv_loop_t, handle &Uv_process_t, options &Uv_process_options_t) int {
	return C.uv_spawn(loop, handle, options)
}

fn C.uv_process_kill(handle &Uv_process_t, signum int) int

pub fn process_kill(handle &Uv_process_t, signum int) int {
	return C.uv_process_kill(handle, signum)
}

fn C.uv_kill(pid int, signum int) int

pub fn kill(pid int, signum int) int {
	return C.uv_kill(pid, signum)
}

// work functions

fn C.uv_queue_work(loop &Uv_loop_t, work &Uv_work_t, work_cb fn (work &Uv_work_t), after_work_cb fn (work &Uv_work_t, status int))

pub fn queue_work(loop &Uv_loop_t, work &Uv_work_t, work_cb fn (work &Uv_work_t), after_work_cb fn (work &Uv_work_t, status int)) {
	C.uv_queue_work(loop, work, work_cb, after_work_cb)
}

fn C.uv_cancel(req &Uv_req_t) int

pub fn cancel(req &Uv_req_t) int {
	return C.uv_cancel(req)
}

// memory functions

fn C.uv_getrusage(rusage &Uv_rusage_t) int

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

pub fn getrusage(rusage &Uv_rusage_t) int {
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

fn C.uv_os_get_passwd(pwd &Uv_passwd_t) int

pub fn os_get_passwd(pwd &Uv_passwd_t) int {
	return C.uv_os_get_passwd(pwd)
}

fn C.uv_os_free_passwd(pwd &Uv_passwd_t)

pub fn os_free_passwd(pwd &Uv_passwd_t) {
	C.uv_os_free_passwd(pwd)
}

fn C.uv_os_get_passwd2(pwd &Uv_passwd_t, uid Uv_uid_t) int

pub fn os_get_passwd2(pwd &Uv_passwd_t, uid Uv_uid_t) int {
	return C.uv_os_get_passwd2(pwd, uid)
}

fn C.uv_os_get_group(group &Uv_group_t, gid Uv_uid_t) int

pub fn os_get_group(group &Uv_group_t, gid Uv_uid_t) int {
	return C.uv_os_get_group(group, gid)
}

fn C.uv_os_free_group(group &Uv_group_t)

pub fn os_free_group(group &Uv_group_t) {
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

fn C.uv_thread_getpriority(tid Uv_thread_t, priority &int) int

pub fn thread_getpriority(tid Uv_thread_t, priority &int) int {
	return C.uv_thread_getpriority(tid, priority)
}

fn C.uv_thread_setpriority(tid Uv_thread_t, priority Uv_thread_priority) int

pub fn thread_setpriority(tid Uv_thread_t, priority Uv_thread_priority) int {
	return C.uv_thread_setpriority(tid, priority)
}

fn C.uv_available_parallelism() usize

pub fn available_parallelism() usize {
	return C.uv_available_parallelism()
}

fn C.uv_cpu_info(cpu_infos &&Uv_cpu_info_t, count &int) int

pub fn cpu_info(cpu_infos &&Uv_cpu_info_t, count &int) int {
	return C.uv_cpu_info(cpu_infos, count)
}

fn C.uv_free_cpu_info(cpu_infos &Uv_cpu_info_t, count int)

pub fn free_cpu_info(cpu_infos &Uv_cpu_info_t, count int) {
	C.uv_free_cpu_info(cpu_infos, count)
}

fn C.uv_cpumask_size() int

pub fn cpumask_size() int {
	return C.uv_cpumask_size()
}

fn C.uv_interface_addresses(addresses &&Uv_interface_address_t, count &int) int

pub fn interface_addresses(addresses &&Uv_interface_address_t, count &int) int {
	return C.uv_interface_addresses(addresses, count)
}

fn C.uv_free_interface_addresses(addresses &&Uv_interface_address_t, count int)

pub fn free_interface_addresses(addresses &Uv_interface_address_t, count int) {
	C.uv_free_interface_addresses(addresses, count)
}

// env functions

fn C.uv_os_environ(env_items &&Uv_env_item_t, count &int) int

pub fn os_environ(env_items &&Uv_env_item_t, count &int) int {
	return C.uv_os_environ(env_items, count)
}

fn C.uv_os_free_environ(env_items &Uv_env_item_t, count int)

pub fn os_free_environ(env_items &Uv_env_item_t, count int) {
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

fn C.uv_metrics_info(loop &Uv_loop_t, metrics &Uv_metrics_t) int

pub fn metrics_info(loop &Uv_loop_t, metrics &Uv_metrics_t) int {
	return C.uv_metrics_info(loop, metrics)
}

fn C.uv_metrics_idle_time(loop &Uv_loop_t) u64

pub fn metrics_idle_time(loop &Uv_loop_t) u64 {
	return C.uv_metrics_idle_time(loop)
}

// fs helper functions

fn C.uv_fs_get_type(const_fs &Uv_fs_t) int

pub fn fs_get_type(const_fs &Uv_fs_t) Uv_fs_type {
	unsafe {
		return Uv_fs_type(C.uv_fs_get_type(const_fs))
	}
}

fn C.uv_fs_get_result(const_fs &Uv_fs_t) int

pub fn fs_get_result(const_fs &Uv_fs_t) int {
	return C.uv_fs_get_result(const_fs)
}

fn C.uv_fs_get_system_error(const_fs &Uv_fs_t) int

pub fn fs_get_system_error(const_fs &Uv_fs_t) int {
	return C.uv_fs_get_system_error(const_fs)
}

fn C.uv_fs_get_ptr(const_fs &Uv_fs_t) &voidptr

pub fn fs_get_ptr(const_fs &Uv_fs_t) &voidptr {
	return C.uv_fs_get_ptr(const_fs)
}

fn C.uv_fs_get_path(const_fs &Uv_fs_t) &char

pub fn fs_get_path(const_fs &Uv_fs_t) string {
	unsafe {
		return cstring_to_vstring(C.uv_fs_get_path(const_fs))
	}
}

fn C.uv_fs_get_statbuf(fs_handle &Uv_fs_t) &Uv_stat_t

pub fn fs_get_statbuf(fs_handle &Uv_fs_t) &Uv_stat_t {
	return C.uv_fs_get_statbuf(fs_handle)
}

fn C.uv_fs_req_cleanup(fs &Uv_fs_t)

pub fn fs_req_cleanup(fs &Uv_fs_t) {
	C.uv_fs_req_cleanup(fs)
}

fn C.uv_fs_close(loop &Uv_loop_t, req &Uv_fs_t, file int, cb fn (req &Uv_fs_t))

pub fn fs_close(loop &Uv_loop_t, req &Uv_fs_t, file int, cb fn (req &Uv_fs_t)) {
	C.uv_fs_close(loop, req, file, cb)
}

fn C.uv_fs_open(loop &Uv_loop_t, req &Uv_fs_t, path &char, flags int, mode int, cb fn (req &Uv_fs_t))

pub fn fs_open(loop &Uv_loop_t, req &Uv_fs_t, path &char, flags int, mode int, cb fn (req &Uv_fs_t)) {
	C.uv_fs_open(loop, req, path, flags, mode, cb)
}

fn C.uv_fs_read(loop &Uv_loop_t, req &Uv_fs_t, file int, bufs &Uv_buf_t, nbufs u32, offset i64, cb fn (req &Uv_fs_t))

pub fn fs_read(loop &Uv_loop_t, req &Uv_fs_t, file int, bufs &Uv_buf_t, nbufs u32, offset i64, cb fn (req &Uv_fs_t)) {
	C.uv_fs_read(loop, req, file, bufs, nbufs, offset, cb)
}

fn C.uv_fs_unlink(loop &Uv_loop_t, req &Uv_fs_t, path &char, cb fn (req &Uv_fs_t))

pub fn fs_unlink(loop &Uv_loop_t, req &Uv_fs_t, path &char, cb fn (req &Uv_fs_t)) {
	C.uv_fs_unlink(loop, req, path, cb)
}

fn C.uv_fs_write(loop &Uv_loop_t, req &Uv_fs_t, file int, bufs &Uv_buf_t, nbufs u32, offset i64, cb fn (req &Uv_fs_t))

pub fn fs_write(loop &Uv_loop_t, req &Uv_fs_t, file int, bufs &Uv_buf_t, nbufs u32, offset i64, cb fn (req &Uv_fs_t)) {
	C.uv_fs_write(loop, req, file, bufs, nbufs, offset, cb)
}

// --------

fn C.uv_fs_copyfile(loop &Uv_loop_t, req &Uv_fs_t, const_path &char, const_new_path &char, flags int, cb fn (req &Uv_fs_t)) int

pub fn fs_copyfile(loop &Uv_loop_t, req &Uv_fs_t, const_path &char, const_new_path &char, flags int, cb fn (req &Uv_fs_t)) int {
	return C.uv_fs_copyfile(loop, req, const_path, const_new_path, flags, cb)
}

fn C.uv_fs_mkdir(loop &Uv_loop_t, req &Uv_fs_t, path &char, mode int, cb fn (req &Uv_fs_t))

pub fn fs_mkdir(loop &Uv_loop_t, req &Uv_fs_t, path &char, mode int, cb fn (req &Uv_fs_t)) {
	C.uv_fs_mkdir(loop, req, path, mode, cb)
}

fn C.uv_fs_mkdtemp(loop &Uv_loop_t, req &Uv_fs_t, const_tpl &char, cb fn (req &Uv_fs_t)) int

pub fn fs_mkdtemp(loop &Uv_loop_t, req &Uv_fs_t, const_tpl &char, cb fn (req &Uv_fs_t)) int {
	return C.uv_fs_mkdtemp(loop, req, const_tpl, cb)
}

fn C.uv_fs_mkstemp(loop &Uv_loop_t, req &Uv_fs_t, const_tpl &char, cb fn (req &Uv_fs_t)) int

pub fn fs_mkstemp(loop &Uv_loop_t, req &Uv_fs_t, const_tpl &char, flags int, cb fn (req &Uv_fs_t)) {
	C.uv_fs_mkstemp(loop, req, const_tpl, cb)
}

fn C.uv_fs_rmdir(loop &Uv_loop_t, req &Uv_fs_t, path &char, cb fn (req &Uv_fs_t))

pub fn fs_rmdir(loop &Uv_loop_t, req &Uv_fs_t, path &char, cb fn (req &Uv_fs_t)) {
	C.uv_fs_rmdir(loop, req, path, cb)
}

fn C.uv_fs_scandir(loop &Uv_loop_t, req &Uv_fs_t, path &char, flags int, cb fn (req &Uv_fs_t))

pub fn fs_scandir(loop &Uv_loop_t, req &Uv_fs_t, path &char, flags int, cb fn (req &Uv_fs_t)) {
	C.uv_fs_scandir(loop, req, path, flags, cb)
}

fn C.uv_fs_scandir_next(req &Uv_fs_t, ent &Uv_dirent_t) int

pub fn fs_scandir_next(req &Uv_fs_t, ent &Uv_dirent_t) int {
	return C.uv_fs_scandir_next(req, ent)
}

fn C.uv_fs_opendir(loop &Uv_loop_t, req &Uv_fs_t, const_path &char, cb fn (req &Uv_fs_t)) int

pub fn fs_opendir(loop &Uv_loop_t, req &Uv_fs_t, const_path &char, cb fn (req &Uv_fs_t)) int {
	return C.uv_fs_opendir(loop, req, const_path, cb)
}

fn C.uv_fs_readdir(loop &Uv_loop_t, req &Uv_fs_t, dir &Uv_dir_t, cb fn (req &Uv_fs_t)) int

pub fn fs_readdir(loop &Uv_loop_t, req &Uv_fs_t, dir &Uv_dir_t, cb fn (req &Uv_fs_t)) int {
	return C.uv_fs_readdir(loop, req, dir, cb)
}

fn C.uv_fs_closedir(loop &Uv_loop_t, req &Uv_fs_t, dir &Uv_dir_t, cb fn (req &Uv_fs_t)) int

pub fn fs_closedir(loop &Uv_loop_t, req &Uv_fs_t, dir &Uv_dir_t, cb fn (req &Uv_fs_t)) int {
	return C.uv_fs_closedir(loop, req, dir, cb)
}

fn C.uv_fs_stat(loop &Uv_loop_t, req &Uv_fs_t, path &char, cb fn (req &Uv_fs_t))

pub fn fs_stat(loop &Uv_loop_t, req &Uv_fs_t, path &char, cb fn (req &Uv_fs_t)) {
	C.uv_fs_stat(loop, req, path, cb)
}

fn C.uv_fs_fstat(loop &Uv_loop_t, req &Uv_fs_t, file int, cb fn (req &Uv_fs_t))

pub fn fs_fstat(loop &Uv_loop_t, req &Uv_fs_t, file int, cb fn (req &Uv_fs_t)) {
	C.uv_fs_fstat(loop, req, file, cb)
}

fn C.uv_fs_rename(loop &Uv_loop_t, req &Uv_fs_t, path &char, new_path &char, cb fn (req &Uv_fs_t))

pub fn fs_rename(loop &Uv_loop_t, req &Uv_fs_t, const_path &char, const_new_path &char, cb fn (req &Uv_fs_t)) {
	C.uv_fs_rename(loop, req, const_path, const_new_path, cb)
}

fn C.uv_fs_fsync(loop &Uv_loop_t, req &Uv_fs_t, file int, cb fn (req &Uv_fs_t))

pub fn fs_fsync(loop &Uv_loop_t, req &Uv_fs_t, file int, cb fn (req &Uv_fs_t)) {
	C.uv_fs_fsync(loop, req, file, cb)
}

fn C.uv_fs_fdatasync(loop &Uv_loop_t, req &Uv_fs_t, file int, cb fn (req &Uv_fs_t))

pub fn fs_fdatasync(loop &Uv_loop_t, req &Uv_fs_t, file int, cb fn (req &Uv_fs_t)) {
	C.uv_fs_fdatasync(loop, req, file, cb)
}

fn C.uv_fs_ftruncate(loop &Uv_loop_t, req &Uv_fs_t, file int, offset i64, cb fn (req &Uv_fs_t))

pub fn fs_ftruncate(loop &Uv_loop_t, req &Uv_fs_t, file int, offset i64, cb fn (req &Uv_fs_t)) {
	C.uv_fs_ftruncate(loop, req, file, offset, cb)
}

fn C.uv_fs_sendfile(loop &Uv_loop_t, req &Uv_fs_t, out_fd int, in_fd int, in_offset i64, length usize, cb fn (req &Uv_fs_t))

pub fn fs_sendfile(loop &Uv_loop_t, req &Uv_fs_t, out_fd int, in_fd int, in_offset i64, length usize, cb fn (req &Uv_fs_t)) {
	C.uv_fs_sendfile(loop, req, out_fd, in_fd, in_offset, length, cb)
}

fn C.uv_fs_access(loop &Uv_loop_t, req &Uv_fs_t, path &char, mode int, cb fn (req &Uv_fs_t))

pub fn fs_access(loop &Uv_loop_t, req &Uv_fs_t, const_path &char, mode int, cb fn (req &Uv_fs_t)) {
	C.uv_fs_access(loop, req, const_path, mode, cb)
}

fn C.uv_fs_chmod(loop &Uv_loop_t, req &Uv_fs_t, path &char, mode int, cb fn (req &Uv_fs_t))

pub fn fs_chmod(loop &Uv_loop_t, req &Uv_fs_t, const_path &char, mode int, cb fn (req &Uv_fs_t)) {
	C.uv_fs_chmod(loop, req, const_path, mode, cb)
}

fn C.uv_fs_fchmod(loop &Uv_loop_t, req &Uv_fs_t, file int, mode int, cb fn (req &Uv_fs_t))

pub fn fs_fchmod(loop &Uv_loop_t, req &Uv_fs_t, file int, mode int, cb fn (req &Uv_fs_t)) {
	C.uv_fs_fchmod(loop, req, file, mode, cb)
}

fn C.uv_fs_utime(loop &Uv_loop_t, req &Uv_fs_t, path &char, atime f64, mtime f64, cb fn (req &Uv_fs_t))

pub fn fs_utime(loop &Uv_loop_t, req &Uv_fs_t, const_path &char, atime f64, mtime f64, cb fn (req &Uv_fs_t)) {
	C.uv_fs_utime(loop, req, const_path, atime, mtime, cb)
}

fn C.uv_fs_utime_ex(loop &Uv_loop_t, req &Uv_fs_t, const_path &char, btime f64, atime f64, mtime f64, cb fn (req &Uv_fs_t)) int

pub fn fs_utime_ex(loop &Uv_loop_t, req &Uv_fs_t, const_path &char, btime f64, atime f64, mtime f64, cb fn (req &Uv_fs_t)) int {
	$if !$d('uv_static', false) {
		return C.uv_fs_utime_ex(loop, req, const_path, btime, atime, mtime, cb)
	} $else {
		panic('uv_fs_utime_ex is not available in static build')
		return -1
	}
}

fn C.uv_fs_futime(loop &Uv_loop_t, req &Uv_fs_t, file int, atime f64, mtime f64, cb fn (req &Uv_fs_t))

pub fn fs_futime(loop &Uv_loop_t, req &Uv_fs_t, file int, atime f64, mtime f64, cb fn (req &Uv_fs_t)) {
	C.uv_fs_futime(loop, req, file, atime, mtime, cb)
}

// $if $d('uv_static', false) {

// }
fn C.uv_fs_futime_ex(loop &Uv_loop_t, req &Uv_fs_t, file int, btime f64, atime f64, mtime f64, cb fn (req &Uv_fs_t)) int

pub fn fs_futime_ex(loop &Uv_loop_t, req &Uv_fs_t, file int, btime f64, atime f64, mtime f64, cb fn (req &Uv_fs_t)) int {
	$if !$d('uv_static', false) {
		return C.uv_fs_futime_ex(loop, req, file, btime, atime, mtime, cb)
	} $else {
		panic('uv_fs_futime_ex is not available in static build')
		return -1
	}
	// return C.uv_fs_futime_ex(loop, req, file, btime, atime, mtime, cb)
}

fn C.uv_fs_lutime(loop &Uv_loop_t, req &Uv_fs_t, const_path &char, atime f64, mtime f64, cb fn (req &Uv_fs_t)) int

pub fn fs_lutime(loop &Uv_loop_t, req &Uv_fs_t, const_path &char, atime f64, mtime f64, cb fn (req &Uv_fs_t)) int {
	return C.uv_fs_lutime(loop, req, const_path, atime, mtime, cb)
}

fn C.uv_fs_lstat(loop &Uv_loop_t, req &Uv_fs_t, path &char, cb fn (req &Uv_fs_t))

pub fn fs_lstat(loop &Uv_loop_t, req &Uv_fs_t, path &char, cb fn (req &Uv_fs_t)) {
	C.uv_fs_lstat(loop, req, path, cb)
}

fn C.uv_fs_link(loop &Uv_loop_t, req &Uv_fs_t, path &char, new_path &char, cb fn (req &Uv_fs_t))

pub fn fs_link(loop &Uv_loop_t, req &Uv_fs_t, const_path &char, const_new_path &char, cb fn (req &Uv_fs_t)) {
	C.uv_fs_link(loop, req, const_path, const_new_path, cb)
}

fn C.uv_fs_symlink(loop &Uv_loop_t, req &Uv_fs_t, path &char, new_path &char, flags int, cb fn (req &Uv_fs_t))

pub fn fs_symlink(loop &Uv_loop_t, req &Uv_fs_t, const_path &char, const_new_path &char, flags int, cb fn (req &Uv_fs_t)) {
	C.uv_fs_symlink(loop, req, const_path, const_new_path, flags, cb)
}

fn C.uv_fs_readlink(loop &Uv_loop_t, req &Uv_fs_t, path &char, cb fn (req &Uv_fs_t))

pub fn fs_readlink(loop &Uv_loop_t, req &Uv_fs_t, const_path &char, cb fn (req &Uv_fs_t)) {
	C.uv_fs_readlink(loop, req, const_path, cb)
}

fn C.uv_fs_realpath(loop &Uv_loop_t, req &Uv_fs_t, path &char, cb fn (req &Uv_fs_t))

pub fn fs_realpath(loop &Uv_loop_t, req &Uv_fs_t, const_path &char, cb fn (req &Uv_fs_t)) {
	C.uv_fs_realpath(loop, req, const_path, cb)
}

fn C.uv_fs_chown(loop &Uv_loop_t, req &Uv_fs_t, path &char, uid u32, gid u32, cb fn (req &Uv_fs_t))

pub fn fs_chown(loop &Uv_loop_t, req &Uv_fs_t, const_path &char, uid usize, gid usize, cb fn (req &Uv_fs_t)) {
	C.uv_fs_chown(loop, req, const_path, uid, gid, cb)
}

fn C.uv_fs_fchown(loop &Uv_loop_t, req &Uv_fs_t, file int, uid u32, gid u32, cb fn (req &Uv_fs_t))

pub fn fs_fchown(loop &Uv_loop_t, req &Uv_fs_t, file int, uid usize, gid usize, cb fn (req &Uv_fs_t)) {
	C.uv_fs_fchown(loop, req, file, uid, gid, cb)
}

fn C.uv_fs_lchown(loop &Uv_loop_t, req &Uv_fs_t, const_path &char, uid usize, gid usize, cb fn (req &Uv_fs_t)) int

pub fn fs_lchown(loop &Uv_loop_t, req &Uv_fs_t, const_path &char, uid usize, gid usize, cb fn (req &Uv_fs_t)) int {
	return C.uv_fs_lchown(loop, req, const_path, uid, gid, cb)
}

fn C.uv_fs_statfs(loop &Uv_loop_t, req &Uv_fs_t, const_path &char, cb fn (req &Uv_fs_t)) int

pub fn fs_statfs(loop &Uv_loop_t, req &Uv_fs_t, const_path &char, cb fn (req &Uv_fs_t)) {
	C.uv_fs_statfs(loop, req, const_path, cb)
}

// fs poll functions

fn C.uv_fs_poll_init(loop &Uv_loop_t, handle &Uv_fs_poll_t) int

pub fn fs_poll_init(loop &Uv_loop_t, handle &Uv_fs_poll_t) int {
	return C.uv_fs_poll_init(loop, handle)
}

fn C.uv_fs_poll_start(handle &Uv_fs_poll_t, cb fn (handle &Uv_fs_poll_t, status int, prev &Uv_stat_t, curr &Uv_stat_t), path &char, interval u32) int

pub fn fs_poll_start(handle &Uv_fs_poll_t, cb fn (handle &Uv_fs_poll_t, status int, const_prev &Uv_stat_t, const_curr &Uv_stat_t), const_path &char, interval usize) int {
	return C.uv_fs_poll_start(handle, cb, const_path, interval)
}

fn C.uv_fs_poll_stop(handle &Uv_fs_poll_t) int

pub fn fs_poll_stop(handle &Uv_fs_poll_t) int {
	return C.uv_fs_poll_stop(handle)
}

fn C.uv_fs_poll_getpath(handle &Uv_fs_poll_t, path &char, size &usize) int

pub fn fs_poll_getpath(handle &Uv_fs_poll_t, path &char, size &usize) int {
	return C.uv_fs_poll_getpath(handle, path, size)
}

// signal functions

fn C.uv_signal_init(loop &Uv_loop_t, handle &Uv_signal_t) int

pub fn signal_init(loop &Uv_loop_t, handle &Uv_signal_t) int {
	return C.uv_signal_init(loop, handle)
}

fn C.uv_signal_start(handle &Uv_signal_t, cb fn (handle &Uv_signal_t, signum int), signum int) int

pub fn signal_start(handle &Uv_signal_t, cb fn (handle &Uv_signal_t, signum int), signum int) int {
	return C.uv_signal_start(handle, cb, signum)
}

fn C.uv_signal_start_oneshot(signal &Uv_signal_t, cb fn (signal &Uv_signal_t, signum int), signum int) int

pub fn signal_start_oneshot(signal &Uv_signal_t, cb fn (signal &Uv_signal_t, signum int), signum int) int {
	return C.uv_signal_start_oneshot(signal, cb, signum)
}

fn C.uv_signal_stop(handle &Uv_signal_t) int

pub fn signal_stop(handle &Uv_signal_t) int {
	return C.uv_signal_stop(handle)
}

fn C.uv_loadavg(avg &f64)

pub fn loadavg(avg &f64) {
	C.uv_loadavg(avg)
}

// fs event functions

fn C.uv_fs_event_init(loop &Uv_loop_t, handle &Uv_fs_event_t) int

pub fn fs_event_init(loop &Uv_loop_t, handle &Uv_fs_event_t) int {
	return C.uv_fs_event_init(loop, handle)
}

fn C.uv_fs_event_start(handle &Uv_fs_event_t, cb fn (handle &Uv_fs_event_t, const_filename &char, events int, status int), const_path &char, flags int) int

pub fn fs_event_start(handle &Uv_fs_event_t, cb fn (handle &Uv_fs_event_t, const_filename &char, events int, status int), const_path &char, flags int) int {
	return C.uv_fs_event_start(handle, cb, const_path, flags)
}

fn C.uv_fs_event_stop(handle &Uv_fs_event_t) int

pub fn fs_event_stop(handle &Uv_fs_event_t) int {
	return C.uv_fs_event_stop(handle)
}

fn C.uv_fs_event_getpath(handle &Uv_fs_event_t, path &char, size &usize) int

pub fn fs_event_getpath(handle &Uv_fs_event_t, path &char, size &usize) int {
	return C.uv_fs_event_getpath(handle, path, size)
}

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

fn C.uv_random(loop &Uv_loop_t, req &Uv_random_t, buff voidptr, buflen usize, flalgs usize, cb fn (req &Uv_random_t, status int, buf voidptr, buflen usize)) int

pub fn random(loop &Uv_loop_t, req &Uv_random_t, buff voidptr, buflen usize, flalgs usize, cb fn (req &Uv_random_t, status int, buf voidptr, buflen usize)) int {
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
	$if $d('uv_static', false) {
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

fn C.uv_dlopen(const_filename &char, lib &Uv_lib_t) int

pub fn dlopen(const_filename &char, lib &Uv_lib_t) int {
	return C.uv_dlopen(const_filename, lib)
}

fn C.uv_dlclose(lib &Uv_lib_t)

pub fn dlclose(lib &Uv_lib_t) {
	C.uv_dlclose(lib)
}

fn C.uv_dlsym(lib &Uv_lib_t, const_name &char, ptr &voidptr) int

pub fn dlsym(lib &Uv_lib_t, const_name &char, ptr &voidptr) int {
	return C.uv_dlsym(lib, const_name, ptr)
}

fn C.uv_dlerror(const_lib &Uv_lib_t) &char

pub fn dlerror(const_lib &Uv_lib_t) string {
	unsafe {
		return cstring_to_vstring(C.uv_dlerror(const_lib))
	}
}

// mutex functions

fn C.uv_mutex_init(handle &Uv_mutex_t) int

pub fn mutex_init(handle &Uv_mutex_t) int {
	return C.uv_mutex_init(handle)
}

fn C.uv_mutex_init_recursive(handle &Uv_mutex_t) int

pub fn mutex_init_recursive(handle &Uv_mutex_t) int {
	return C.uv_mutex_init_recursive(handle)
}

fn C.uv_mutex_destroy(handle &Uv_mutex_t)

pub fn mutex_destroy(handle &Uv_mutex_t) {
	C.uv_mutex_destroy(handle)
}

fn C.uv_mutex_lock(handle &Uv_mutex_t)

pub fn mutex_lock(handle &Uv_mutex_t) {
	C.uv_mutex_lock(handle)
}

fn C.uv_mutex_trylock(handle &Uv_mutex_t) int

pub fn mutex_trylock(handle &Uv_mutex_t) int {
	return C.uv_mutex_trylock(handle)
}

fn C.uv_mutex_unlock(handle &Uv_mutex_t)

pub fn mutex_unlock(handle &Uv_mutex_t) {
	C.uv_mutex_unlock(handle)
}

// lock functions

fn C.uv_rwlock_init(handle &Uv_rwlock_t) int

pub fn rwlock_init(handle &Uv_rwlock_t) int {
	return C.uv_rwlock_init(handle)
}

fn C.uv_rwlock_destroy(handle &Uv_rwlock_t)

pub fn rwlock_destroy(handle &Uv_rwlock_t) {
	C.uv_rwlock_destroy(handle)
}

fn C.uv_rwlock_rdlock(handle &Uv_rwlock_t)

pub fn rwlock_rdlock(handle &Uv_rwlock_t) {
	C.uv_rwlock_rdlock(handle)
}

fn C.uv_rwlock_tryrdlock(handle &Uv_rwlock_t) int

pub fn rwlock_tryrdlock(handle &Uv_rwlock_t) int {
	return C.uv_rwlock_tryrdlock(handle)
}

fn C.uv_rwlock_rdunlock(handle &Uv_rwlock_t)

pub fn rwlock_rdunlock(handle &Uv_rwlock_t) {
	C.uv_rwlock_rdunlock(handle)
}

fn C.uv_rwlock_wrlock(handle &Uv_rwlock_t)

pub fn rwlock_wrlock(handle &Uv_rwlock_t) {
	C.uv_rwlock_wrlock(handle)
}

fn C.uv_rwlock_trywrlock(handle &Uv_rwlock_t) int

pub fn rwlock_trywrlock(handle &Uv_rwlock_t) int {
	return C.uv_rwlock_trywrlock(handle)
}

fn C.uv_rwlock_wrunlock(handle &Uv_rwlock_t)

pub fn rwlock_wrunlock(handle &Uv_rwlock_t) {
	C.uv_rwlock_wrunlock(handle)
}

// semaphore functions

fn C.uv_sem_init(sem &Uv_sem_t, value usize) int

pub fn sem_init(sem &Uv_sem_t, value usize) int {
	return C.uv_sem_init(sem, value)
}

fn C.uv_sem_destroy(sem &Uv_sem_t)

pub fn sem_destroy(sem &Uv_sem_t) {
	C.uv_sem_destroy(sem)
}

fn C.uv_sem_post(sem &Uv_sem_t)

pub fn sem_post(sem &Uv_sem_t) {
	C.uv_sem_post(sem)
}

fn C.uv_sem_wait(sem &Uv_sem_t)

pub fn sem_wait(sem &Uv_sem_t) {
	C.uv_sem_wait(sem)
}

fn C.uv_sem_trywait(sem &Uv_sem_t) int

pub fn sem_trywait(sem &Uv_sem_t) int {
	return C.uv_sem_trywait(sem)
}

// condition functions

fn C.uv_cond_init(handle &Uv_cond_t) int

pub fn cond_init(handle &Uv_cond_t) int {
	return C.uv_cond_init(handle)
}

fn C.uv_cond_destroy(handle &Uv_cond_t)

pub fn cond_destroy(handle &Uv_cond_t) {
	C.uv_cond_destroy(handle)
}

fn C.uv_cond_signal(handle &Uv_cond_t)

pub fn cond_signal(handle &Uv_cond_t) {
	C.uv_cond_signal(handle)
}

fn C.uv_cond_broadcast(handle &Uv_cond_t)

pub fn cond_broadcast(handle &Uv_cond_t) {
	C.uv_cond_broadcast(handle)
}

fn C.uv_cond_wait(handle &Uv_cond_t, mutex &Uv_mutex_t)

pub fn cond_wait(handle &Uv_cond_t, mutex &Uv_mutex_t) {
	C.uv_cond_wait(handle, mutex)
}

fn C.uv_cond_timedwait(handle &Uv_cond_t, mutex &Uv_mutex_t, timeout u64)

pub fn cond_timedwait(handle &Uv_cond_t, mutex &Uv_mutex_t, timeout u64) {
	C.uv_cond_timedwait(handle, mutex, timeout)
}

// barrier functions

fn C.uv_barrier_init(handle &Uv_barrier_t, count usize) int

pub fn barrier_init(handle &Uv_barrier_t, count usize) int {
	return C.uv_barrier_init(handle, count)
}

fn C.uv_barrier_destroy(handle &Uv_barrier_t)

pub fn barrier_destroy(handle &Uv_barrier_t) {
	C.uv_barrier_destroy(handle)
}

fn C.uv_barrier_wait(handle &Uv_barrier_t)

pub fn barrier_wait(handle &Uv_barrier_t) {
	C.uv_barrier_wait(handle)
}

fn C.uv_once(guard &Uv_once_t, cb fn ())

pub fn once(guard &Uv_once_t, cb fn ()) {
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
	$if $d('uv_static', false) {
		return C.uv_gettimeofday(&C.uv_timeval64_t(tv))
	} $else {
		// panic('uv_gettimeofday is not available in static build')
		// return -1
		return C.uv_gettimeofday(&C.uv_timeval64_t(tv))
	}
}

// key functions

fn C.uv_key_create(key &Uv_key_t) int

pub fn key_create(key &Uv_key_t) int {
	return C.uv_key_create(key)
}

fn C.uv_key_delete(key &Uv_key_t)

pub fn key_delete(key &Uv_key_t) {
	C.uv_key_delete(key)
}

fn C.uv_key_get(key &Uv_key_t) &voidptr

pub fn key_get(key &Uv_key_t) &voidptr {
	return C.uv_key_get(key)
}

fn C.uv_key_set(key &Uv_key_t, value &voidptr)

pub fn key_set(key &Uv_key_t, value &voidptr) {
	C.uv_key_set(key, value)
}

// thread functions

fn C.uv_thread_create(tid &Uv_thread_t, entry fn (arg &voidptr), arg &voidptr) int

pub fn thread_create(tid &Uv_thread_t, entry fn (arg &voidptr), arg &voidptr) int {
	return C.uv_thread_create(tid, entry, arg)
}

fn C.uv_thread_setaffinity(tid &Uv_thread_t, cpumask &char, oldmask &char, mask_size usize) int

pub fn thread_setaffinity(tid &Uv_thread_t, cpumask &char, oldmask &char, mask_size usize) int {
	return C.uv_thread_setaffinity(tid, cpumask, oldmask, mask_size)
}

fn C.uv_thread_getaffinity(tid &Uv_thread_t, cpumask &char, mask_size usize) int

pub fn thread_getaffinity(tid &Uv_thread_t, cpumask &char, mask_size usize) int {
	return C.uv_thread_getaffinity(tid, cpumask, mask_size)
}

fn C.uv_thread_getcpu() int

pub fn thread_getcpu() int {
	return C.uv_thread_getcpu()
}

fn C.uv_thread_join(tid &Uv_thread_t)

pub fn thread_join(tid &Uv_thread_t) {
	C.uv_thread_join(tid)
}

fn C.uv_thread_self() Uv_thread_t

pub fn thread_self() Uv_thread_t {
	return C.uv_thread_self()
}

fn C.uv_thread_equal(const_t1 &Uv_thread_t, const_t2 &Uv_thread_t) int

pub fn thread_equal(const_t1 &Uv_thread_t, const_t2 &Uv_thread_t) int {
	return C.uv_thread_equal(const_t1, const_t2)
}

// loop functions 2nd

fn C.uv_loop_get_data(const_loop &Uv_loop_t) &voidptr

pub fn loop_get_data(const_loop &Uv_loop_t) &voidptr {
	return C.uv_loop_get_data(const_loop)
}

fn C.uv_loop_set_data(loop &Uv_loop_t, data &voidptr)

pub fn loop_set_data(loop &Uv_loop_t, data &voidptr) {
	C.uv_loop_set_data(loop, data)
}

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
