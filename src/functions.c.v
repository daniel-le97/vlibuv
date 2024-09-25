module main

fn C.uv_loop_new() &C.uv_loop_t
fn C.uv_loop_delete(loop &C.uv_loop_t)
fn C.uv_run(loop &C.uv_loop_t, mode Mode) int
fn C.uv_loop_init(loop &C.uv_loop_t) int
fn C.uv_loop_close(loop &C.uv_loop_t) int
fn C.uv_default_loop() &C.uv_loop_t
fn C.uv_stop(loop &C.uv_loop_t)
fn C.uv_ref(handle &C.uv_handle_t)
fn C.uv_unref(handle &C.uv_handle_t)
fn C.uv_has_ref(handle &C.uv_handle_t) int
fn C.uv_update_time(loop &C.uv_loop_t)
fn C.uv_now(loop &C.uv_loop_t) u64
fn C.uv_backend_fd(loop &C.uv_loop_t) int
fn C.uv_backend_timeout(loop &C.uv_loop_t) int
fn C.uv_walk(loop &C.uv_loop_t, walk_cb fn (handle &C.uv_handle_t, arg voidptr), arg voidptr)
fn C.uv_loop_size() usize
fn C.uv_handle_size(Uv_handle_type, int) usize
fn C.uv_req_size(Uv_req_type, int) usize

fn C.uv_timer_init(loop &C.uv_loop_t, handle &C.uv_timer_t) int
fn C.uv_timer_start(handle &C.uv_timer_t, cb fn (handle &C.uv_timer_t), timeout u64, repeat u64) int
fn C.uv_timer_stop(handle &C.uv_timer_t) int
fn C.uv_timer_again(handle &C.uv_timer_t) int
fn C.uv_timer_set_repeat(handle &C.uv_timer_t, repeat u64)
fn C.uv_timer_get_repeat(handle &C.uv_timer_t) u64

fn C.uv_poll_init(loop &C.uv_loop_t, handle &C.uv_poll_t, fd int) int
fn C.uv_poll_start(handle &C.uv_poll_t, events int, cb fn (handle &C.uv_poll_t, status int, events int)) int
fn C.uv_poll_stop(handle &C.uv_poll_t) int

fn C.uv_signal_init(loop &C.uv_loop_t, handle &C.uv_signal_t) int
fn C.uv_signal_start(handle &C.uv_signal_t, cb fn (handle &C.uv_signal_t, signum int), signum int) int
fn C.uv_signal_stop(handle &C.uv_signal_t) int

fn C.uv_prepare_init(loop &C.uv_loop_t, handle &C.uv_prepare_t) int
fn C.uv_prepare_start(handle &C.uv_prepare_t, cb fn (handle &C.uv_prepare_t)) int
fn C.uv_prepare_stop(handle &C.uv_prepare_t) int

fn C.uv_check_init(loop &C.uv_loop_t, handle &C.uv_check_t) int
fn C.uv_check_start(handle &C.uv_check_t, cb fn (handle &C.uv_check_t)) int
fn C.uv_check_stop(handle &C.uv_check_t) int

fn C.uv_idle_init(loop &C.uv_loop_t, handle &C.uv_idle_t) int
fn C.uv_idle_start(handle &C.uv_idle_t, cb fn (handle &C.uv_idle_t)) int
fn C.uv_idle_stop(handle &C.uv_idle_t) int

fn C.uv_async_init(loop &C.uv_loop_t, handle &C.uv_async_t, cb fn (handle &C.uv_async_t)) int
fn C.uv_async_send(handle &C.uv_async_t) int

fn C.uv_getaddrinfo(loop &C.uv_loop_t, req &C.uv_getaddrinfo_t, cb fn (req &C.uv_getaddrinfo_t, status int, res &C.addrinfo), node &char, service &char, hints &C.addrinfo) int
fn C.uv_freeaddrinfo(addr &C.addrinfo)
fn C.uv_ip4_addr(&char, int, &C.sockaddr) int

fn C.uv_spawn(loop &C.uv_loop_t, handle &C.uv_process_t, options &C.uv_process_options_t) int
fn C.uv_process_kill(handle &C.uv_process_t, signum int) int
fn C.uv_kill(pid int, signum int) int

fn C.uv_pipe_init(loop &C.uv_loop_t, handle &C.uv_pipe_t, ipc int) int
fn C.uv_pipe_open(handle &C.uv_pipe_t, file int) int
fn C.uv_pipe_bind(handle &C.uv_pipe_t, name &char) int
fn C.uv_pipe_connect(req &C.uv_connect_t, handle &C.uv_pipe_t, name &char, cb fn (req &C.uv_connect_t, status int))
fn C.uv_pipe_getsockname(handle &C.uv_pipe_t, buffer &char, size &usize) int
fn C.uv_pipe_getpeername(handle &C.uv_pipe_t, buffer &char, size &usize) int
fn C.uv_pipe_pending_instances(handle &C.uv_pipe_t, count int)
fn C.uv_pipe_pending_count(handle &C.uv_pipe_t) int
fn C.uv_pipe_pending_type(handle &C.uv_pipe_t) int
fn C.uv_pipe_chmod(handle &C.uv_pipe_t, flags int) int

