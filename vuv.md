# module vuv


## Contents
- [accept](#accept)
- [async_init](#async_init)
- [async_send](#async_send)
- [available_parallelism](#available_parallelism)
- [backend_fd](#backend_fd)
- [backend_timeout](#backend_timeout)
- [barrier_destroy](#barrier_destroy)
- [barrier_init](#barrier_init)
- [barrier_wait](#barrier_wait)
- [buf_init](#buf_init)
- [cancel](#cancel)
- [chdir](#chdir)
- [check_init](#check_init)
- [check_start](#check_start)
- [check_stop](#check_stop)
- [clock_gettime](#clock_gettime)
- [close](#close)
- [cond_broadcast](#cond_broadcast)
- [cond_destroy](#cond_destroy)
- [cond_init](#cond_init)
- [cond_signal](#cond_signal)
- [cond_timedwait](#cond_timedwait)
- [cond_wait](#cond_wait)
- [cpu_info](#cpu_info)
- [cpumask_size](#cpumask_size)
- [cwd](#cwd)
- [default_loop](#default_loop)
- [disable_stdio_inheritance](#disable_stdio_inheritance)
- [err_name](#err_name)
- [err_name_r](#err_name_r)
- [exepath](#exepath)
- [fileno](#fileno)
- [free_cpu_info](#free_cpu_info)
- [free_interface_addresses](#free_interface_addresses)
- [freeaddrinfo](#freeaddrinfo)
- [fs_access](#fs_access)
- [fs_chmod](#fs_chmod)
- [fs_chown](#fs_chown)
- [fs_close](#fs_close)
- [fs_closedir](#fs_closedir)
- [fs_copyfile](#fs_copyfile)
- [fs_event_getpath](#fs_event_getpath)
- [fs_event_init](#fs_event_init)
- [fs_event_start](#fs_event_start)
- [fs_event_stop](#fs_event_stop)
- [fs_fchmod](#fs_fchmod)
- [fs_fchown](#fs_fchown)
- [fs_fdatasync](#fs_fdatasync)
- [fs_fstat](#fs_fstat)
- [fs_fsync](#fs_fsync)
- [fs_ftruncate](#fs_ftruncate)
- [fs_futime](#fs_futime)
- [fs_futime_ex](#fs_futime_ex)
- [fs_get_path](#fs_get_path)
- [fs_get_ptr](#fs_get_ptr)
- [fs_get_result](#fs_get_result)
- [fs_get_system_error](#fs_get_system_error)
- [fs_get_type](#fs_get_type)
- [fs_lchown](#fs_lchown)
- [fs_link](#fs_link)
- [fs_lstat](#fs_lstat)
- [fs_lutime](#fs_lutime)
- [fs_mkdir](#fs_mkdir)
- [fs_mkdtemp](#fs_mkdtemp)
- [fs_mkstemp](#fs_mkstemp)
- [fs_open](#fs_open)
- [fs_opendir](#fs_opendir)
- [fs_poll_getpath](#fs_poll_getpath)
- [fs_poll_init](#fs_poll_init)
- [fs_poll_start](#fs_poll_start)
- [fs_poll_stop](#fs_poll_stop)
- [fs_read](#fs_read)
- [fs_readdir](#fs_readdir)
- [fs_readlink](#fs_readlink)
- [fs_realpath](#fs_realpath)
- [fs_rename](#fs_rename)
- [fs_req_cleanup](#fs_req_cleanup)
- [fs_rmdir](#fs_rmdir)
- [fs_scandir](#fs_scandir)
- [fs_scandir_next](#fs_scandir_next)
- [fs_sendfile](#fs_sendfile)
- [fs_stat](#fs_stat)
- [fs_statfs](#fs_statfs)
- [fs_symlink](#fs_symlink)
- [fs_unlink](#fs_unlink)
- [fs_utime](#fs_utime)
- [fs_utime_ex](#fs_utime_ex)
- [fs_write](#fs_write)
- [get_available_memory](#get_available_memory)
- [get_constrained_memory](#get_constrained_memory)
- [get_free_memory](#get_free_memory)
- [get_osfhandle](#get_osfhandle)
- [get_process_title](#get_process_title)
- [get_total_memory](#get_total_memory)
- [getaddrinfo](#getaddrinfo)
- [getnameinfo](#getnameinfo)
- [getrusage](#getrusage)
- [gettimeofday](#gettimeofday)
- [guess_handle](#guess_handle)
- [handle_get_data](#handle_get_data)
- [handle_get_loop](#handle_get_loop)
- [handle_get_type](#handle_get_type)
- [handle_set_data](#handle_set_data)
- [handle_size](#handle_size)
- [handle_type_name](#handle_type_name)
- [has_ref](#has_ref)
- [hrtime](#hrtime)
- [idle_init](#idle_init)
- [idle_start](#idle_start)
- [idle_stop](#idle_stop)
- [if_indextoiid](#if_indextoiid)
- [if_indextoname](#if_indextoname)
- [inet_ntop](#inet_ntop)
- [inet_pton](#inet_pton)
- [interface_addresses](#interface_addresses)
- [ip4_addr](#ip4_addr)
- [ip4_name](#ip4_name)
- [ip_name](#ip_name)
- [is_active](#is_active)
- [is_closing](#is_closing)
- [is_readable](#is_readable)
- [is_writable](#is_writable)
- [key_create](#key_create)
- [key_delete](#key_delete)
- [key_get](#key_get)
- [key_set](#key_set)
- [kill](#kill)
- [library_shutdown](#library_shutdown)
- [listen](#listen)
- [loadavg](#loadavg)
- [loop_alive](#loop_alive)
- [loop_close](#loop_close)
- [loop_configure](#loop_configure)
- [loop_delete](#loop_delete)
- [loop_fork](#loop_fork)
- [loop_get_data](#loop_get_data)
- [loop_init](#loop_init)
- [loop_new](#loop_new)
- [loop_set_data](#loop_set_data)
- [loop_size](#loop_size)
- [metrics_idle_time](#metrics_idle_time)
- [metrics_info](#metrics_info)
- [mutex_destroy](#mutex_destroy)
- [mutex_init](#mutex_init)
- [mutex_init_recursive](#mutex_init_recursive)
- [mutex_lock](#mutex_lock)
- [mutex_trylock](#mutex_trylock)
- [mutex_unlock](#mutex_unlock)
- [now](#now)
- [once](#once)
- [os_environ](#os_environ)
- [os_free_environ](#os_free_environ)
- [os_free_group](#os_free_group)
- [os_free_passwd](#os_free_passwd)
- [os_get_group](#os_get_group)
- [os_get_passwd](#os_get_passwd)
- [os_get_passwd2](#os_get_passwd2)
- [os_getenv](#os_getenv)
- [os_gethostname](#os_gethostname)
- [os_getpid](#os_getpid)
- [os_getppid](#os_getppid)
- [os_getpriority](#os_getpriority)
- [os_homedir](#os_homedir)
- [os_setenv](#os_setenv)
- [os_setpriority](#os_setpriority)
- [os_tmpdir](#os_tmpdir)
- [os_uname](#os_uname)
- [os_unsetenv](#os_unsetenv)
- [pipe_bind](#pipe_bind)
- [pipe_bind2](#pipe_bind2)
- [pipe_chmod](#pipe_chmod)
- [pipe_connect](#pipe_connect)
- [pipe_getpeername](#pipe_getpeername)
- [pipe_getsockname](#pipe_getsockname)
- [pipe_init](#pipe_init)
- [pipe_open](#pipe_open)
- [pipe_pending_count](#pipe_pending_count)
- [pipe_pending_instances](#pipe_pending_instances)
- [pipe_pending_type](#pipe_pending_type)
- [poll_init](#poll_init)
- [poll_start](#poll_start)
- [poll_stop](#poll_stop)
- [prepare_init](#prepare_init)
- [prepare_start](#prepare_start)
- [prepare_stop](#prepare_stop)
- [print_active_handles](#print_active_handles)
- [print_all_handles](#print_all_handles)
- [process_kill](#process_kill)
- [queue_work](#queue_work)
- [random](#random)
- [read_start](#read_start)
- [read_stop](#read_stop)
- [recv_buffer_size](#recv_buffer_size)
- [ref](#ref)
- [replace_allocator](#replace_allocator)
- [req_get_data](#req_get_data)
- [req_get_type](#req_get_type)
- [req_set_data](#req_set_data)
- [req_size](#req_size)
- [req_type_name](#req_type_name)
- [resident_set_memory](#resident_set_memory)
- [run](#run)
- [rwlock_destroy](#rwlock_destroy)
- [rwlock_init](#rwlock_init)
- [rwlock_rdlock](#rwlock_rdlock)
- [rwlock_rdunlock](#rwlock_rdunlock)
- [rwlock_tryrdlock](#rwlock_tryrdlock)
- [rwlock_trywrlock](#rwlock_trywrlock)
- [rwlock_wrlock](#rwlock_wrlock)
- [rwlock_wrunlock](#rwlock_wrunlock)
- [sem_destroy](#sem_destroy)
- [sem_init](#sem_init)
- [sem_post](#sem_post)
- [sem_trywait](#sem_trywait)
- [sem_wait](#sem_wait)
- [send_buffer_size](#send_buffer_size)
- [set_process_title](#set_process_title)
- [setup_args](#setup_args)
- [shutdown](#shutdown)
- [signal_init](#signal_init)
- [signal_start](#signal_start)
- [signal_start_oneshot](#signal_start_oneshot)
- [signal_stop](#signal_stop)
- [sleep](#sleep)
- [stop](#stop)
- [stream_get_write_queue_size](#stream_get_write_queue_size)
- [stream_set_blocking](#stream_set_blocking)
- [strerror](#strerror)
- [tcp_bind](#tcp_bind)
- [tcp_connect](#tcp_connect)
- [tcp_getpeername](#tcp_getpeername)
- [tcp_getsockname](#tcp_getsockname)
- [tcp_init](#tcp_init)
- [tcp_init_ex](#tcp_init_ex)
- [tcp_keepalive](#tcp_keepalive)
- [tcp_nodelay](#tcp_nodelay)
- [tcp_open](#tcp_open)
- [tcp_simultaneous_accepts](#tcp_simultaneous_accepts)
- [thread_create](#thread_create)
- [thread_equal](#thread_equal)
- [thread_getaffinity](#thread_getaffinity)
- [thread_getcpu](#thread_getcpu)
- [thread_getpriority](#thread_getpriority)
- [thread_join](#thread_join)
- [thread_self](#thread_self)
- [thread_setaffinity](#thread_setaffinity)
- [thread_setpriority](#thread_setpriority)
- [timer_again](#timer_again)
- [timer_get_due_in](#timer_get_due_in)
- [timer_get_repeat](#timer_get_repeat)
- [timer_init](#timer_init)
- [timer_set_repeat](#timer_set_repeat)
- [timer_start](#timer_start)
- [timer_stop](#timer_stop)
- [translate_sys_error](#translate_sys_error)
- [try_write](#try_write)
- [try_write2](#try_write2)
- [tty_get_vterm_state](#tty_get_vterm_state)
- [tty_get_winsize](#tty_get_winsize)
- [tty_init](#tty_init)
- [tty_reset_mode](#tty_reset_mode)
- [tty_set_mode](#tty_set_mode)
- [udp_bind](#udp_bind)
- [udp_connect](#udp_connect)
- [udp_get_send_queue_count](#udp_get_send_queue_count)
- [udp_get_send_queue_size](#udp_get_send_queue_size)
- [udp_getpeername](#udp_getpeername)
- [udp_getsockname](#udp_getsockname)
- [udp_init](#udp_init)
- [udp_init_ex](#udp_init_ex)
- [udp_open](#udp_open)
- [udp_recv_start](#udp_recv_start)
- [udp_recv_stop](#udp_recv_stop)
- [udp_send](#udp_send)
- [udp_set_broadcast](#udp_set_broadcast)
- [udp_set_membership](#udp_set_membership)
- [udp_set_multicast_interface](#udp_set_multicast_interface)
- [udp_set_multicast_loop](#udp_set_multicast_loop)
- [udp_set_multicast_ttl](#udp_set_multicast_ttl)
- [udp_set_source_membership](#udp_set_source_membership)
- [udp_set_ttl](#udp_set_ttl)
- [udp_try_send](#udp_try_send)
- [udp_using_recvmmsg](#udp_using_recvmmsg)
- [unref](#unref)
- [update_time](#update_time)
- [uptime](#uptime)
- [utf16_length_as_wtf8](#utf16_length_as_wtf8)
- [utf16_to_wtf8](#utf16_to_wtf8)
- [uv_spawn](#uv_spawn)
- [version](#version)
- [version_string](#version_string)
- [walk](#walk)
- [write](#write)
- [write2](#write2)
- [Uv_loop_t.new](#Uv_loop_t.new)
- [AfterWork_cb](#AfterWork_cb)
- [Alloc_cb](#Alloc_cb)
- [Async_cb](#Async_cb)
- [Calloc_fn](#Calloc_fn)
- [Check_cb](#Check_cb)
- [Close_cb](#Close_cb)
- [Connect_cb](#Connect_cb)
- [Connection_cb](#Connection_cb)
- [Exit_cb](#Exit_cb)
- [Free_fn](#Free_fn)
- [FsEvent_cb](#FsEvent_cb)
- [FsPoll_cb](#FsPoll_cb)
- [Fs_cb](#Fs_cb)
- [Getaddrinfo_cb](#Getaddrinfo_cb)
- [Getnameinfo_cb](#Getnameinfo_cb)
- [Idle_cb](#Idle_cb)
- [Malloc_fn](#Malloc_fn)
- [Poll_cb](#Poll_cb)
- [Prepare_cb](#Prepare_cb)
- [Random_cb](#Random_cb)
- [Read_cb](#Read_cb)
- [Realloc_fn](#Realloc_fn)
- [Shutdown_cb](#Shutdown_cb)
- [Signal_cb](#Signal_cb)
- [Sockaddr](#Sockaddr)
- [Sockaddr_in](#Sockaddr_in)
- [Timer_cb](#Timer_cb)
- [Udp_recv_cb](#Udp_recv_cb)
- [Udp_send_cb](#Udp_send_cb)
- [Uv_async_t](#Uv_async_t)
- [Uv_buf_t](#Uv_buf_t)
- [Uv_check_t](#Uv_check_t)
- [Uv_connect_t](#Uv_connect_t)
- [Uv_cpu_info_t](#Uv_cpu_info_t)
- [Uv_dir_t](#Uv_dir_t)
- [Uv_dirent_t](#Uv_dirent_t)
- [Uv_env_item_t](#Uv_env_item_t)
- [Uv_fs_event_t](#Uv_fs_event_t)
- [Uv_fs_poll_t](#Uv_fs_poll_t)
- [Uv_fs_t](#Uv_fs_t)
- [Uv_getaddrinfo_t](#Uv_getaddrinfo_t)
- [Uv_getnameinfo_t](#Uv_getnameinfo_t)
- [Uv_group_t](#Uv_group_t)
- [Uv_handle_t](#Uv_handle_t)
- [Uv_idle_t](#Uv_idle_t)
- [Uv_interface_address_t](#Uv_interface_address_t)
- [Uv_loop_t](#Uv_loop_t)
- [Uv_metrics_t](#Uv_metrics_t)
- [Uv_passwd_t](#Uv_passwd_t)
- [Uv_pipe_t](#Uv_pipe_t)
- [Uv_poll_t](#Uv_poll_t)
- [Uv_prepare_t](#Uv_prepare_t)
- [Uv_process_t](#Uv_process_t)
- [Uv_random_t](#Uv_random_t)
- [Uv_req_t](#Uv_req_t)
- [Uv_shutdown_t](#Uv_shutdown_t)
- [Uv_signal_t](#Uv_signal_t)
- [Uv_statfs_t](#Uv_statfs_t)
- [Uv_stream_t](#Uv_stream_t)
- [Uv_tcp_t](#Uv_tcp_t)
- [Uv_timer_t](#Uv_timer_t)
- [Uv_tty_t](#Uv_tty_t)
- [Uv_udp_send_t](#Uv_udp_send_t)
- [Uv_udp_t](#Uv_udp_t)
- [Uv_utsname_t](#Uv_utsname_t)
- [Uv_work_t](#Uv_work_t)
- [Uv_write_t](#Uv_write_t)
- [Walk_cb](#Walk_cb)
- [Work_cb](#Work_cb)
- [Write_cb](#Write_cb)
- [Mode](#Mode)
- [Uv_clock_id](#Uv_clock_id)
- [Uv_fs_event_flags](#Uv_fs_event_flags)
- [Uv_fs_type](#Uv_fs_type)
- [Uv_handle_type](#Uv_handle_type)
- [Uv_loop_option](#Uv_loop_option)
- [Uv_membership](#Uv_membership)
- [Uv_process_flags](#Uv_process_flags)
- [Uv_req_type](#Uv_req_type)
- [Uv_stdio_flags](#Uv_stdio_flags)
- [Uv_tcp_flags](#Uv_tcp_flags)
- [Uv_thread_create_flags](#Uv_thread_create_flags)
- [Uv_thread_priority](#Uv_thread_priority)
- [Uv_tty_mode](#Uv_tty_mode)
- [Uv_tty_vtermstate](#Uv_tty_vtermstate)
- [Uv_udp_flags](#Uv_udp_flags)
- [C.addrinfo](#C.addrinfo)
- [C.sockaddr](#C.sockaddr)
- [C.sockaddr_in](#C.sockaddr_in)
- [C.sockaddr_in6](#C.sockaddr_in6)
- [C.stat](#C.stat)
- [C.uv_async_t](#C.uv_async_t)
- [C.uv_buf_t](#C.uv_buf_t)
- [C.uv_check_t](#C.uv_check_t)
- [C.uv_connect_t](#C.uv_connect_t)
- [C.uv_cpu_info_t](#C.uv_cpu_info_t)
- [C.uv_dir_t](#C.uv_dir_t)
- [C.uv_dirent_t](#C.uv_dirent_t)
- [C.uv_env_item_t](#C.uv_env_item_t)
- [C.uv_fs_event_t](#C.uv_fs_event_t)
- [C.uv_fs_poll_t](#C.uv_fs_poll_t)
- [C.uv_fs_t](#C.uv_fs_t)
- [C.uv_getaddrinfo_t](#C.uv_getaddrinfo_t)
- [C.uv_getnameinfo_t](#C.uv_getnameinfo_t)
- [C.uv_group_t](#C.uv_group_t)
- [C.uv_handle_t](#C.uv_handle_t)
- [C.uv_idle_t](#C.uv_idle_t)
- [C.uv_interface_address_t](#C.uv_interface_address_t)
- [C.uv_loop_t](#C.uv_loop_t)
- [C.uv_metrics_t](#C.uv_metrics_t)
- [C.uv_passwd_t](#C.uv_passwd_t)
- [C.uv_pipe_t](#C.uv_pipe_t)
- [C.uv_poll_t](#C.uv_poll_t)
- [C.uv_prepare_t](#C.uv_prepare_t)
- [C.uv_process_options_t](#C.uv_process_options_t)
- [C.uv_process_t](#C.uv_process_t)
- [C.uv_random_t](#C.uv_random_t)
- [C.uv_req_t](#C.uv_req_t)
- [C.uv_rusage_t](#C.uv_rusage_t)
- [C.uv_shutdown_t](#C.uv_shutdown_t)
- [C.uv_signal_t](#C.uv_signal_t)
- [C.uv_stat_t](#C.uv_stat_t)
- [C.uv_statfs_t](#C.uv_statfs_t)
- [C.uv_stream_t](#C.uv_stream_t)
- [C.uv_tcp_t](#C.uv_tcp_t)
- [C.uv_thread_t](#C.uv_thread_t)
- [C.uv_timer_t](#C.uv_timer_t)
- [C.uv_timeval_t](#C.uv_timeval_t)
- [C.uv_tty_t](#C.uv_tty_t)
- [C.uv_udp_send_t](#C.uv_udp_send_t)
- [C.uv_udp_t](#C.uv_udp_t)
- [C.uv_uid_t](#C.uv_uid_t)
- [C.uv_utsname_t](#C.uv_utsname_t)
- [C.uv_work_t](#C.uv_work_t)
- [C.uv_write_t](#C.uv_write_t)

## accept
[[Return to contents]](#Contents)

## async_init
[[Return to contents]](#Contents)

## async_send
[[Return to contents]](#Contents)

## available_parallelism
[[Return to contents]](#Contents)

## backend_fd
[[Return to contents]](#Contents)

## backend_timeout
[[Return to contents]](#Contents)

## barrier_destroy
[[Return to contents]](#Contents)

## barrier_init
[[Return to contents]](#Contents)

## barrier_wait
[[Return to contents]](#Contents)

## buf_init
[[Return to contents]](#Contents)

## cancel
[[Return to contents]](#Contents)

## chdir
[[Return to contents]](#Contents)

## check_init
[[Return to contents]](#Contents)

## check_start
[[Return to contents]](#Contents)

## check_stop
[[Return to contents]](#Contents)

## clock_gettime
[[Return to contents]](#Contents)

## close
[[Return to contents]](#Contents)

## cond_broadcast
[[Return to contents]](#Contents)

## cond_destroy
[[Return to contents]](#Contents)

## cond_init
[[Return to contents]](#Contents)

## cond_signal
[[Return to contents]](#Contents)

## cond_timedwait
[[Return to contents]](#Contents)

## cond_wait
[[Return to contents]](#Contents)

## cpu_info
[[Return to contents]](#Contents)

## cpumask_size
[[Return to contents]](#Contents)

## cwd
[[Return to contents]](#Contents)

## default_loop
[[Return to contents]](#Contents)

## disable_stdio_inheritance
[[Return to contents]](#Contents)

## err_name
[[Return to contents]](#Contents)

## err_name_r
[[Return to contents]](#Contents)

## exepath
[[Return to contents]](#Contents)

## fileno
[[Return to contents]](#Contents)

## free_cpu_info
[[Return to contents]](#Contents)

## free_interface_addresses
[[Return to contents]](#Contents)

## freeaddrinfo
[[Return to contents]](#Contents)

## fs_access
[[Return to contents]](#Contents)

## fs_chmod
[[Return to contents]](#Contents)

## fs_chown
[[Return to contents]](#Contents)

## fs_close
[[Return to contents]](#Contents)

## fs_closedir
[[Return to contents]](#Contents)

## fs_copyfile
[[Return to contents]](#Contents)

## fs_event_getpath
[[Return to contents]](#Contents)

## fs_event_init
[[Return to contents]](#Contents)

## fs_event_start
[[Return to contents]](#Contents)

## fs_event_stop
[[Return to contents]](#Contents)

## fs_fchmod
[[Return to contents]](#Contents)

## fs_fchown
[[Return to contents]](#Contents)

## fs_fdatasync
[[Return to contents]](#Contents)

## fs_fstat
[[Return to contents]](#Contents)

## fs_fsync
[[Return to contents]](#Contents)

## fs_ftruncate
[[Return to contents]](#Contents)

## fs_futime
[[Return to contents]](#Contents)

## fs_futime_ex
[[Return to contents]](#Contents)

## fs_get_path
[[Return to contents]](#Contents)

## fs_get_ptr
[[Return to contents]](#Contents)

## fs_get_result
[[Return to contents]](#Contents)

## fs_get_system_error
[[Return to contents]](#Contents)

## fs_get_type
[[Return to contents]](#Contents)

## fs_lchown
[[Return to contents]](#Contents)

## fs_link
[[Return to contents]](#Contents)

## fs_lstat
[[Return to contents]](#Contents)

## fs_lutime
[[Return to contents]](#Contents)

## fs_mkdir
[[Return to contents]](#Contents)

## fs_mkdtemp
[[Return to contents]](#Contents)

## fs_mkstemp
[[Return to contents]](#Contents)

## fs_open
[[Return to contents]](#Contents)

## fs_opendir
[[Return to contents]](#Contents)

## fs_poll_getpath
[[Return to contents]](#Contents)

## fs_poll_init
[[Return to contents]](#Contents)

## fs_poll_start
[[Return to contents]](#Contents)

## fs_poll_stop
[[Return to contents]](#Contents)

## fs_read
[[Return to contents]](#Contents)

## fs_readdir
[[Return to contents]](#Contents)

## fs_readlink
[[Return to contents]](#Contents)

## fs_realpath
[[Return to contents]](#Contents)

## fs_rename
[[Return to contents]](#Contents)

## fs_req_cleanup
[[Return to contents]](#Contents)

## fs_rmdir
[[Return to contents]](#Contents)

## fs_scandir
[[Return to contents]](#Contents)

## fs_scandir_next
[[Return to contents]](#Contents)

## fs_sendfile
[[Return to contents]](#Contents)

## fs_stat
[[Return to contents]](#Contents)

## fs_statfs
[[Return to contents]](#Contents)

## fs_symlink
[[Return to contents]](#Contents)

## fs_unlink
[[Return to contents]](#Contents)

## fs_utime
[[Return to contents]](#Contents)

## fs_utime_ex
[[Return to contents]](#Contents)

## fs_write
[[Return to contents]](#Contents)

## get_available_memory
[[Return to contents]](#Contents)

## get_constrained_memory
[[Return to contents]](#Contents)

## get_free_memory
[[Return to contents]](#Contents)

## get_osfhandle
[[Return to contents]](#Contents)

## get_process_title
[[Return to contents]](#Contents)

## get_total_memory
[[Return to contents]](#Contents)

## getaddrinfo
[[Return to contents]](#Contents)

## getnameinfo
[[Return to contents]](#Contents)

## getrusage
[[Return to contents]](#Contents)

## gettimeofday
[[Return to contents]](#Contents)

## guess_handle
[[Return to contents]](#Contents)

## handle_get_data
[[Return to contents]](#Contents)

## handle_get_loop
[[Return to contents]](#Contents)

## handle_get_type
[[Return to contents]](#Contents)

## handle_set_data
[[Return to contents]](#Contents)

## handle_size
[[Return to contents]](#Contents)

## handle_type_name
[[Return to contents]](#Contents)

## has_ref
[[Return to contents]](#Contents)

## hrtime
[[Return to contents]](#Contents)

## idle_init
[[Return to contents]](#Contents)

## idle_start
[[Return to contents]](#Contents)

## idle_stop
[[Return to contents]](#Contents)

## if_indextoiid
[[Return to contents]](#Contents)

## if_indextoname
[[Return to contents]](#Contents)

## inet_ntop
[[Return to contents]](#Contents)

## inet_pton
[[Return to contents]](#Contents)

## interface_addresses
[[Return to contents]](#Contents)

## ip4_addr
[[Return to contents]](#Contents)

## ip4_name
[[Return to contents]](#Contents)

## ip_name
[[Return to contents]](#Contents)

## is_active
[[Return to contents]](#Contents)

## is_closing
[[Return to contents]](#Contents)

## is_readable
[[Return to contents]](#Contents)

## is_writable
[[Return to contents]](#Contents)

## key_create
[[Return to contents]](#Contents)

## key_delete
[[Return to contents]](#Contents)

## key_get
[[Return to contents]](#Contents)

## key_set
[[Return to contents]](#Contents)

## kill
[[Return to contents]](#Contents)

## library_shutdown
[[Return to contents]](#Contents)

## listen
[[Return to contents]](#Contents)

## loadavg
[[Return to contents]](#Contents)

## loop_alive
[[Return to contents]](#Contents)

## loop_close
[[Return to contents]](#Contents)

## loop_configure
[[Return to contents]](#Contents)

## loop_delete
[[Return to contents]](#Contents)

## loop_fork
[[Return to contents]](#Contents)

## loop_get_data
[[Return to contents]](#Contents)

## loop_init
[[Return to contents]](#Contents)

## loop_new
[[Return to contents]](#Contents)

## loop_set_data
[[Return to contents]](#Contents)

## loop_size
[[Return to contents]](#Contents)

## metrics_idle_time
[[Return to contents]](#Contents)

## metrics_info
[[Return to contents]](#Contents)

## mutex_destroy
[[Return to contents]](#Contents)

## mutex_init
[[Return to contents]](#Contents)

## mutex_init_recursive
[[Return to contents]](#Contents)

## mutex_lock
[[Return to contents]](#Contents)

## mutex_trylock
[[Return to contents]](#Contents)

## mutex_unlock
[[Return to contents]](#Contents)

## now
[[Return to contents]](#Contents)

## once
[[Return to contents]](#Contents)

## os_environ
[[Return to contents]](#Contents)

## os_free_environ
[[Return to contents]](#Contents)

## os_free_group
[[Return to contents]](#Contents)

## os_free_passwd
[[Return to contents]](#Contents)

## os_get_group
[[Return to contents]](#Contents)

## os_get_passwd
[[Return to contents]](#Contents)

## os_get_passwd2
[[Return to contents]](#Contents)

## os_getenv
[[Return to contents]](#Contents)

## os_gethostname
[[Return to contents]](#Contents)

## os_getpid
[[Return to contents]](#Contents)

## os_getppid
[[Return to contents]](#Contents)

## os_getpriority
[[Return to contents]](#Contents)

## os_homedir
[[Return to contents]](#Contents)

## os_setenv
[[Return to contents]](#Contents)

## os_setpriority
[[Return to contents]](#Contents)

## os_tmpdir
[[Return to contents]](#Contents)

## os_uname
[[Return to contents]](#Contents)

## os_unsetenv
[[Return to contents]](#Contents)

## pipe_bind
[[Return to contents]](#Contents)

## pipe_bind2
[[Return to contents]](#Contents)

## pipe_chmod
[[Return to contents]](#Contents)

## pipe_connect
[[Return to contents]](#Contents)

## pipe_getpeername
[[Return to contents]](#Contents)

## pipe_getsockname
[[Return to contents]](#Contents)

## pipe_init
[[Return to contents]](#Contents)

## pipe_open
[[Return to contents]](#Contents)

## pipe_pending_count
[[Return to contents]](#Contents)

## pipe_pending_instances
[[Return to contents]](#Contents)

## pipe_pending_type
[[Return to contents]](#Contents)

## poll_init
[[Return to contents]](#Contents)

## poll_start
[[Return to contents]](#Contents)

## poll_stop
[[Return to contents]](#Contents)

## prepare_init
[[Return to contents]](#Contents)

## prepare_start
[[Return to contents]](#Contents)

## prepare_stop
[[Return to contents]](#Contents)

## print_active_handles
[[Return to contents]](#Contents)

## print_all_handles
[[Return to contents]](#Contents)

## process_kill
[[Return to contents]](#Contents)

## queue_work
[[Return to contents]](#Contents)

## random
[[Return to contents]](#Contents)

## read_start
[[Return to contents]](#Contents)

## read_stop
[[Return to contents]](#Contents)

## recv_buffer_size
[[Return to contents]](#Contents)

## ref
[[Return to contents]](#Contents)

## replace_allocator
[[Return to contents]](#Contents)

## req_get_data
[[Return to contents]](#Contents)

## req_get_type
[[Return to contents]](#Contents)

## req_set_data
[[Return to contents]](#Contents)

## req_size
[[Return to contents]](#Contents)

## req_type_name
[[Return to contents]](#Contents)

## resident_set_memory
[[Return to contents]](#Contents)

## run
[[Return to contents]](#Contents)

## rwlock_destroy
[[Return to contents]](#Contents)

## rwlock_init
[[Return to contents]](#Contents)

## rwlock_rdlock
[[Return to contents]](#Contents)

## rwlock_rdunlock
[[Return to contents]](#Contents)

## rwlock_tryrdlock
[[Return to contents]](#Contents)

## rwlock_trywrlock
[[Return to contents]](#Contents)

## rwlock_wrlock
[[Return to contents]](#Contents)

## rwlock_wrunlock
[[Return to contents]](#Contents)

## sem_destroy
[[Return to contents]](#Contents)

## sem_init
[[Return to contents]](#Contents)

## sem_post
[[Return to contents]](#Contents)

## sem_trywait
[[Return to contents]](#Contents)

## sem_wait
[[Return to contents]](#Contents)

## send_buffer_size
[[Return to contents]](#Contents)

## set_process_title
[[Return to contents]](#Contents)

## setup_args
[[Return to contents]](#Contents)

## shutdown
[[Return to contents]](#Contents)

## signal_init
[[Return to contents]](#Contents)

## signal_start
[[Return to contents]](#Contents)

## signal_start_oneshot
[[Return to contents]](#Contents)

## signal_stop
[[Return to contents]](#Contents)

## sleep
[[Return to contents]](#Contents)

## stop
[[Return to contents]](#Contents)

## stream_get_write_queue_size
[[Return to contents]](#Contents)

## stream_set_blocking
[[Return to contents]](#Contents)

## strerror
[[Return to contents]](#Contents)

## tcp_bind
[[Return to contents]](#Contents)

## tcp_connect
[[Return to contents]](#Contents)

## tcp_getpeername
[[Return to contents]](#Contents)

## tcp_getsockname
[[Return to contents]](#Contents)

## tcp_init
[[Return to contents]](#Contents)

## tcp_init_ex
[[Return to contents]](#Contents)

## tcp_keepalive
[[Return to contents]](#Contents)

## tcp_nodelay
[[Return to contents]](#Contents)

## tcp_open
[[Return to contents]](#Contents)

## tcp_simultaneous_accepts
[[Return to contents]](#Contents)

## thread_create
[[Return to contents]](#Contents)

## thread_equal
[[Return to contents]](#Contents)

## thread_getaffinity
[[Return to contents]](#Contents)

## thread_getcpu
[[Return to contents]](#Contents)

## thread_getpriority
[[Return to contents]](#Contents)

## thread_join
[[Return to contents]](#Contents)

## thread_self
[[Return to contents]](#Contents)

## thread_setaffinity
[[Return to contents]](#Contents)

## thread_setpriority
[[Return to contents]](#Contents)

## timer_again
[[Return to contents]](#Contents)

## timer_get_due_in
[[Return to contents]](#Contents)

## timer_get_repeat
[[Return to contents]](#Contents)

## timer_init
[[Return to contents]](#Contents)

## timer_set_repeat
[[Return to contents]](#Contents)

## timer_start
[[Return to contents]](#Contents)

## timer_stop
[[Return to contents]](#Contents)

## translate_sys_error
[[Return to contents]](#Contents)

## try_write
[[Return to contents]](#Contents)

## try_write2
[[Return to contents]](#Contents)

## tty_get_vterm_state
[[Return to contents]](#Contents)

## tty_get_winsize
[[Return to contents]](#Contents)

## tty_init
[[Return to contents]](#Contents)

## tty_reset_mode
[[Return to contents]](#Contents)

## tty_set_mode
[[Return to contents]](#Contents)

## udp_bind
[[Return to contents]](#Contents)

## udp_connect
[[Return to contents]](#Contents)

## udp_get_send_queue_count
[[Return to contents]](#Contents)

## udp_get_send_queue_size
[[Return to contents]](#Contents)

## udp_getpeername
[[Return to contents]](#Contents)

## udp_getsockname
[[Return to contents]](#Contents)

## udp_init
[[Return to contents]](#Contents)

## udp_init_ex
[[Return to contents]](#Contents)

## udp_open
[[Return to contents]](#Contents)

## udp_recv_start
[[Return to contents]](#Contents)

## udp_recv_stop
[[Return to contents]](#Contents)

## udp_send
[[Return to contents]](#Contents)

## udp_set_broadcast
[[Return to contents]](#Contents)

## udp_set_membership
[[Return to contents]](#Contents)

## udp_set_multicast_interface
[[Return to contents]](#Contents)

## udp_set_multicast_loop
[[Return to contents]](#Contents)

## udp_set_multicast_ttl
[[Return to contents]](#Contents)

## udp_set_source_membership
[[Return to contents]](#Contents)

## udp_set_ttl
[[Return to contents]](#Contents)

## udp_try_send
[[Return to contents]](#Contents)

## udp_using_recvmmsg
[[Return to contents]](#Contents)

## unref
[[Return to contents]](#Contents)

## update_time
[[Return to contents]](#Contents)

## uptime
[[Return to contents]](#Contents)

## utf16_length_as_wtf8
[[Return to contents]](#Contents)

## utf16_to_wtf8
[[Return to contents]](#Contents)

## uv_spawn
[[Return to contents]](#Contents)

## version
[[Return to contents]](#Contents)

## version_string
[[Return to contents]](#Contents)

## walk
[[Return to contents]](#Contents)

## write
[[Return to contents]](#Contents)

## write2
[[Return to contents]](#Contents)

## Uv_loop_t.new
[[Return to contents]](#Contents)

## AfterWork_cb
[[Return to contents]](#Contents)

## Alloc_cb
[[Return to contents]](#Contents)

## Async_cb
[[Return to contents]](#Contents)

## Calloc_fn
[[Return to contents]](#Contents)

## Check_cb
[[Return to contents]](#Contents)

## Close_cb
[[Return to contents]](#Contents)

## Connect_cb
[[Return to contents]](#Contents)

## Connection_cb
[[Return to contents]](#Contents)

## Exit_cb
[[Return to contents]](#Contents)

## Free_fn
[[Return to contents]](#Contents)

## FsEvent_cb
[[Return to contents]](#Contents)

## FsPoll_cb
[[Return to contents]](#Contents)

## Fs_cb
[[Return to contents]](#Contents)

## Getaddrinfo_cb
[[Return to contents]](#Contents)

## Getnameinfo_cb
[[Return to contents]](#Contents)

## Idle_cb
[[Return to contents]](#Contents)

## Malloc_fn
[[Return to contents]](#Contents)

## Poll_cb
[[Return to contents]](#Contents)

## Prepare_cb
[[Return to contents]](#Contents)

## Random_cb
[[Return to contents]](#Contents)

## Read_cb
[[Return to contents]](#Contents)

## Realloc_fn
[[Return to contents]](#Contents)

## Shutdown_cb
[[Return to contents]](#Contents)

## Signal_cb
[[Return to contents]](#Contents)

## Sockaddr
[[Return to contents]](#Contents)

## Sockaddr_in
[[Return to contents]](#Contents)

## Timer_cb
[[Return to contents]](#Contents)

## Udp_recv_cb
[[Return to contents]](#Contents)

## Udp_send_cb
[[Return to contents]](#Contents)

## Uv_async_t
[[Return to contents]](#Contents)

## Uv_buf_t
[[Return to contents]](#Contents)

## Uv_check_t
[[Return to contents]](#Contents)

## Uv_connect_t
[[Return to contents]](#Contents)

## Uv_cpu_info_t
[[Return to contents]](#Contents)

## Uv_dir_t
[[Return to contents]](#Contents)

## Uv_dirent_t
[[Return to contents]](#Contents)

## Uv_env_item_t
[[Return to contents]](#Contents)

## Uv_fs_event_t
[[Return to contents]](#Contents)

## Uv_fs_poll_t
[[Return to contents]](#Contents)

## Uv_fs_t
[[Return to contents]](#Contents)

## Uv_getaddrinfo_t
[[Return to contents]](#Contents)

## Uv_getnameinfo_t
[[Return to contents]](#Contents)

## Uv_group_t
[[Return to contents]](#Contents)

## Uv_handle_t
[[Return to contents]](#Contents)

## Uv_idle_t
[[Return to contents]](#Contents)

## Uv_interface_address_t
[[Return to contents]](#Contents)

## Uv_loop_t
[[Return to contents]](#Contents)

## Uv_metrics_t
[[Return to contents]](#Contents)

## Uv_passwd_t
[[Return to contents]](#Contents)

## Uv_pipe_t
[[Return to contents]](#Contents)

## Uv_poll_t
[[Return to contents]](#Contents)

## Uv_prepare_t
[[Return to contents]](#Contents)

## Uv_process_t
[[Return to contents]](#Contents)

## Uv_random_t
[[Return to contents]](#Contents)

## Uv_req_t
[[Return to contents]](#Contents)

## Uv_shutdown_t
[[Return to contents]](#Contents)

## Uv_signal_t
[[Return to contents]](#Contents)

## Uv_statfs_t
[[Return to contents]](#Contents)

## Uv_stream_t
[[Return to contents]](#Contents)

## Uv_tcp_t
[[Return to contents]](#Contents)

## Uv_timer_t
[[Return to contents]](#Contents)

## Uv_tty_t
[[Return to contents]](#Contents)

## Uv_udp_send_t
[[Return to contents]](#Contents)

## Uv_udp_t
[[Return to contents]](#Contents)

## Uv_utsname_t
[[Return to contents]](#Contents)

## Uv_work_t
[[Return to contents]](#Contents)

## Uv_write_t
[[Return to contents]](#Contents)

## Walk_cb
[[Return to contents]](#Contents)

## Work_cb
[[Return to contents]](#Contents)

## Write_cb
[[Return to contents]](#Contents)

## Mode
[[Return to contents]](#Contents)

## Uv_clock_id
[[Return to contents]](#Contents)

## Uv_fs_event_flags
[[Return to contents]](#Contents)

## Uv_fs_type
[[Return to contents]](#Contents)

## Uv_handle_type
[[Return to contents]](#Contents)

## Uv_loop_option
[[Return to contents]](#Contents)

## Uv_membership
[[Return to contents]](#Contents)

## Uv_process_flags
[[Return to contents]](#Contents)

## Uv_req_type
[[Return to contents]](#Contents)

## Uv_stdio_flags
[[Return to contents]](#Contents)

## Uv_tcp_flags
[[Return to contents]](#Contents)

## Uv_thread_create_flags
[[Return to contents]](#Contents)

## Uv_thread_priority
[[Return to contents]](#Contents)

## Uv_tty_mode
[[Return to contents]](#Contents)

## Uv_tty_vtermstate
[[Return to contents]](#Contents)

## Uv_udp_flags
[[Return to contents]](#Contents)

## C.addrinfo
[[Return to contents]](#Contents)

## C.sockaddr
[[Return to contents]](#Contents)

## C.sockaddr_in
[[Return to contents]](#Contents)

## C.sockaddr_in6
[[Return to contents]](#Contents)

## C.stat
[[Return to contents]](#Contents)

## C.uv_async_t
[[Return to contents]](#Contents)

## C.uv_buf_t
[[Return to contents]](#Contents)

## C.uv_check_t
[[Return to contents]](#Contents)

## C.uv_connect_t
[[Return to contents]](#Contents)

## C.uv_cpu_info_t
[[Return to contents]](#Contents)

## C.uv_dir_t
[[Return to contents]](#Contents)

## C.uv_dirent_t
[[Return to contents]](#Contents)

## C.uv_env_item_t
[[Return to contents]](#Contents)

## C.uv_fs_event_t
[[Return to contents]](#Contents)

## C.uv_fs_poll_t
[[Return to contents]](#Contents)

## C.uv_fs_t
[[Return to contents]](#Contents)

## C.uv_getaddrinfo_t
[[Return to contents]](#Contents)

## C.uv_getnameinfo_t
[[Return to contents]](#Contents)

## C.uv_group_t
[[Return to contents]](#Contents)

## C.uv_handle_t
[[Return to contents]](#Contents)

## C.uv_idle_t
[[Return to contents]](#Contents)

## C.uv_interface_address_t
[[Return to contents]](#Contents)

## C.uv_loop_t
[[Return to contents]](#Contents)

## C.uv_metrics_t
[[Return to contents]](#Contents)

## C.uv_passwd_t
[[Return to contents]](#Contents)

## C.uv_pipe_t
[[Return to contents]](#Contents)

## C.uv_poll_t
[[Return to contents]](#Contents)

## C.uv_prepare_t
[[Return to contents]](#Contents)

## C.uv_process_options_t
[[Return to contents]](#Contents)

## C.uv_process_t
[[Return to contents]](#Contents)

## C.uv_random_t
[[Return to contents]](#Contents)

## C.uv_req_t
[[Return to contents]](#Contents)

## C.uv_rusage_t
[[Return to contents]](#Contents)

## C.uv_shutdown_t
[[Return to contents]](#Contents)

## C.uv_signal_t
[[Return to contents]](#Contents)

## C.uv_stat_t
[[Return to contents]](#Contents)

## C.uv_statfs_t
[[Return to contents]](#Contents)

## C.uv_stream_t
[[Return to contents]](#Contents)

## C.uv_tcp_t
[[Return to contents]](#Contents)

## C.uv_thread_t
[[Return to contents]](#Contents)

## C.uv_timer_t
[[Return to contents]](#Contents)

## C.uv_timeval_t
[[Return to contents]](#Contents)

## C.uv_tty_t
[[Return to contents]](#Contents)

## C.uv_udp_send_t
[[Return to contents]](#Contents)

## C.uv_udp_t
[[Return to contents]](#Contents)

## C.uv_uid_t
[[Return to contents]](#Contents)

## C.uv_utsname_t
[[Return to contents]](#Contents)

## C.uv_work_t
[[Return to contents]](#Contents)

## C.uv_write_t
[[Return to contents]](#Contents)

#### Powered by vdoc. Generated on: 28 Sep 2024 10:20:17
