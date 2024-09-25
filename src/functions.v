module main

pub fn loop_new() &C.uv_loop_t {
	return C.uv_loop_new()
}

pub fn loop_delete(loop &C.uv_loop_t) {
	C.uv_loop_delete(loop)
}

pub fn run(loop &C.uv_loop_t, mode Mode) int {
	return C.uv_run(loop, mode)
}

pub fn loop_init(loop &C.uv_loop_t) int {
	return C.uv_loop_init(loop)
}

pub fn loop_close(loop &C.uv_loop_t) int {
	return C.uv_loop_close(loop)
}

pub fn default_loop() &C.uv_loop_t {
	return C.uv_default_loop()
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

pub fn has_ref(handle &C.uv_handle_t) int {
	return C.uv_has_ref(handle)
}

pub fn update_time(loop &C.uv_loop_t) {
	C.uv_update_time(loop)
}

pub fn now(loop &C.uv_loop_t) u64 {
	return C.uv_now(loop)
}

pub fn backend_fd(loop &C.uv_loop_t) int {
	return C.uv_backend_fd(loop)
}

pub fn backend_timeout(loop &C.uv_loop_t) int {
	return C.uv_backend_timeout(loop)
}

pub fn walk(loop &C.uv_loop_t, walk_cb fn (handle &C.uv_handle_t, arg voidptr), arg voidptr) {
	C.uv_walk(loop, walk_cb, arg)
}

pub fn loop_size() usize {
	return C.uv_loop_size()
}

pub fn handle_size(handle_type Uv_handle_type, size int) usize {
	return C.uv_handle_size(handle_type, size)
}

pub fn req_size(req_type Uv_req_type, size int) usize {
	return C.uv_req_size(req_type, size)
}

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

// pipe functions

pub fn pipe_init(loop &C.uv_loop_t, handle &C.uv_pipe_t, ipc int) int {
	return C.uv_pipe_init(loop, handle, ipc)
}

pub fn pipe_open(handle &C.uv_pipe_t, file int) int {
	return C.uv_pipe_open(handle, file)
}

pub fn pipe_bind(handle &C.uv_pipe_t, name &char) int {
	return C.uv_pipe_bind(handle, name)
}

pub fn pipe_connect(req &C.uv_connect_t, handle &C.uv_pipe_t, name &char, cb fn (req &C.uv_connect_t, status int)) int {
	return C.uv_pipe_connect(req, handle, name, cb)
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

// tty functions

pub fn tty_init(loop &C.uv_loop_t, handle &C.uv_tty_t, fd int, readable int) int {
	return C.uv_tty_init(loop, handle, fd, readable)
}

pub fn tty_set_mode(handle &C.uv_tty_t, mode int) int {
	return C.uv_tty_set_mode(handle, mode)
}

pub fn tty_reset_mode() int {
	return C.uv_tty_reset_mode()
}

pub fn tty_get_winsize(handle &C.uv_tty_t, width &int, height &int) int {
	return C.uv_tty_get_winsize(handle, width, height)
}

// tcp functions

pub fn tcp_init(loop &C.uv_loop_t, handle &C.uv_tcp_t) int {
	return C.uv_tcp_init(loop, handle)
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

pub fn tcp_bind(handle &C.uv_tcp_t, addr &C.sockaddr, flags int) int {
	return C.uv_tcp_bind(handle, addr, flags)
}

// TODO maybe need to change namelen to usize or isize
pub fn tcp_getsockname(handle &C.uv_tcp_t, name &C.sockaddr, namelen &int) int {
	return C.uv_tcp_getsockname(handle, name, namelen)
}

pub fn tcp_getpeername(handle &C.uv_tcp_t, name &C.sockaddr, namelen &int) int {
	return C.uv_tcp_getpeername(handle, name, namelen)
}

pub fn tcp_connect(req &C.uv_connect_t, handle &C.uv_tcp_t, addr &C.sockaddr, cb fn (req &C.uv_connect_t, status int)) int {
	return C.uv_tcp_connect(req, handle, addr, cb)
}

// udp functions

pub fn udp_init(loop &C.uv_loop_t, handle &C.uv_udp_t) int {
	return C.uv_udp_init(loop, handle)
}

pub fn udp_open(handle &C.uv_udp_t, sock int) int {
	return C.uv_udp_open(handle, sock)
}

pub fn udp_bind(handle &C.uv_udp_t, addr &C.sockaddr, flags int) int {
	return C.uv_udp_bind(handle, addr, flags)
}

pub fn udp_getsockname(handle &C.uv_udp_t, name &C.sockaddr, namelen &int) int {
	return C.uv_udp_getsockname(handle, name, namelen)
}

pub fn udp_set_membership(handle &C.uv_udp_t, multicast_addr &char, interface_addr &char, membership Uv_membership) int {
	return C.uv_udp_set_membership(handle, multicast_addr, interface_addr, membership)
}

pub fn udp_set_multicast_loop(handle &C.uv_udp_t, on int) int {
	return C.uv_udp_set_multicast_loop(handle, on)
}

pub fn udp_set_multicast_ttl(handle &C.uv_udp_t, ttl int) int {
	return C.uv_udp_set_multicast_ttl(handle, ttl)
}

pub fn udp_set_multicast_interface(handle &C.uv_udp_t, interface_addr &char) int {
	return C.uv_udp_set_multicast_interface(handle, interface_addr)
}

pub fn udp_set_broadcast(handle &C.uv_udp_t, on int) int {
	return C.uv_udp_set_broadcast(handle, on)
}

pub fn udp_set_ttl(handle &C.uv_udp_t, ttl int) int {
	return C.uv_udp_set_ttl(handle, ttl)
}

pub fn udp_send(req &C.uv_udp_send_t, handle &C.uv_udp_t, bufs &C.uv_buf_t, nbufs u32, addr &C.sockaddr, cb fn (req &C.uv_udp_send_t, status int)) int {
	return C.uv_udp_send(req, handle, bufs, nbufs, addr, cb)
}

pub fn udp_recv_start(handle &C.uv_udp_t, alloc_cb fn (handle &C.uv_handle_t, suggested_size usize, buf &C.uv_buf_t), recv_cb fn (handle &C.uv_udp_t, nread isize, buf &C.uv_buf_t, addr &C.sockaddr, flags u32)) int {
	return C.uv_udp_recv_start(handle, alloc_cb, recv_cb)
}

pub fn udp_recv_stop(handle &C.uv_udp_t) int {
	return C.uv_udp_recv_stop(handle)
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

pub fn replace_allocator(malloc_cb fn (isize) &u8, realloc_cb fn (&u8, isize) &u8, calloc_cb fn (isize, isize) &u8, free_cb fn (voidptr) voidptr) int {
	return C.uv_replace_allocator(malloc_cb, realloc_cb, calloc_cb, free_cb)
 }