fn C.uv_tty_init(loop &C.uv_loop_t, handle &C.uv_tty_t, fd int, readable int) int
fn C.uv_tty_set_mode(handle &C.uv_tty_t, mode int) int
fn C.uv_tty_reset_mode() int
fn C.uv_tty_get_winsize(handle &C.uv_tty_t, width &int, height &int) int


// needed still, skipped to tcp
fn C.uv_guess_handle(file int) int
fn C.uv_handle_size(type, int) usize
fn C.uv_req_size(type, int) usize
fn C.uv_is_active(handle &C.uv_handle_t) int
fn C.uv_is_closing(handle &C.uv_handle_t) int
fn C.uv_close(handle &C.uv_handle_t, close_cb fn (handle &C.uv_handle_t))
fn C.uv_send_buffer_size(handle &C.uv_handle_t, value &int) int
fn C.uv_recv_buffer_size(handle &C.uv_handle_t, value &int) int
fn C.uv_fileno(handle &C.uv_handle_t, fd &int) int
fn C.uv_buf_init(base &char, len usize) C.uv_buf_t
fn C.uv_listen(stream &C.uv_stream_t, backlog int, cb fn (server &C.uv_stream_t, status int)) int
fn C.uv_accept(server &C.uv_stream_t, client &C.uv_stream_t) int
fn C.uv_read_start(stream &C.uv_stream_t, alloc_cb fn (handle &C.uv_handle_t, suggested_size usize, buf &C.uv_buf_t), read_cb fn (stream &C.uv_stream_t, nread isize, buf &C.uv_buf_t)) int
fn C.uv_read_stop(stream &C.uv_stream_t) int
fn C.uv_write(req &C.uv_write_t, handle &C.uv_stream_t, bufs &C.uv_buf_t, nbufs u32, cb fn (req &C.uv_write_t, status int)) int
fn C.uv_shutdown(req &C.uv_shutdown_t, handle &C.uv_stream_t, cb fn (req &C.uv_shutdown_t, status int)) int

fn C.uv_tcp_init(loop &C.uv_loop_t, handle &C.uv_tcp_t) int
fn C.uv_tcp_open(handle &C.uv_tcp_t, sock int) int
fn C.uv_tcp_nodelay(handle &C.uv_tcp_t, enable int) int
fn C.uv_tcp_keepalive(handle &C.uv_tcp_t, enable int, delay u32) int
fn C.uv_tcp_simultaneous_accepts(handle &C.uv_tcp_t, enable int) int
fn C.uv_tcp_bind(handle &C.uv_tcp_t, addr &C.sockaddr, flags u32) int
fn C.uv_tcp_getsockname(handle &C.uv_tcp_t, name &C.sockaddr, namelen &int) int
fn C.uv_tcp_getpeername(handle &C.uv_tcp_t, name &C.sockaddr, namelen &int) int
fn C.uv_tcp_connect(req &C.uv_connect_t, handle &C.uv_tcp_t, addr &C.sockaddr, cb fn (req &C.uv_connect_t, status int)) int

fn C.uv_udp_init(loop &C.uv_loop_t, handle &C.uv_udp_t) int
fn C.uv_udp_open(handle &C.uv_udp_t, sock int) int
fn C.uv_udp_bind(handle &C.uv_udp_t, addr &C.sockaddr, flags u32) int
fn C.uv_udp_getsockname(handle &C.uv_udp_t, name &C.sockaddr, namelen &int) int
fn C.uv_udp_set_membership(handle &C.uv_udp_t, multicast_addr &char, interface_addr &char, membership Uv_membership) int
fn C.uv_udp_set_multicast_loop(handle &C.uv_udp_t, on int) int
fn C.uv_udp_set_multicast_ttl(handle &C.uv_udp_t, ttl int) int
fn C.uv_udp_set_multicast_interface(handle &C.uv_udp_t, interface_addr &char) int
fn C.uv_udp_set_broadcast(handle &C.uv_udp_t, on int) int
fn C.uv_udp_set_ttl(handle &C.uv_udp_t, ttl int) int
fn C.uv_udp_send(req &C.uv_udp_send_t, handle &C.uv_udp_t, bufs &C.uv_buf_t, nbufs u32, addr &C.sockaddr, cb fn (req &C.uv_udp_send_t, status int)) int
fn C.uv_udp_recv_start(handle &C.uv_udp_t, alloc_cb fn (handle &C.uv_handle_t, suggested_size usize, buf &C.uv_buf_t), recv_cb fn (handle &C.uv_udp_t, nread isize, buf &C.uv_buf_t, addr &C.sockaddr, flags u32)) int
fn C.uv_udp_recv_stop(handle &C.uv_udp_t) int

fn C.uv_fs_open(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, flags int, mode int, cb fn (req &C.uv_fs_t))
fn C.uv_fs_close(loop &C.uv_loop_t, req &C.uv_fs_t, file int, cb fn (req &C.uv_fs_t))
fn C.uv_fs_read(loop &C.uv_loop_t, req &C.uv_fs_t, file int, bufs &C.uv_buf_t, nbufs u32, offset i64, cb fn (req &C.uv_fs_t))
fn C.uv_fs_write(loop &C.uv_loop_t, req &C.uv_fs_t, file int, bufs &C.uv_buf_t, nbufs u32, offset i64, cb fn (req &C.uv_fs_t))
fn C.uv_fs_unlink(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, cb fn (req &C.uv_fs_t))
fn C.uv_fs_mkdir(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, mode int, cb fn (req &C.uv_fs_t))
fn C.uv_fs_rmdir(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, cb fn (req &C.uv_fs_t))
fn C.uv_fs_scandir(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, flags int, cb fn (req &C.uv_fs_t))
fn C.uv_fs_scandir_next(req &C.uv_fs_t, ent &C.uv_dirent_t) int
fn C.uv_fs_stat(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, cb fn (req &C.uv_fs_t))
fn C.uv_fs_fstat(loop &C.uv_loop_t, req &C.uv_fs_t, file int, cb fn (req &C.uv_fs_t))
fn C.uv_fs_rename(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, new_path &char, cb fn (req &C.uv_fs_t))
fn C.uv_fs_fsync(loop &C.uv_loop_t, req &C.uv_fs_t, file int, cb fn (req &C.uv_fs_t))
fn C.uv_fs_fdatasync(loop &C.uv_loop_t, req &C.uv_fs_t, file int, cb fn (req &C.uv_fs_t))
fn C.uv_fs_ftruncate(loop &C.uv_loop_t, req &C.uv_fs_t, file int, offset i64, cb fn (req &C.uv_fs_t))
fn C.uv_fs_sendfile(loop &C.uv_loop_t, req &C.uv_fs_t, out_fd int, in_fd int, in_offset i64, length usize, cb fn (req &C.uv_fs_t))
fn C.uv_fs_access(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, mode int, cb fn (req &C.uv_fs_t))
fn C.uv_fs_chmod(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, mode int, cb fn (req &C.uv_fs_t))
fn C.uv_fs_fchmod(loop &C.uv_loop_t, req &C.uv_fs_t, file int, mode int, cb fn (req &C.uv_fs_t))
fn C.uv_fs_utime(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, atime f64, mtime f64, cb fn (req &C.uv_fs_t))
fn C.uv_fs_futime(loop &C.uv_loop_t, req &C.uv_fs_t, file int, atime f64, mtime f64, cb fn (req &C.uv_fs_t))
fn C.uv_fs_lstat(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, cb fn (req &C.uv_fs_t))
fn C.uv_fs_link(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, new_path &char, cb fn (req &C.uv_fs_t))
fn C.uv_fs_symlink(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, new_path &char, flags int, cb fn (req &C.uv_fs_t))
fn C.uv_fs_readlink(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, cb fn (req &C.uv_fs_t))
fn C.uv_fs_realpath(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, cb fn (req &C.uv_fs_t))
fn C.uv_fs_chown(loop &C.uv_loop_t, req &C.uv_fs_t, path &char, uid u32, gid u32, cb fn (req &C.uv_fs_t))
fn C.uv_fs_fchown(loop &C.uv_loop_t, req &C.uv_fs_t, file int, uid u32, gid u32, cb fn (req &C.uv_fs_t))
fn C.uv_fs_event_init(loop &C.uv_loop_t, handle &C.uv_fs_event_t) int
fn C.uv_fs_event_start(handle &C.uv_fs_event_t, cb fn (handle &C.uv_fs_event_t, filename &char, events int, status int), path &&char, flags int) int
fn C.uv_fs_event_stop(handle &C.uv_fs_event_t) int
fn C.uv_fs_poll_init(loop &C.uv_loop_t, handle &C.uv_fs_poll_t) int
fn C.uv_fs_poll_start(handle &C.uv_fs_poll_t, cb fn (handle &C.uv_fs_poll_t, status int, prev &C.uv_stat_t, curr &C.uv_stat_t), path &char, interval u32) int
fn C.uv_fs_poll_stop(handle &C.uv_fs_poll_t) int



fn C.uv_queue_work(loop &C.uv_loop_t, work &C.uv_work_t, work_cb fn (work &C.uv_work_t), after_work_cb fn (work &C.uv_work_t, status int))

fn C.uv_replace_allocator(fn (isize) &u8, fn (&u8, isize) &u8, fn (isize, isize) &u8, fn (voidptr) voidptr) int
