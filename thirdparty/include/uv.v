@[translated]
module include

// Copyright Joyent, Inc. and other Node contributors. All rights reserved.
// * *Permission is hereby granted, free of charge, to any person obtaining a copy
// *of this software and associated documentation files (the "Software"), to
// *deal in the Software without restriction, including without limitation the
// *rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
// *sell copies of the Software, and to permit persons to whom the Software is
// *furnished to do so, subject to the following conditions:
// * *The above copyright notice and this permission notice shall be included in
// *all copies or substantial portions of the Software.
// * *THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// *IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// *FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// *AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// *LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// *FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
// *IN THE SOFTWARE.
// 
// See https://github.com/libuv/libuv#documentation for documentation. 
// Windows - set up dll import/export decorators. 
// Building shared library. 
// Using shared library. 
// Building static library. 
// nothing 
// Sun Studio >= 8 
// nothing 
// UV_EXTERN 
// Internal type, do not use. 
struct Uv__queue { 
	next &Uv__queue
	prev &Uv__queue
}
// this header is not correct in a shared library environment 
// Expand this list if necessary. 
// Handle types. 
// Request types. 
// None of the above. 
//
// *NOTE:
// * This function is DEPRECATED, users should
// * allocate the loop manually and use uv_loop_init instead.
// 
//
// *NOTE:
// * This function is DEPRECATED. Users should use
// * uv_loop_close and free the memory manually instead.
// 
// public 
// read-only 
// private 
// Abstract base class of all requests. 
// Platform-specific request types. 
// public 
// read-only 
// private 
// The abstract base class of all handles. 
// Helpers for ad hoc debugging, no API/ABI stability guaranteed. 
//FILE
//FILE
//
// *The following functions are declared 'static inline' to ensure that they
// *end up in the static linkage namespace of the caller and thus point to
// *the correct (caller's) copy of MSVCRT for resolving the `fd` pseudo-handle
// *to the intended kernel `HANDLE`.
// *Thus, they are also not included when building a shared library,
// *as their definition would not be correct when linked into that environment.
// 
//
//   *_get_osfhandle() raises an assert in debug builds if the FD is invalid.
//   *So if you plan on using invalid fd, you will need to install a _CrtSetReportHook handler
//   
// BUILDING_UV_SHARED 
// number of bytes queued for writing 
// private 
//
// *uv_stream_t is a subclass of uv_handle_t.
// * *uv_stream is an abstract class.
// * *uv_stream_t is the parent class of uv_tcp_t, uv_pipe_t and uv_tty_t.
// 
// uv_write_t is a subclass of uv_req_t. 
// TODO: make private and unix-only in v2.x. 
//
// *uv_tcp_t is a subclass of uv_stream_t.
// * *Represents a TCP stream or TCP server.
// 
// Used with uv_tcp_bind, when an IPv6 address is used. 
// uv_connect_t is a subclass of uv_req_t. 
//
// *UDP support.
// 
// Disables dual stack mode. 
//
//   *Indicates message was truncated because read buffer was too small. The
//   *remainder was discarded by the OS. Used in uv_udp_recv_cb.
//   
//
//   *Indicates if SO_REUSEADDR will be set when binding the handle.
//   *This sets the SO_REUSEPORT socket flag on the BSDs and OS X. On other
//   *Unix platforms, it sets the SO_REUSEADDR flag.  What that means is that
//   *multiple threads or processes can bind to the same address without error
//   *(provided they all set the flag) but only the last one to bind will receive
//   *any traffic, in effect "stealing" the port from the previous listener.
//   
//
//   *Indicates that the message was received by recvmmsg, so the buffer provided
//   *must not be freed by the recv_cb callback.
//   
//
//   *Indicates that the buffer provided has been fully utilized by recvmmsg and
//   *that it should now be freed by the recv_cb callback. When this flag is set
//   *in uv_udp_recv_cb, nread will always be 0 and addr will always be NULL.
//   
//
//   *Indicates if IP_RECVERR/IPV6_RECVERR will be set when binding the handle.
//   *This sets IP_RECVERR for IPv4 and IPV6_RECVERR for IPv6 UDP sockets on
//   *Linux. This stops the Linux kernel from suppressing some ICMP error
//   *messages and enables full ICMP error reporting for faster failover.
//   *This flag is no-op on platforms other than Linux.
//   
//
//   *Indicates that recvmmsg should be used, if available.
//   
// uv_udp_t is a subclass of uv_handle_t. 
// read-only 
//
//   *Number of bytes queued for sending. This field strictly shows how much
//   *information is currently queued.
//   
//
//   *Number of send requests currently in the queue awaiting to be processed.
//   
// uv_udp_send_t is a subclass of uv_req_t. 
//
// *uv_tty_t is a subclass of uv_stream_t.
// * *Representing a stream for the console.
// 
// Initial/normal terminal mode 
// Raw input mode (On Windows, ENABLE_WINDOW_INPUT is also enabled) 
// Binary-safe I/O mode for IPC (Unix-only) 
//
//   *The console supports handling of virtual terminal sequences
//   *(Windows10 new console, ConEmu)
//   
// The console cannot process the virtual terminal sequence.  (Legacy
//   *console)
//   
//
// *uv_pipe_t is a subclass of uv_stream_t.
// * *Representing a pipe stream or pipe server. On Windows this is a Named
// *Pipe. On Unix this is a Unix domain socket.
// 
// non-zero if this pipe is used for passing handles 
//
// *uv_timer_t is a subclass of uv_handle_t.
// * *Used to get woken up at a specified time in the future.
// 
//
// *uv_getaddrinfo_t is a subclass of uv_req_t.
// * *Request object for uv_getaddrinfo.
// 
// read-only 
// struct addrinfo*addrinfo is marked as private, but it really isn't. 
//
//*uv_getnameinfo_t is a subclass of uv_req_t.
//**Request object for uv_getnameinfo.
//
// read-only 
// host and service are marked as private, but they really aren't. 
// uv_spawn() options. 
//
//   *When UV_CREATE_PIPE is specified, UV_READABLE_PIPE and UV_WRITABLE_PIPE
//   *determine the direction of flow, from the child process' perspective. Both
//   *flags may be specified to create a duplex data stream.
//   
//
//   *When UV_CREATE_PIPE is specified, specifying UV_NONBLOCK_PIPE opens the
//   *handle in non-blocking mode in the child. This may cause loss of data,
//   *if the child is not designed to handle to encounter this mode,
//   *but can also be significantly more efficient.
//   
// old name, for compatibility 
// Called after the process exits. 
// Path to program to execute. 
//
//   *Command line arguments. args[0] should be the path to the program. On
//   *Windows this uses CreateProcess which concatenates the arguments into a
//   *string this can cause some strange errors. See the note at
//   *windows_verbatim_arguments.
//   
//
//   *This will be set as the environ variable in the subprocess. If this is
//   *NULL then the parents environ will be used.
//   
//
//   *If non-null this represents a directory the subprocess should execute
//   *in. Stands for current working directory.
//   
//
//   *Various flags that control how uv_spawn() behaves. See the definition of
//   *`enum uv_process_flags` below.
//   
//
//   *The `stdio` field points to an array of uv_stdio_container_t structs that
//   *describe the file descriptors that will be made available to the child
//   *process. The convention is that stdio[0] points to stdin, fd 1 is used for
//   *stdout, and fd 2 is stderr.
//   *   *Note that on windows file descriptors greater than 2 are available to the
//   *child process only if the child processes uses the MSVCRT runtime.
//   
//
//   *Libuv can change the child process' user/group id. This happens only when
//   *the appropriate bits are set in the flags fields. This is not supported on
//   *windows; uv_spawn() will fail and set the error to UV_ENOTSUP.
//   
//
//    Libuv can set the child process' CPU affinity mask.  This happens when
//    `cpumask` is non-NULL.  It must point to an array of char values
//    of length `cpumask_size`, whose value must be at least that returned by
//    uv_cpumask_size().  Each byte in the mask can be either zero (false)
//    or non-zero (true) to indicate whether the corresponding processor at
//    that index is included.
//
//    If enabled on an unsupported platform, uv_spawn() will fail with
//    UV_ENOTSUP.
//   
//
// *These are the flags that can be used for the uv_process_options.flags field.
// 
//
//   *Set the child process' user id. The user id is supplied in the `uid` field
//   *of the options struct. This does not work on windows; setting this flag
//   *will cause uv_spawn() to fail.
//   
//
//   *Set the child process' group id. The user id is supplied in the `gid`
//   *field of the options struct. This does not work on windows; setting this
//   *flag will cause uv_spawn() to fail.
//   
//
//   *Do not wrap any arguments in quotes, or perform any other escaping, when
//   *converting the argument list into a command line string. This option is
//   *only meaningful on Windows systems. On Unix it is silently ignored.
//   
//
//   *Spawn the child process in a detached state - this will make it a process
//   *group leader, and will effectively enable the child to keep running after
//   *the parent exits.  Note that the child process will still keep the
//   *parent's event loop alive unless the parent process calls uv_unref() on
//   *the child's process handle.
//   
//
//   *Hide the subprocess window that would normally be created. This option is
//   *only meaningful on Windows systems. On Unix it is silently ignored.
//   
//
//   *Hide the subprocess console window that would normally be created. This
//   *option is only meaningful on Windows systems. On Unix it is silently
//   *ignored.
//   
//
//   *Hide the subprocess GUI window that would normally be created. This
//   *option is only meaningful on Windows systems. On Unix it is silently
//   *ignored.
//   
//
//   *On Windows, if the path to the program to execute, specified in
//   *uv_process_options_t's file field, has a directory component,
//   *search for the exact file name before trying variants with
//   *extensions like '.exe' or '.cmd'.
//   
//
// *uv_process_t is a subclass of uv_handle_t.
// 
//
// *uv_work_t is a subclass of uv_req_t.
// 
// milliseconds 
// milliseconds 
// milliseconds 
// milliseconds 
// milliseconds 
//
// *IPv6 doesn't support broadcast but this is the closest thing
// 
// This struct does not contain the nodename and domainname fields present in
//     the utsname type. domainname is a GNU extension. Both fields are referred
//     to as meaningless in the docs. 
// user CPU time used 
// system CPU time used 
// maximum resident set size 
// integral shared memory size 
// integral unshared data size 
// integral unshared stack size 
// page reclaims (soft page faults) 
// page faults (hard page faults) 
// swaps 
// block input operations 
// block output operations 
// IPC messages sent 
// IPC messages received 
// signals received 
// voluntary context switches 
// involuntary context switches 
// On IBM i PASE, the highest process priority is -10 
// RUNPTY(99) 
// RUNPTY(50) 
// RUNPTY(20) 
// RUNTY(12) 
// RUNPTY(6) 
// RUNPTY(1) 
//
//    Fallback for the maximum hostname size, including the null terminator. The
//    Windows gethostname() documentation states that 256 bytes will always be
//    large enough to hold the null-terminated hostname.
//  
// private 
// uv_fs_t is a subclass of uv_req_t. 
// Stores the result of uv_fs_stat() and uv_fs_fstat(). 
//
// *This flag can be used with uv_fs_copyfile() to return an error if the
// *destination already exists.
// 
//
// *This flag can be used with uv_fs_copyfile() to attempt to create a reflink.
// *If copy-on-write is not supported, a fallback copy mechanism is used.
// 
//
// *This flag can be used with uv_fs_copyfile() to attempt to create a reflink.
// *If copy-on-write is not supported, an error is returned.
// 
//
// *This flag can be used with uv_fs_symlink() on Windows to specify whether
// *path argument points to a directory.
// 
//
// *This flag can be used with uv_fs_symlink() on Windows to specify whether
// *the symlink is to be created using junction points.
// 
// private 
//
// *uv_fs_stat() based polling file watcher.
// 
// Private, don't touch. 
//
// *Flags to be passed to uv_fs_event_start().
// 
//
//   *By default, if the fs event watcher is given a directory name, we will
//   *watch for all events in that directory. This flags overrides this behavior
//   *and makes fs_event report only changes to the directory entry itself. This
//   *flag does not affect individual files watched.
//   *This flag is currently not implemented yet on any backend.
//   
//
//   *By default uv_fs_event will try to use a kernel interface such as inotify
//   *or kqueue to detect events. This may not work on remote filesystems such
//   *as NFS mounts. This flag makes fs_event fall back to calling stat() on a
//   *regular interval.
//   *This flag is currently not implemented yet on any backend.
//   
//
//   *By default, event watcher, when watching directory, is not registering
//   *(is ignoring) changes in it's subdirectories.
//   *This flag will override this behaviour on platforms that support it.
//   
// private 
// For future extension; must be 0. 
// More fields may be added at any time. 
// The presence of these unions force similar struct layout. 
// User data - use this for whatever. 
// Loop reference counting. 
// Internal storage for future extensions. 
// Internal flag to signal loop stop. 
// String utilities needed internally for dealing with Windows. 
// Don't export the private CPP symbols. 
// UV_H 
// Copyright Joyent, Inc. and other Node contributors. All rights reserved.
// * *Permission is hereby granted, free of charge, to any person obtaining a copy
// *of this software and associated documentation files (the "Software"), to
// *deal in the Software without restriction, including without limitation the
// *rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
// *sell copies of the Software, and to permit persons to whom the Software is
// *furnished to do so, subject to the following conditions:
// * *The above copyright notice and this permission notice shall be included in
// *all copies or substantial portions of the Software.
// * *THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// *IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// *FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// *AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// *LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// *FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
// *IN THE SOFTWARE.
// 
//
// *This file is private to libuv. It provides common functionality to both
// *Windows and Unix backends.
// 
struct Uv__work { 
	work fn (&Uv__work)
	done fn (&Uv__work, int)
	loop &Uv_loop_t
	wq Uv__queue
}
// UV_THREADPOOL_H_ 
// Copyright Joyent, Inc. and other Node contributors. All rights reserved.
// * *Permission is hereby granted, free of charge, to any person obtaining a copy
// *of this software and associated documentation files (the "Software"), to
// *deal in the Software without restriction, including without limitation the
// *rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
// *sell copies of the Software, and to permit persons to whom the Software is
// *furnished to do so, subject to the following conditions:
// * *The above copyright notice and this permission notice shall be included in
// *all copies or substantial portions of the Software.
// * *THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// *IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// *FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// *AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// *LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// *FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
// *IN THE SOFTWARE.
// 
// MAXHOSTNAMELEN on Solaris 
// MAXHOSTNAMELEN on Linux and the BSDs 
// __PASE__ and _AIX are both defined on IBM i 
// IBM i needs uv/posix.h, not uv/aix.h 
// empty 
type Uv__io_cb = fn (&Uv_loop_s, &Uv__io_s, u32)
type Uv__io_t = Uv__io_s
struct Uv__io_s { 
	cb Uv__io_cb
	pending_queue Uv__queue
	watcher_queue Uv__queue
	pevents u32
// Pending event mask i.e. mask at next tick. 
	events u32
// Current event mask. 
	fd int
	rcount int
	wcount int
}
// empty 
// empty 
// empty 
// Note: May be cast to struct iovec. See writev(2). 
struct Uv_buf_t { 
	base &i8
	len usize
}
type Uv_os_sock_t = int
type Uv_os_fd_t = int
type Uv_pid_t = Pid_t
type Uv_once_t = Pthread_once_t
type Uv_thread_t = Pthread_t
type Uv_mutex_t = Pthread_mutex_t
type Uv_rwlock_t = Pthread_rwlock_t
type Uv_sem_t = Semaphore_t
type Uv_cond_t = Pthread_cond_t
type Uv_key_t = Pthread_key_t
// Note: guard clauses should match uv_barrier_init's in src/unix/thread.c. 
struct Uv_barrier_t { 
	mutex Uv_mutex_t
	cond Uv_cond_t
	threshold u32
	in_ u32
	out u32
}
// Platform-specific definitions for uv_spawn support. 
type Uv_gid_t = Gid_t
type Uv_uid_t = Uid_t
type Uv__dirent_t = Dirent
// Platform-specific definitions for uv_dlopen support. 
// empty 
struct Uv_lib_t { 
	handle voidptr
	errmsg &i8
}
// empty 
// empty 
// empty 
// empty 
// empty 
// NULL or strdup'ed 
// RB_ENTRY(uv_signal_s) tree_entry; 
// Use two counters here so we don have to fiddle with atomics. 
// fs open() flags supported on this platform: 
// fs open() flags supported on other platforms: 
// UV_UNIX_H 
// Copyright Joyent, Inc. and other Node contributors. All rights reserved.
// * *Permission is hereby granted, free of charge, to any person obtaining a copy
// *of this software and associated documentation files (the "Software"), to
// *deal in the Software without restriction, including without limitation the
// *rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
// *sell copies of the Software, and to permit persons to whom the Software is
// *furnished to do so, subject to the following conditions:
// * *The above copyright notice and this permission notice shall be included in
// *all copies or substantial portions of the Software.
// * *THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// *IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// *FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// *AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// *LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// *FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
// *IN THE SOFTWARE.
// 
// See https://github.com/libuv/libuv#documentation for documentation. 
// Windows - set up dll import/export decorators. 
// Building shared library. 
// Using shared library. 
// Building static library. 
// nothing 
// Sun Studio >= 8 
// nothing 
// UV_EXTERN 
// Internal type, do not use. 
// this header is not correct in a shared library environment 
// Expand this list if necessary. 
enum Uv_errno_t {
	uv_e2_big = -7
	uv_eacces = -13
	uv_eaddrinuse = -48
	uv_eaddrnotavail = -49
	uv_eafnosupport = -47
	uv_eagain = -35
	uv_eai_addrfamily = -3000
	uv_eai_again = -3001
	uv_eai_badflags = -3002
	uv_eai_badhints = -3013
	uv_eai_canceled = -3003
	uv_eai_fail = -3004
	uv_eai_family = -3005
	uv_eai_memory = -3006
	uv_eai_nodata = -3007
	uv_eai_noname = -3008
	uv_eai_overflow = -3009
	uv_eai_protocol = -3014
	uv_eai_service = -3010
	uv_eai_socktype = -3011
	uv_ealready = -37
	uv_ebadf = -9
	uv_ebusy = -16
	uv_ecanceled = -89
	uv_echarset = -4080
	uv_econnaborted = -53
	uv_econnrefused = -61
	uv_econnreset = -54
	uv_edestaddrreq = -39
	uv_eexist = -17
	uv_efault = -14
	uv_efbig = -27
	uv_ehostunreach = -65
	uv_eintr = -4
	uv_einval = -22
	uv_eio = -5
	uv_eisconn = -56
	uv_eisdir = -21
	uv_eloop = -62
	uv_emfile = -24
	uv_emsgsize = -40
	uv_enametoolong = -63
	uv_enetdown = -50
	uv_enetunreach = -51
	uv_enfile = -23
	uv_enobufs = -55
	uv_enodev = -19
	uv_enoent = -2
	uv_enomem = -12
	uv_enonet = -4056
	uv_enoprotoopt = -42
	uv_enospc = -28
	uv_enosys = -78
	uv_enotconn = -57
	uv_enotdir = -20
	uv_enotempty = -66
	uv_enotsock = -38
	uv_enotsup = -45
	uv_eoverflow = -84
	uv_eperm = -1
	uv_epipe = -32
	uv_eproto = -100
	uv_eprotonosupport = -43
	uv_eprototype = -41
	uv_erange = -34
	uv_erofs = -30
	uv_eshutdown = -58
	uv_espipe = -29
	uv_esrch = -3
	uv_etimedout = -60
	uv_etxtbsy = -26
	uv_exdev = -18
	uv_unknown = -4094
	uv_eof = -4095
	uv_enxio = -6
	uv_emlink = -31
	uv_ehostdown = -64
	uv_eremoteio = -4030
	uv_enotty = -25
	uv_eftype = -79
	uv_eilseq = -92
	uv_esocktnosupport = -44
	uv_enodata = -96
	uv_eunatch = -4023
	uv_errno_max = -4095 - 1
}

enum Uv_handle_type {
	uv_unknown_handle = 0
	uv_async
	uv_check
	uv_fs_event
	uv_fs_poll
	uv_handle
	uv_idle
	uv_named_pipe
	uv_poll
	uv_prepare
	uv_process
	uv_stream
	uv_tcp
	uv_timer
	uv_tty
	uv_udp
	uv_signal
	uv_file
	uv_handle_type_max
}

enum Uv_req_type {
	uv_unknown_req = 0
	uv_req
	uv_connect
	uv_write
	uv_shutdown
	uv_udp_send
	uv_fs
	uv_work
	uv_getaddrinfo
	uv_getnameinfo
	uv_random
	uv_req_type_max
}

// Handle types. 
type Uv_loop_t = Uv_loop_s
type Uv_handle_t = Uv_handle_s
type Uv_dir_t = Uv_dir_s
type Uv_stream_t = Uv_stream_s
type Uv_tcp_t = Uv_tcp_s
type Uv_udp_t = Uv_udp_s
type Uv_pipe_t = Uv_pipe_s
type Uv_tty_t = Uv_tty_s
type Uv_poll_t = Uv_poll_s
type Uv_timer_t = Uv_timer_s
type Uv_prepare_t = Uv_prepare_s
type Uv_check_t = Uv_check_s
type Uv_idle_t = Uv_idle_s
type Uv_async_t = Uv_async_s
type Uv_process_t = Uv_process_s
type Uv_fs_event_t = Uv_fs_event_s
type Uv_fs_poll_t = Uv_fs_poll_s
type Uv_signal_t = Uv_signal_s
// Request types. 
type Uv_req_t = Uv_req_s
type Uv_getaddrinfo_t = Uv_getaddrinfo_s
type Uv_getnameinfo_t = Uv_getnameinfo_s
type Uv_shutdown_t = Uv_shutdown_s
type Uv_write_t = Uv_write_s
type Uv_connect_t = Uv_connect_s
type Uv_udp_send_t = Uv_udp_send_s
type Uv_fs_t = Uv_fs_s
type Uv_work_t = Uv_work_s
type Uv_random_t = Uv_random_s
// None of the above. 
type Uv_env_item_t = Uv_env_item_s
type Uv_cpu_info_t = Uv_cpu_info_s
type Uv_interface_address_t = Uv_interface_address_s
type Uv_dirent_t = Uv_dirent_s
type Uv_passwd_t = Uv_passwd_s
type Uv_group_t = Uv_group_s
type Uv_utsname_t = Uv_utsname_s
type Uv_statfs_t = Uv_statfs_s
type Uv_metrics_t = Uv_metrics_s
enum Uv_loop_option {
	uv_loop_block_signal = 0
	uv_metrics_idle_time
}

enum Uv_run_mode {
	uv_run_default = 0
	uv_run_once
	uv_run_nowait
}

fn C.uv_version() u32

pub fn uv_version() u32 {
	return C.uv_version()
}

fn C.uv_version_string() &i8

pub fn uv_version_string() &i8 {
	return C.uv_version_string()
}

type Uv_malloc_func = fn (usize) voidptr
type Uv_realloc_func = fn (voidptr, usize) voidptr
type Uv_calloc_func = fn (usize, usize) voidptr
type Uv_free_func = fn (voidptr)
fn C.uv_library_shutdown()

pub fn uv_library_shutdown() {
	C.uv_library_shutdown()
}

fn C.uv_replace_allocator(malloc_func Uv_malloc_func, realloc_func Uv_realloc_func, calloc_func Uv_calloc_func, free_func Uv_free_func) int

pub fn uv_replace_allocator(malloc_func Uv_malloc_func, realloc_func Uv_realloc_func, calloc_func Uv_calloc_func, free_func Uv_free_func) int {
	return C.uv_replace_allocator(malloc_func, realloc_func, calloc_func, free_func)
}

fn C.uv_default_loop() &Uv_loop_t

pub fn uv_default_loop() &Uv_loop_t {
	return C.uv_default_loop()
}

fn C.uv_loop_init(loop &Uv_loop_t) int

pub fn uv_loop_init(loop &Uv_loop_t) int {
	return C.uv_loop_init(loop)
}

fn C.uv_loop_close(loop &Uv_loop_t) int

pub fn uv_loop_close(loop &Uv_loop_t) int {
	return C.uv_loop_close(loop)
}

//
// *NOTE:
// * This function is DEPRECATED, users should
// * allocate the loop manually and use uv_loop_init instead.
// 
fn C.uv_loop_new() &Uv_loop_t

pub fn uv_loop_new() &Uv_loop_t {
	return C.uv_loop_new()
}

//
// *NOTE:
// * This function is DEPRECATED. Users should use
// * uv_loop_close and free the memory manually instead.
// 
fn C.uv_loop_delete(arg0 &Uv_loop_t)

pub fn uv_loop_delete(arg0 &Uv_loop_t) {
	C.uv_loop_delete(arg0)
}

fn C.uv_loop_size() usize

pub fn uv_loop_size() usize {
	return C.uv_loop_size()
}

fn C.uv_loop_alive(loop &Uv_loop_t) int

pub fn uv_loop_alive(loop &Uv_loop_t) int {
	return C.uv_loop_alive(loop)
}

@[c2v_variadic]
fn C.uv_loop_configure(loop &Uv_loop_t, option Uv_loop_option) int

pub fn uv_loop_configure(loop &Uv_loop_t, option Uv_loop_option) int {
	return C.uv_loop_configure(loop, option)
}

fn C.uv_loop_fork(loop &Uv_loop_t) int

pub fn uv_loop_fork(loop &Uv_loop_t) int {
	return C.uv_loop_fork(loop)
}

fn C.uv_run(arg0 &Uv_loop_t, mode Uv_run_mode) int

pub fn uv_run(arg0 &Uv_loop_t, mode Uv_run_mode) int {
	return C.uv_run(arg0, mode)
}

fn C.uv_stop(arg0 &Uv_loop_t)

pub fn uv_stop(arg0 &Uv_loop_t) {
	C.uv_stop(arg0)
}

fn C.uv_ref(arg0 &Uv_handle_t)

pub fn uv_ref(arg0 &Uv_handle_t) {
	C.uv_ref(arg0)
}

fn C.uv_unref(arg0 &Uv_handle_t)

pub fn uv_unref(arg0 &Uv_handle_t) {
	C.uv_unref(arg0)
}

fn C.uv_has_ref(arg0 &Uv_handle_t) int

pub fn uv_has_ref(arg0 &Uv_handle_t) int {
	return C.uv_has_ref(arg0)
}

fn C.uv_update_time(arg0 &Uv_loop_t)

pub fn uv_update_time(arg0 &Uv_loop_t) {
	C.uv_update_time(arg0)
}

fn C.uv_now(arg0 &Uv_loop_t) u64

pub fn uv_now(arg0 &Uv_loop_t) u64 {
	return C.uv_now(arg0)
}

fn C.uv_backend_fd(arg0 &Uv_loop_t) Uv_os_fd_t

pub fn uv_backend_fd(arg0 &Uv_loop_t) Uv_os_fd_t {
	return C.uv_backend_fd(arg0)
}

fn C.uv_backend_timeout(arg0 &Uv_loop_t) int

pub fn uv_backend_timeout(arg0 &Uv_loop_t) int {
	return C.uv_backend_timeout(arg0)
}

type Uv_alloc_cb = fn (&Uv_handle_t, usize, &Uv_buf_t)
type Uv_read_cb = fn (&Uv_stream_t, isize, &Uv_buf_t)
type Uv_write_cb = fn (&Uv_write_t, int)
type Uv_connect_cb = fn (&Uv_connect_t, int)
type Uv_shutdown_cb = fn (&Uv_shutdown_t, int)
type Uv_connection_cb = fn (&Uv_stream_t, int)
type Uv_close_cb = fn (&Uv_handle_t)
type Uv_poll_cb = fn (&Uv_poll_t, int, int)
type Uv_timer_cb = fn (&Uv_timer_t)
type Uv_async_cb = fn (&Uv_async_t)
type Uv_prepare_cb = fn (&Uv_prepare_t)
type Uv_check_cb = fn (&Uv_check_t)
type Uv_idle_cb = fn (&Uv_idle_t)
type Uv_exit_cb = fn (&Uv_process_t, i64, int)
type Uv_walk_cb = fn (&Uv_handle_t, voidptr)
type Uv_fs_cb = fn (&Uv_fs_t)
type Uv_work_cb = fn (&Uv_work_t)
type Uv_after_work_cb = fn (&Uv_work_t, int)
type Uv_getaddrinfo_cb = fn (&Uv_getaddrinfo_t, int, &Addrinfo)
type Uv_getnameinfo_cb = fn (&Uv_getnameinfo_t, int, &i8, &i8)
type Uv_random_cb = fn (&Uv_random_t, int, voidptr, usize)
enum Uv_clock_id {
	uv_clock_monotonic
	uv_clock_realtime
}

struct Uv_timespec_t { 
	tv_sec i64
	tv_nsec int
}
struct Uv_timeval_t { 
	tv_sec i64
	tv_usec int
}
struct Uv_stat_t { 
	st_dev u64
	st_mode u64
	st_nlink u64
	st_uid u64
	st_gid u64
	st_rdev u64
	st_ino u64
	st_size u64
	st_blksize u64
	st_blocks u64
	st_flags u64
	st_gen u64
	st_atim Uv_timespec_t
	st_mtim Uv_timespec_t
	st_ctim Uv_timespec_t
	st_birthtim Uv_timespec_t
}
type Uv_fs_event_cb = fn (&Uv_fs_event_t, &i8, int, int)
type Uv_fs_poll_cb = fn (&Uv_fs_poll_t, int, &Uv_stat_t, &Uv_stat_t)
type Uv_signal_cb = fn (&Uv_signal_t, int)
enum Uv_membership {
	uv_leave_group = 0
	uv_join_group
}

fn C.uv_translate_sys_error(sys_errno int) int

pub fn uv_translate_sys_error(sys_errno int) int {
	return C.uv_translate_sys_error(sys_errno)
}

fn C.uv_strerror(err int) &i8

pub fn uv_strerror(err int) &i8 {
	return C.uv_strerror(err)
}

fn C.uv_strerror_r(err int, buf &i8, buflen usize) &i8

pub fn uv_strerror_r(err int, buf &i8, buflen usize) &i8 {
	return C.uv_strerror_r(err, buf, buflen)
}

fn C.uv_err_name(err int) &i8

pub fn uv_err_name(err int) &i8 {
	return C.uv_err_name(err)
}

fn C.uv_err_name_r(err int, buf &i8, buflen usize) &i8

pub fn uv_err_name_r(err int, buf &i8, buflen usize) &i8 {
	return C.uv_err_name_r(err, buf, buflen)
}

// public 
// read-only 
// private 
// Abstract base class of all requests. 
struct Uv_req_s { 
	data voidptr
	loop &Uv_loop_t
	type_ Uv_req_type
	reserved [6]voidptr
}
// Platform-specific request types. 
fn C.uv_shutdown(req &Uv_shutdown_t, handle &Uv_stream_t, cb Uv_shutdown_cb) int

pub fn uv_shutdown(req &Uv_shutdown_t, handle &Uv_stream_t, cb Uv_shutdown_cb) int {
	return C.uv_shutdown(req, handle, cb)
}

struct Uv_shutdown_s { 
	data voidptr
	loop &Uv_loop_t
	type_ Uv_req_type
	reserved [6]voidptr
	handle &Uv_stream_t
	cb Uv_shutdown_cb
}
// public 
// read-only 
// private 
// The abstract base class of all handles. 
struct Uv_handle_s { 
	data voidptr
	loop &Uv_loop_t
	type_ Uv_handle_type
	close_cb Uv_close_cb
	handle_queue Uv__queue
	next_closing &Uv_handle_t
	flags u32
}
fn C.uv_handle_size(type_ Uv_handle_type) usize

pub fn uv_handle_size(type_ Uv_handle_type) usize {
	return C.uv_handle_size(type_)
}

fn C.uv_handle_get_type(handle &Uv_handle_t) Uv_handle_type

pub fn uv_handle_get_type(handle &Uv_handle_t) Uv_handle_type {
	return C.uv_handle_get_type(handle)
}

fn C.uv_handle_type_name(type_ Uv_handle_type) &i8

pub fn uv_handle_type_name(type_ Uv_handle_type) &i8 {
	return C.uv_handle_type_name(type_)
}

fn C.uv_handle_get_data(handle &Uv_handle_t) voidptr

pub fn uv_handle_get_data(handle &Uv_handle_t) voidptr {
	return C.uv_handle_get_data(handle)
}

fn C.uv_handle_get_loop(handle &Uv_handle_t) &Uv_loop_t

pub fn uv_handle_get_loop(handle &Uv_handle_t) &Uv_loop_t {
	return C.uv_handle_get_loop(handle)
}

fn C.uv_handle_set_data(handle &Uv_handle_t, data voidptr)

pub fn uv_handle_set_data(handle &Uv_handle_t, data voidptr) {
	C.uv_handle_set_data(handle, data)
}

fn C.uv_req_size(type_ Uv_req_type) usize

pub fn uv_req_size(type_ Uv_req_type) usize {
	return C.uv_req_size(type_)
}

fn C.uv_req_get_data(req &Uv_req_t) voidptr

pub fn uv_req_get_data(req &Uv_req_t) voidptr {
	return C.uv_req_get_data(req)
}

fn C.uv_req_set_data(req &Uv_req_t, data voidptr)

pub fn uv_req_set_data(req &Uv_req_t, data voidptr) {
	C.uv_req_set_data(req, data)
}

fn C.uv_req_get_loop(handle &Uv_req_t) &Uv_loop_t

pub fn uv_req_get_loop(handle &Uv_req_t) &Uv_loop_t {
	return C.uv_req_get_loop(handle)
}

fn C.uv_req_get_type(req &Uv_req_t) Uv_req_type

pub fn uv_req_get_type(req &Uv_req_t) Uv_req_type {
	return C.uv_req_get_type(req)
}

fn C.uv_req_type_name(type_ Uv_req_type) &i8

pub fn uv_req_type_name(type_ Uv_req_type) &i8 {
	return C.uv_req_type_name(type_)
}

fn C.uv_is_active(handle &Uv_handle_t) int

pub fn uv_is_active(handle &Uv_handle_t) int {
	return C.uv_is_active(handle)
}

fn C.uv_walk(loop &Uv_loop_t, walk_cb Uv_walk_cb, arg voidptr)

pub fn uv_walk(loop &Uv_loop_t, walk_cb Uv_walk_cb, arg voidptr) {
	C.uv_walk(loop, walk_cb, arg)
}

// Helpers for ad hoc debugging, no API/ABI stability guaranteed. 
fn C.uv_print_all_handles(loop &Uv_loop_t, stream voidptr)

pub fn uv_print_all_handles(loop &Uv_loop_t, stream voidptr) {
	C.uv_print_all_handles(loop, stream)
}

fn C.uv_print_active_handles(loop &Uv_loop_t, stream voidptr)

pub fn uv_print_active_handles(loop &Uv_loop_t, stream voidptr) {
	C.uv_print_active_handles(loop, stream)
}

fn C.uv_close(handle &Uv_handle_t, close_cb Uv_close_cb)

pub fn uv_close(handle &Uv_handle_t, close_cb Uv_close_cb) {
	C.uv_close(handle, close_cb)
}

fn C.uv_send_buffer_size(handle &Uv_handle_t, value &int) int

pub fn uv_send_buffer_size(handle &Uv_handle_t, value &int) int {
	return C.uv_send_buffer_size(handle, value)
}

fn C.uv_recv_buffer_size(handle &Uv_handle_t, value &int) int

pub fn uv_recv_buffer_size(handle &Uv_handle_t, value &int) int {
	return C.uv_recv_buffer_size(handle, value)
}

fn C.uv_fileno(handle &Uv_handle_t, fd &Uv_os_fd_t) int

pub fn uv_fileno(handle &Uv_handle_t, fd &Uv_os_fd_t) int {
	return C.uv_fileno(handle, fd)
}

fn C.uv_buf_init(base &i8, len usize) Uv_buf_t

pub fn uv_buf_init(base &i8, len usize) Uv_buf_t {
	return C.uv_buf_init(base, len)
}

//
// *The following functions are declared 'static inline' to ensure that they
// *end up in the static linkage namespace of the caller and thus point to
// *the correct (caller's) copy of MSVCRT for resolving the `fd` pseudo-handle
// *to the intended kernel `HANDLE`.
// *Thus, they are also not included when building a shared library,
// *as their definition would not be correct when linked into that environment.
// 
// BUILDING_UV_SHARED 
fn C.uv_pipe(fds &Uv_os_fd_t, read_flags int, write_flags int) int

pub fn uv_pipe(fds &Uv_os_fd_t, read_flags int, write_flags int) int {
	return C.uv_pipe(fds, read_flags, write_flags)
}

fn C.uv_socketpair(type_ int, protocol int, socket_vector &Uv_os_sock_t, flags0 int, flags1 int) int

pub fn uv_socketpair(type_ int, protocol int, socket_vector &Uv_os_sock_t, flags0 int, flags1 int) int {
	return C.uv_socketpair(type_, protocol, socket_vector, flags0, flags1)
}

// number of bytes queued for writing 
// private 
//
// *uv_stream_t is a subclass of uv_handle_t.
// * *uv_stream is an abstract class.
// * *uv_stream_t is the parent class of uv_tcp_t, uv_pipe_t and uv_tty_t.
// 
struct Uv_stream_s { 
	data voidptr
	loop &Uv_loop_t
	type_ Uv_handle_type
	close_cb Uv_close_cb
	handle_queue Uv__queue
	next_closing &Uv_handle_t
	flags u32
	write_queue_size usize
	alloc_cb Uv_alloc_cb
	read_cb Uv_read_cb
	connect_req &Uv_connect_t
	shutdown_req &Uv_shutdown_t
	io_watcher Uv__io_t
	write_queue Uv__queue
	write_completed_queue Uv__queue
	connection_cb Uv_connection_cb
	delayed_error int
	accepted_fd int
	queued_fds voidptr
	select_ voidptr
}
fn C.uv_stream_get_write_queue_size(stream &Uv_stream_t) usize

pub fn uv_stream_get_write_queue_size(stream &Uv_stream_t) usize {
	return C.uv_stream_get_write_queue_size(stream)
}

fn C.uv_listen(stream &Uv_stream_t, backlog int, cb Uv_connection_cb) int

pub fn uv_listen(stream &Uv_stream_t, backlog int, cb Uv_connection_cb) int {
	return C.uv_listen(stream, backlog, cb)
}

fn C.uv_accept(server &Uv_stream_t, client &Uv_stream_t) int

pub fn uv_accept(server &Uv_stream_t, client &Uv_stream_t) int {
	return C.uv_accept(server, client)
}

fn C.uv_read_start(arg0 &Uv_stream_t, alloc_cb Uv_alloc_cb, read_cb Uv_read_cb) int

pub fn uv_read_start(arg0 &Uv_stream_t, alloc_cb Uv_alloc_cb, read_cb Uv_read_cb) int {
	return C.uv_read_start(arg0, alloc_cb, read_cb)
}

fn C.uv_read_stop(arg0 &Uv_stream_t) int

pub fn uv_read_stop(arg0 &Uv_stream_t) int {
	return C.uv_read_stop(arg0)
}

fn C.uv_write(req &Uv_write_t, handle &Uv_stream_t, bufs &Uv_buf_t, nbufs u32, cb Uv_write_cb) int

pub fn uv_write(req &Uv_write_t, handle &Uv_stream_t, bufs &Uv_buf_t, nbufs u32, cb Uv_write_cb) int {
	return C.uv_write(req, handle, bufs, nbufs, cb)
}

fn C.uv_write2(req &Uv_write_t, handle &Uv_stream_t, bufs &Uv_buf_t, nbufs u32, send_handle &Uv_stream_t, cb Uv_write_cb) int

pub fn uv_write2(req &Uv_write_t, handle &Uv_stream_t, bufs &Uv_buf_t, nbufs u32, send_handle &Uv_stream_t, cb Uv_write_cb) int {
	return C.uv_write2(req, handle, bufs, nbufs, send_handle, cb)
}

fn C.uv_try_write(handle &Uv_stream_t, bufs &Uv_buf_t, nbufs u32) int

pub fn uv_try_write(handle &Uv_stream_t, bufs &Uv_buf_t, nbufs u32) int {
	return C.uv_try_write(handle, bufs, nbufs)
}

fn C.uv_try_write2(handle &Uv_stream_t, bufs &Uv_buf_t, nbufs u32, send_handle &Uv_stream_t) int

pub fn uv_try_write2(handle &Uv_stream_t, bufs &Uv_buf_t, nbufs u32, send_handle &Uv_stream_t) int {
	return C.uv_try_write2(handle, bufs, nbufs, send_handle)
}

// uv_write_t is a subclass of uv_req_t. 
struct Uv_write_s { 
	data voidptr
	loop &Uv_loop_t
	type_ Uv_req_type
	reserved [6]voidptr
	cb Uv_write_cb
	send_handle &Uv_stream_t
// TODO: make private and unix-only in v2.x. 
	handle &Uv_stream_t
	queue Uv__queue
	write_index u32
	bufs &Uv_buf_t
	nbufs u32
	error int
	bufsml [4]Uv_buf_t
}
fn C.uv_is_readable(handle &Uv_stream_t) int

pub fn uv_is_readable(handle &Uv_stream_t) int {
	return C.uv_is_readable(handle)
}

fn C.uv_is_writable(handle &Uv_stream_t) int

pub fn uv_is_writable(handle &Uv_stream_t) int {
	return C.uv_is_writable(handle)
}

fn C.uv_stream_set_blocking(handle &Uv_stream_t, blocking int) int

pub fn uv_stream_set_blocking(handle &Uv_stream_t, blocking int) int {
	return C.uv_stream_set_blocking(handle, blocking)
}

fn C.uv_is_closing(handle &Uv_handle_t) int

pub fn uv_is_closing(handle &Uv_handle_t) int {
	return C.uv_is_closing(handle)
}

//
// *uv_tcp_t is a subclass of uv_stream_t.
// * *Represents a TCP stream or TCP server.
// 
struct Uv_tcp_s { 
	data voidptr
	loop &Uv_loop_t
	type_ Uv_handle_type
	close_cb Uv_close_cb
	handle_queue Uv__queue
	next_closing &Uv_handle_t
	flags u32
	write_queue_size usize
	alloc_cb Uv_alloc_cb
	read_cb Uv_read_cb
	connect_req &Uv_connect_t
	shutdown_req &Uv_shutdown_t
	io_watcher Uv__io_t
	write_queue Uv__queue
	write_completed_queue Uv__queue
	connection_cb Uv_connection_cb
	delayed_error int
	accepted_fd int
	queued_fds voidptr
	select_ voidptr
}
fn C.uv_tcp_init(arg0 &Uv_loop_t, handle &Uv_tcp_t) int

pub fn uv_tcp_init(arg0 &Uv_loop_t, handle &Uv_tcp_t) int {
	return C.uv_tcp_init(arg0, handle)
}

fn C.uv_tcp_init_ex(arg0 &Uv_loop_t, handle &Uv_tcp_t, flags u32) int

pub fn uv_tcp_init_ex(arg0 &Uv_loop_t, handle &Uv_tcp_t, flags u32) int {
	return C.uv_tcp_init_ex(arg0, handle, flags)
}

fn C.uv_tcp_open(handle &Uv_tcp_t, sock Uv_os_sock_t) int

pub fn uv_tcp_open(handle &Uv_tcp_t, sock Uv_os_sock_t) int {
	return C.uv_tcp_open(handle, sock)
}

fn C.uv_tcp_nodelay(handle &Uv_tcp_t, enable int) int

pub fn uv_tcp_nodelay(handle &Uv_tcp_t, enable int) int {
	return C.uv_tcp_nodelay(handle, enable)
}

fn C.uv_tcp_keepalive(handle &Uv_tcp_t, enable int, delay u32) int

pub fn uv_tcp_keepalive(handle &Uv_tcp_t, enable int, delay u32) int {
	return C.uv_tcp_keepalive(handle, enable, delay)
}

fn C.uv_tcp_simultaneous_accepts(handle &Uv_tcp_t, enable int) int

pub fn uv_tcp_simultaneous_accepts(handle &Uv_tcp_t, enable int) int {
	return C.uv_tcp_simultaneous_accepts(handle, enable)
}

enum Uv_tcp_flags {
// Used with uv_tcp_bind, when an IPv6 address is used. 
	uv_tcp_ipv_6_only = 1
}

fn C.uv_tcp_bind(handle &Uv_tcp_t, addr &Sockaddr, flags u32) int

pub fn uv_tcp_bind(handle &Uv_tcp_t, addr &Sockaddr, flags u32) int {
	return C.uv_tcp_bind(handle, addr, flags)
}

fn C.uv_tcp_getsockname(handle &Uv_tcp_t, name &Sockaddr, namelen &int) int

pub fn uv_tcp_getsockname(handle &Uv_tcp_t, name &Sockaddr, namelen &int) int {
	return C.uv_tcp_getsockname(handle, name, namelen)
}

fn C.uv_tcp_getpeername(handle &Uv_tcp_t, name &Sockaddr, namelen &int) int

pub fn uv_tcp_getpeername(handle &Uv_tcp_t, name &Sockaddr, namelen &int) int {
	return C.uv_tcp_getpeername(handle, name, namelen)
}

fn C.uv_tcp_close_reset(handle &Uv_tcp_t, close_cb Uv_close_cb) int

pub fn uv_tcp_close_reset(handle &Uv_tcp_t, close_cb Uv_close_cb) int {
	return C.uv_tcp_close_reset(handle, close_cb)
}

fn C.uv_tcp_connect(req &Uv_connect_t, handle &Uv_tcp_t, addr &Sockaddr, cb Uv_connect_cb) int

pub fn uv_tcp_connect(req &Uv_connect_t, handle &Uv_tcp_t, addr &Sockaddr, cb Uv_connect_cb) int {
	return C.uv_tcp_connect(req, handle, addr, cb)
}

// uv_connect_t is a subclass of uv_req_t. 
struct Uv_connect_s { 
	data voidptr
	loop &Uv_loop_t
	type_ Uv_req_type
	reserved [6]voidptr
	cb Uv_connect_cb
	handle &Uv_stream_t
	queue Uv__queue
}
//
// *UDP support.
// 
enum Uv_udp_send_cb {
// Disables dual stack mode. 
	uv_udp_ipv_6_only = 1
//
//   *Indicates message was truncated because read buffer was too small. The
//   *remainder was discarded by the OS. Used in uv_udp_recv_cb.
//   
	uv_udp_partial = 2
//
//   *Indicates if SO_REUSEADDR will be set when binding the handle.
//   *This sets the SO_REUSEPORT socket flag on the BSDs and OS X. On other
//   *Unix platforms, it sets the SO_REUSEADDR flag.  What that means is that
//   *multiple threads or processes can bind to the same address without error
//   *(provided they all set the flag) but only the last one to bind will receive
//   *any traffic, in effect "stealing" the port from the previous listener.
//   
	uv_udp_reuseaddr = 4
//
//   *Indicates that the message was received by recvmmsg, so the buffer provided
//   *must not be freed by the recv_cb callback.
//   
	uv_udp_mmsg_chunk = 8
//
//   *Indicates that the buffer provided has been fully utilized by recvmmsg and
//   *that it should now be freed by the recv_cb callback. When this flag is set
//   *in uv_udp_recv_cb, nread will always be 0 and addr will always be NULL.
//   
	uv_udp_mmsg_free = 16
//
//   *Indicates if IP_RECVERR/IPV6_RECVERR will be set when binding the handle.
//   *This sets IP_RECVERR for IPv4 and IPV6_RECVERR for IPv6 UDP sockets on
//   *Linux. This stops the Linux kernel from suppressing some ICMP error
//   *messages and enables full ICMP error reporting for faster failover.
//   *This flag is no-op on platforms other than Linux.
//   
	uv_udp_linux_recverr = 32
//
//   *Indicates that recvmmsg should be used, if available.
//   
	uv_udp_recvmmsg = 256
}

type Uv_udp_recv_cb = fn (&Uv_udp_t, isize, &Uv_buf_t, &Sockaddr, u32)
// uv_udp_t is a subclass of uv_handle_t. 
struct Uv_udp_s { 
	data voidptr
	loop &Uv_loop_t
	type_ Uv_handle_type
	close_cb Uv_close_cb
	handle_queue Uv__queue
	next_closing &Uv_handle_t
	flags u32
// read-only 
//
//   *Number of bytes queued for sending. This field strictly shows how much
//   *information is currently queued.
//   
	send_queue_size usize
//
//   *Number of send requests currently in the queue awaiting to be processed.
//   
	send_queue_count usize
	alloc_cb Uv_alloc_cb
	recv_cb Uv_udp_recv_cb
	io_watcher Uv__io_t
	write_queue Uv__queue
	write_completed_queue Uv__queue
}
// uv_udp_send_t is a subclass of uv_req_t. 
struct Uv_udp_send_s { 
	data voidptr
	loop &Uv_loop_t
	type_ Uv_req_type
	reserved [6]voidptr
	handle &Uv_udp_t
	cb Uv_udp_send_cb
	queue Uv__queue
	addr Sockaddr_storage
	nbufs u32
	bufs &Uv_buf_t
	status isize
	send_cb Uv_udp_send_cb
	bufsml [4]Uv_buf_t
}
fn C.uv_udp_init(arg0 &Uv_loop_t, handle &Uv_udp_t) int

pub fn uv_udp_init(arg0 &Uv_loop_t, handle &Uv_udp_t) int {
	return C.uv_udp_init(arg0, handle)
}

fn C.uv_udp_init_ex(arg0 &Uv_loop_t, handle &Uv_udp_t, flags u32) int

pub fn uv_udp_init_ex(arg0 &Uv_loop_t, handle &Uv_udp_t, flags u32) int {
	return C.uv_udp_init_ex(arg0, handle, flags)
}

fn C.uv_udp_open(handle &Uv_udp_t, sock Uv_os_sock_t) int

pub fn uv_udp_open(handle &Uv_udp_t, sock Uv_os_sock_t) int {
	return C.uv_udp_open(handle, sock)
}

fn C.uv_udp_bind(handle &Uv_udp_t, addr &Sockaddr, flags u32) int

pub fn uv_udp_bind(handle &Uv_udp_t, addr &Sockaddr, flags u32) int {
	return C.uv_udp_bind(handle, addr, flags)
}

fn C.uv_udp_connect(handle &Uv_udp_t, addr &Sockaddr) int

pub fn uv_udp_connect(handle &Uv_udp_t, addr &Sockaddr) int {
	return C.uv_udp_connect(handle, addr)
}

fn C.uv_udp_getpeername(handle &Uv_udp_t, name &Sockaddr, namelen &int) int

pub fn uv_udp_getpeername(handle &Uv_udp_t, name &Sockaddr, namelen &int) int {
	return C.uv_udp_getpeername(handle, name, namelen)
}

fn C.uv_udp_getsockname(handle &Uv_udp_t, name &Sockaddr, namelen &int) int

pub fn uv_udp_getsockname(handle &Uv_udp_t, name &Sockaddr, namelen &int) int {
	return C.uv_udp_getsockname(handle, name, namelen)
}

fn C.uv_udp_set_membership(handle &Uv_udp_t, multicast_addr &i8, interface_addr &i8, membership Uv_membership) int

pub fn uv_udp_set_membership(handle &Uv_udp_t, multicast_addr &i8, interface_addr &i8, membership Uv_membership) int {
	return C.uv_udp_set_membership(handle, multicast_addr, interface_addr, membership)
}

fn C.uv_udp_set_source_membership(handle &Uv_udp_t, multicast_addr &i8, interface_addr &i8, source_addr &i8, membership Uv_membership) int

pub fn uv_udp_set_source_membership(handle &Uv_udp_t, multicast_addr &i8, interface_addr &i8, source_addr &i8, membership Uv_membership) int {
	return C.uv_udp_set_source_membership(handle, multicast_addr, interface_addr, source_addr, membership)
}

fn C.uv_udp_set_multicast_loop(handle &Uv_udp_t, on int) int

pub fn uv_udp_set_multicast_loop(handle &Uv_udp_t, on int) int {
	return C.uv_udp_set_multicast_loop(handle, on)
}

fn C.uv_udp_set_multicast_ttl(handle &Uv_udp_t, ttl int) int

pub fn uv_udp_set_multicast_ttl(handle &Uv_udp_t, ttl int) int {
	return C.uv_udp_set_multicast_ttl(handle, ttl)
}

fn C.uv_udp_set_multicast_interface(handle &Uv_udp_t, interface_addr &i8) int

pub fn uv_udp_set_multicast_interface(handle &Uv_udp_t, interface_addr &i8) int {
	return C.uv_udp_set_multicast_interface(handle, interface_addr)
}

fn C.uv_udp_set_broadcast(handle &Uv_udp_t, on int) int

pub fn uv_udp_set_broadcast(handle &Uv_udp_t, on int) int {
	return C.uv_udp_set_broadcast(handle, on)
}

fn C.uv_udp_set_ttl(handle &Uv_udp_t, ttl int) int

pub fn uv_udp_set_ttl(handle &Uv_udp_t, ttl int) int {
	return C.uv_udp_set_ttl(handle, ttl)
}

fn C.uv_udp_send(req &Uv_udp_send_t, handle &Uv_udp_t, bufs &Uv_buf_t, nbufs u32, addr &Sockaddr, send_cb Uv_udp_send_cb) int

pub fn uv_udp_send(req &Uv_udp_send_t, handle &Uv_udp_t, bufs &Uv_buf_t, nbufs u32, addr &Sockaddr, send_cb Uv_udp_send_cb) int {
	return C.uv_udp_send(req, handle, bufs, nbufs, addr, send_cb)
}

fn C.uv_udp_try_send(handle &Uv_udp_t, bufs &Uv_buf_t, nbufs u32, addr &Sockaddr) int

pub fn uv_udp_try_send(handle &Uv_udp_t, bufs &Uv_buf_t, nbufs u32, addr &Sockaddr) int {
	return C.uv_udp_try_send(handle, bufs, nbufs, addr)
}

fn C.uv_udp_recv_start(handle &Uv_udp_t, alloc_cb Uv_alloc_cb, recv_cb Uv_udp_recv_cb) int

pub fn uv_udp_recv_start(handle &Uv_udp_t, alloc_cb Uv_alloc_cb, recv_cb Uv_udp_recv_cb) int {
	return C.uv_udp_recv_start(handle, alloc_cb, recv_cb)
}

fn C.uv_udp_using_recvmmsg(handle &Uv_udp_t) int

pub fn uv_udp_using_recvmmsg(handle &Uv_udp_t) int {
	return C.uv_udp_using_recvmmsg(handle)
}

fn C.uv_udp_recv_stop(handle &Uv_udp_t) int

pub fn uv_udp_recv_stop(handle &Uv_udp_t) int {
	return C.uv_udp_recv_stop(handle)
}

fn C.uv_udp_get_send_queue_size(handle &Uv_udp_t) usize

pub fn uv_udp_get_send_queue_size(handle &Uv_udp_t) usize {
	return C.uv_udp_get_send_queue_size(handle)
}

fn C.uv_udp_get_send_queue_count(handle &Uv_udp_t) usize

pub fn uv_udp_get_send_queue_count(handle &Uv_udp_t) usize {
	return C.uv_udp_get_send_queue_count(handle)
}

//
// *uv_tty_t is a subclass of uv_stream_t.
// * *Representing a stream for the console.
// 
struct Uv_tty_s { 
	data voidptr
	loop &Uv_loop_t
	type_ Uv_handle_type
	close_cb Uv_close_cb
	handle_queue Uv__queue
	next_closing &Uv_handle_t
	flags u32
	write_queue_size usize
	alloc_cb Uv_alloc_cb
	read_cb Uv_read_cb
	connect_req &Uv_connect_t
	shutdown_req &Uv_shutdown_t
	io_watcher Uv__io_t
	write_queue Uv__queue
	write_completed_queue Uv__queue
	connection_cb Uv_connection_cb
	delayed_error int
	accepted_fd int
	queued_fds voidptr
	select_ voidptr
	orig_termios Termios
	mode int
}
enum Uv_tty_mode_t {
// Initial/normal terminal mode 
	uv_tty_mode_normal
// Raw input mode (On Windows, ENABLE_WINDOW_INPUT is also enabled) 
	uv_tty_mode_raw
// Binary-safe I/O mode for IPC (Unix-only) 
	uv_tty_mode_io
}

enum Uv_tty_vtermstate_t {
//
//   *The console supports handling of virtual terminal sequences
//   *(Windows10 new console, ConEmu)
//   
	uv_tty_supported
// The console cannot process the virtual terminal sequence.  (Legacy
//   *console)
//   
	uv_tty_unsupported
}

fn C.uv_tty_init(arg0 &Uv_loop_t, arg1 &Uv_tty_t, fd Uv_os_fd_t, readable int) int

pub fn uv_tty_init(arg0 &Uv_loop_t, arg1 &Uv_tty_t, fd Uv_os_fd_t, readable int) int {
	return C.uv_tty_init(arg0, arg1, fd, readable)
}

fn C.uv_tty_set_mode(arg0 &Uv_tty_t, mode Uv_tty_mode_t) int

pub fn uv_tty_set_mode(arg0 &Uv_tty_t, mode Uv_tty_mode_t) int {
	return C.uv_tty_set_mode(arg0, mode)
}

fn C.uv_tty_reset_mode() int

pub fn uv_tty_reset_mode() int {
	return C.uv_tty_reset_mode()
}

fn C.uv_tty_get_winsize(arg0 &Uv_tty_t, width &int, height &int) int

pub fn uv_tty_get_winsize(arg0 &Uv_tty_t, width &int, height &int) int {
	return C.uv_tty_get_winsize(arg0, width, height)
}

fn C.uv_tty_set_vterm_state(state Uv_tty_vtermstate_t)

pub fn uv_tty_set_vterm_state(state Uv_tty_vtermstate_t) {
	C.uv_tty_set_vterm_state(state)
}

fn C.uv_tty_get_vterm_state(state &Uv_tty_vtermstate_t) int

pub fn uv_tty_get_vterm_state(state &Uv_tty_vtermstate_t) int {
	return C.uv_tty_get_vterm_state(state)
}

fn C.uv_guess_handle(file Uv_os_fd_t) Uv_handle_type

pub fn uv_guess_handle(file Uv_os_fd_t) Uv_handle_type {
	return C.uv_guess_handle(file)
}


const ( // empty enum
	uv_pipe_no_truncate
)

//
// *uv_pipe_t is a subclass of uv_stream_t.
// * *Representing a pipe stream or pipe server. On Windows this is a Named
// *Pipe. On Unix this is a Unix domain socket.
// 
struct Uv_pipe_s { 
	data voidptr
	loop &Uv_loop_t
	type_ Uv_handle_type
	close_cb Uv_close_cb
	handle_queue Uv__queue
	next_closing &Uv_handle_t
	flags u32
	write_queue_size usize
	alloc_cb Uv_alloc_cb
	read_cb Uv_read_cb
	connect_req &Uv_connect_t
	shutdown_req &Uv_shutdown_t
	io_watcher Uv__io_t
	write_queue Uv__queue
	write_completed_queue Uv__queue
	connection_cb Uv_connection_cb
	delayed_error int
	accepted_fd int
	queued_fds voidptr
	select_ voidptr
	ipc int
// non-zero if this pipe is used for passing handles 
	pipe_fname &i8
}
fn C.uv_pipe_init(arg0 &Uv_loop_t, handle &Uv_pipe_t, ipc int) int

pub fn uv_pipe_init(arg0 &Uv_loop_t, handle &Uv_pipe_t, ipc int) int {
	return C.uv_pipe_init(arg0, handle, ipc)
}

fn C.uv_pipe_open(arg0 &Uv_pipe_t, file Uv_os_fd_t) int

pub fn uv_pipe_open(arg0 &Uv_pipe_t, file Uv_os_fd_t) int {
	return C.uv_pipe_open(arg0, file)
}

fn C.uv_pipe_bind(handle &Uv_pipe_t, name &i8) int

pub fn uv_pipe_bind(handle &Uv_pipe_t, name &i8) int {
	return C.uv_pipe_bind(handle, name)
}

fn C.uv_pipe_bind2(handle &Uv_pipe_t, name &i8, namelen usize, flags u32) int

pub fn uv_pipe_bind2(handle &Uv_pipe_t, name &i8, namelen usize, flags u32) int {
	return C.uv_pipe_bind2(handle, name, namelen, flags)
}

fn C.uv_pipe_connect(req &Uv_connect_t, handle &Uv_pipe_t, name &i8, cb Uv_connect_cb)

pub fn uv_pipe_connect(req &Uv_connect_t, handle &Uv_pipe_t, name &i8, cb Uv_connect_cb) {
	C.uv_pipe_connect(req, handle, name, cb)
}

fn C.uv_pipe_connect2(req &Uv_connect_t, handle &Uv_pipe_t, name &i8, namelen usize, flags u32, cb Uv_connect_cb) int

pub fn uv_pipe_connect2(req &Uv_connect_t, handle &Uv_pipe_t, name &i8, namelen usize, flags u32, cb Uv_connect_cb) int {
	return C.uv_pipe_connect2(req, handle, name, namelen, flags, cb)
}

fn C.uv_pipe_getsockname(handle &Uv_pipe_t, buffer &i8, size &usize) int

pub fn uv_pipe_getsockname(handle &Uv_pipe_t, buffer &i8, size &usize) int {
	return C.uv_pipe_getsockname(handle, buffer, size)
}

fn C.uv_pipe_getpeername(handle &Uv_pipe_t, buffer &i8, size &usize) int

pub fn uv_pipe_getpeername(handle &Uv_pipe_t, buffer &i8, size &usize) int {
	return C.uv_pipe_getpeername(handle, buffer, size)
}

fn C.uv_pipe_pending_instances(handle &Uv_pipe_t, count int)

pub fn uv_pipe_pending_instances(handle &Uv_pipe_t, count int) {
	C.uv_pipe_pending_instances(handle, count)
}

fn C.uv_pipe_pending_count(handle &Uv_pipe_t) int

pub fn uv_pipe_pending_count(handle &Uv_pipe_t) int {
	return C.uv_pipe_pending_count(handle)
}

fn C.uv_pipe_pending_type(handle &Uv_pipe_t) Uv_handle_type

pub fn uv_pipe_pending_type(handle &Uv_pipe_t) Uv_handle_type {
	return C.uv_pipe_pending_type(handle)
}

fn C.uv_pipe_chmod(handle &Uv_pipe_t, flags int) int

pub fn uv_pipe_chmod(handle &Uv_pipe_t, flags int) int {
	return C.uv_pipe_chmod(handle, flags)
}

struct Uv_poll_s { 
	data voidptr
	loop &Uv_loop_t
	type_ Uv_handle_type
	close_cb Uv_close_cb
	handle_queue Uv__queue
	next_closing &Uv_handle_t
	flags u32
	poll_cb Uv_poll_cb
	io_watcher Uv__io_t
}
enum Uv_poll_event {
	uv_readable = 1
	uv_writable = 2
	uv_disconnect = 4
	uv_prioritized = 8
}

fn C.uv_poll_init(loop &Uv_loop_t, handle &Uv_poll_t, socket Uv_os_sock_t) int

pub fn uv_poll_init(loop &Uv_loop_t, handle &Uv_poll_t, socket Uv_os_sock_t) int {
	return C.uv_poll_init(loop, handle, socket)
}

fn C.uv_poll_start(handle &Uv_poll_t, events int, cb Uv_poll_cb) int

pub fn uv_poll_start(handle &Uv_poll_t, events int, cb Uv_poll_cb) int {
	return C.uv_poll_start(handle, events, cb)
}

fn C.uv_poll_stop(handle &Uv_poll_t) int

pub fn uv_poll_stop(handle &Uv_poll_t) int {
	return C.uv_poll_stop(handle)
}

struct Uv_prepare_s { 
	data voidptr
	loop &Uv_loop_t
	type_ Uv_handle_type
	close_cb Uv_close_cb
	handle_queue Uv__queue
	next_closing &Uv_handle_t
	flags u32
	prepare_cb Uv_prepare_cb
	queue Uv__queue
}
fn C.uv_prepare_init(arg0 &Uv_loop_t, prepare &Uv_prepare_t) int

pub fn uv_prepare_init(arg0 &Uv_loop_t, prepare &Uv_prepare_t) int {
	return C.uv_prepare_init(arg0, prepare)
}

fn C.uv_prepare_start(prepare &Uv_prepare_t, cb Uv_prepare_cb) int

pub fn uv_prepare_start(prepare &Uv_prepare_t, cb Uv_prepare_cb) int {
	return C.uv_prepare_start(prepare, cb)
}

fn C.uv_prepare_stop(prepare &Uv_prepare_t) int

pub fn uv_prepare_stop(prepare &Uv_prepare_t) int {
	return C.uv_prepare_stop(prepare)
}

struct Uv_check_s { 
	data voidptr
	loop &Uv_loop_t
	type_ Uv_handle_type
	close_cb Uv_close_cb
	handle_queue Uv__queue
	next_closing &Uv_handle_t
	flags u32
	check_cb Uv_check_cb
	queue Uv__queue
}
fn C.uv_check_init(arg0 &Uv_loop_t, check &Uv_check_t) int

pub fn uv_check_init(arg0 &Uv_loop_t, check &Uv_check_t) int {
	return C.uv_check_init(arg0, check)
}

fn C.uv_check_start(check &Uv_check_t, cb Uv_check_cb) int

pub fn uv_check_start(check &Uv_check_t, cb Uv_check_cb) int {
	return C.uv_check_start(check, cb)
}

fn C.uv_check_stop(check &Uv_check_t) int

pub fn uv_check_stop(check &Uv_check_t) int {
	return C.uv_check_stop(check)
}

struct Uv_idle_s { 
	data voidptr
	loop &Uv_loop_t
	type_ Uv_handle_type
	close_cb Uv_close_cb
	handle_queue Uv__queue
	next_closing &Uv_handle_t
	flags u32
	idle_cb Uv_idle_cb
	queue Uv__queue
}
fn C.uv_idle_init(arg0 &Uv_loop_t, idle &Uv_idle_t) int

pub fn uv_idle_init(arg0 &Uv_loop_t, idle &Uv_idle_t) int {
	return C.uv_idle_init(arg0, idle)
}

fn C.uv_idle_start(idle &Uv_idle_t, cb Uv_idle_cb) int

pub fn uv_idle_start(idle &Uv_idle_t, cb Uv_idle_cb) int {
	return C.uv_idle_start(idle, cb)
}

fn C.uv_idle_stop(idle &Uv_idle_t) int

pub fn uv_idle_stop(idle &Uv_idle_t) int {
	return C.uv_idle_stop(idle)
}

struct Uv_async_s { 
	data voidptr
	loop &Uv_loop_t
	type_ Uv_handle_type
	close_cb Uv_close_cb
	handle_queue Uv__queue
	next_closing &Uv_handle_t
	flags u32
	async_cb Uv_async_cb
	queue Uv__queue
	busy int
	pending int
}
fn C.uv_async_init(arg0 &Uv_loop_t, async &Uv_async_t, async_cb Uv_async_cb) int

pub fn uv_async_init(arg0 &Uv_loop_t, async &Uv_async_t, async_cb Uv_async_cb) int {
	return C.uv_async_init(arg0, async, async_cb)
}

fn C.uv_async_send(async &Uv_async_t) int

pub fn uv_async_send(async &Uv_async_t) int {
	return C.uv_async_send(async)
}

//
// *uv_timer_t is a subclass of uv_handle_t.
// * *Used to get woken up at a specified time in the future.
// 
struct Uv_timer_s { 
	data voidptr
	loop &Uv_loop_t
	type_ Uv_handle_type
	close_cb Uv_close_cb
	handle_queue Uv__queue
	next_closing &Uv_handle_t
	flags u32
	timer_cb Uv_timer_cb
	node Union (unnamed union at /Users/daniel/homelab/GitHub/languages/v-projects/vlibuv/thirdparty/include/uv.h
	timeout u64
	repeat u64
	start_id u64
}
fn C.uv_timer_init(arg0 &Uv_loop_t, handle &Uv_timer_t) int

pub fn uv_timer_init(arg0 &Uv_loop_t, handle &Uv_timer_t) int {
	return C.uv_timer_init(arg0, handle)
}

fn C.uv_timer_start(handle &Uv_timer_t, cb Uv_timer_cb, timeout u64, repeat u64) int

pub fn uv_timer_start(handle &Uv_timer_t, cb Uv_timer_cb, timeout u64, repeat u64) int {
	return C.uv_timer_start(handle, cb, timeout, repeat)
}

fn C.uv_timer_stop(handle &Uv_timer_t) int

pub fn uv_timer_stop(handle &Uv_timer_t) int {
	return C.uv_timer_stop(handle)
}

fn C.uv_timer_again(handle &Uv_timer_t) int

pub fn uv_timer_again(handle &Uv_timer_t) int {
	return C.uv_timer_again(handle)
}

fn C.uv_timer_set_repeat(handle &Uv_timer_t, repeat u64)

pub fn uv_timer_set_repeat(handle &Uv_timer_t, repeat u64) {
	C.uv_timer_set_repeat(handle, repeat)
}

fn C.uv_timer_get_repeat(handle &Uv_timer_t) u64

pub fn uv_timer_get_repeat(handle &Uv_timer_t) u64 {
	return C.uv_timer_get_repeat(handle)
}

fn C.uv_timer_get_due_in(handle &Uv_timer_t) u64

pub fn uv_timer_get_due_in(handle &Uv_timer_t) u64 {
	return C.uv_timer_get_due_in(handle)
}

//
// *uv_getaddrinfo_t is a subclass of uv_req_t.
// * *Request object for uv_getaddrinfo.
// 
struct Uv_getaddrinfo_s { 
	data voidptr
	loop &Uv_loop_t
	type_ Uv_req_type
	reserved [6]voidptr
// read-only 
// struct addrinfo*addrinfo is marked as private, but it really isn't. 
	work_req Uv__work
	cb Uv_getaddrinfo_cb
	hints &Addrinfo
	hostname &i8
	service &i8
	addrinfo &Addrinfo
	retcode int
}
fn C.uv_getaddrinfo(loop &Uv_loop_t, req &Uv_getaddrinfo_t, getaddrinfo_cb Uv_getaddrinfo_cb, node &i8, service &i8, hints &Addrinfo) int

pub fn uv_getaddrinfo(loop &Uv_loop_t, req &Uv_getaddrinfo_t, getaddrinfo_cb Uv_getaddrinfo_cb, node &i8, service &i8, hints &Addrinfo) int {
	return C.uv_getaddrinfo(loop, req, getaddrinfo_cb, node, service, hints)
}

fn C.uv_freeaddrinfo(ai &Addrinfo)

pub fn uv_freeaddrinfo(ai &Addrinfo) {
	C.uv_freeaddrinfo(ai)
}

//
//*uv_getnameinfo_t is a subclass of uv_req_t.
//**Request object for uv_getnameinfo.
//
struct Uv_getnameinfo_s { 
	data voidptr
	loop &Uv_loop_t
	type_ Uv_req_type
	reserved [6]voidptr
// read-only 
// host and service are marked as private, but they really aren't. 
	work_req Uv__work
	getnameinfo_cb Uv_getnameinfo_cb
	storage Sockaddr_storage
	flags int
	host [1025]i8
	service [32]i8
	retcode int
}
fn C.uv_getnameinfo(loop &Uv_loop_t, req &Uv_getnameinfo_t, getnameinfo_cb Uv_getnameinfo_cb, addr &Sockaddr, flags int) int

pub fn uv_getnameinfo(loop &Uv_loop_t, req &Uv_getnameinfo_t, getnameinfo_cb Uv_getnameinfo_cb, addr &Sockaddr, flags int) int {
	return C.uv_getnameinfo(loop, req, getnameinfo_cb, addr, flags)
}

// uv_spawn() options. 
enum Uv_stdio_flags {
	uv_ignore = 0
	uv_create_pipe = 1
	uv_inherit_fd = 2
	uv_inherit_stream = 4
//
//   *When UV_CREATE_PIPE is specified, UV_READABLE_PIPE and UV_WRITABLE_PIPE
//   *determine the direction of flow, from the child process' perspective. Both
//   *flags may be specified to create a duplex data stream.
//   
	uv_readable_pipe = 16
	uv_writable_pipe = 32
//
//   *When UV_CREATE_PIPE is specified, specifying UV_NONBLOCK_PIPE opens the
//   *handle in non-blocking mode in the child. This may cause loss of data,
//   *if the child is not designed to handle to encounter this mode,
//   *but can also be significantly more efficient.
//   
	uv_nonblock_pipe = 64
	uv_overlapped_pipe = 64
// old name, for compatibility 
	
}

struct Uv_stdio_container_t { 
	flags Uv_stdio_flags
	data Union (unnamed union at /Users/daniel/homelab/GitHub/languages/v-projects/vlibuv/thirdparty/include/uv.h
}
struct Uv_process_options_t { 
	exit_cb Uv_exit_cb
// Called after the process exits. 
	file &i8
// Path to program to execute. 
//
//   *Command line arguments. args[0] should be the path to the program. On
//   *Windows this uses CreateProcess which concatenates the arguments into a
//   *string this can cause some strange errors. See the note at
//   *windows_verbatim_arguments.
//   
	args &&u8
//
//   *This will be set as the environ variable in the subprocess. If this is
//   *NULL then the parents environ will be used.
//   
	env &&u8
//
//   *If non-null this represents a directory the subprocess should execute
//   *in. Stands for current working directory.
//   
	cwd &i8
//
//   *Various flags that control how uv_spawn() behaves. See the definition of
//   *`enum uv_process_flags` below.
//   
	flags u32
//
//   *The `stdio` field points to an array of uv_stdio_container_t structs that
//   *describe the file descriptors that will be made available to the child
//   *process. The convention is that stdio[0] points to stdin, fd 1 is used for
//   *stdout, and fd 2 is stderr.
//   *   *Note that on windows file descriptors greater than 2 are available to the
//   *child process only if the child processes uses the MSVCRT runtime.
//   
	stdio_count int
	stdio &Uv_stdio_container_t
//
//   *Libuv can change the child process' user/group id. This happens only when
//   *the appropriate bits are set in the flags fields. This is not supported on
//   *windows; uv_spawn() will fail and set the error to UV_ENOTSUP.
//   
	uid Uv_uid_t
	gid Uv_gid_t
//
//    Libuv can set the child process' CPU affinity mask.  This happens when
//    `cpumask` is non-NULL.  It must point to an array of char values
//    of length `cpumask_size`, whose value must be at least that returned by
//    uv_cpumask_size().  Each byte in the mask can be either zero (false)
//    or non-zero (true) to indicate whether the corresponding processor at
//    that index is included.
//
//    If enabled on an unsupported platform, uv_spawn() will fail with
//    UV_ENOTSUP.
//   
	cpumask &i8
	cpumask_size usize
}
//
// *These are the flags that can be used for the uv_process_options.flags field.
// 
enum Uv_process_flags {
//
//   *Set the child process' user id. The user id is supplied in the `uid` field
//   *of the options struct. This does not work on windows; setting this flag
//   *will cause uv_spawn() to fail.
//   
	uv_process_setuid = 1 << 0
//
//   *Set the child process' group id. The user id is supplied in the `gid`
//   *field of the options struct. This does not work on windows; setting this
//   *flag will cause uv_spawn() to fail.
//   
	uv_process_setgid = 1 << 1
//
//   *Do not wrap any arguments in quotes, or perform any other escaping, when
//   *converting the argument list into a command line string. This option is
//   *only meaningful on Windows systems. On Unix it is silently ignored.
//   
	uv_process_windows_verbatim_arguments = 1 << 2
//
//   *Spawn the child process in a detached state - this will make it a process
//   *group leader, and will effectively enable the child to keep running after
//   *the parent exits.  Note that the child process will still keep the
//   *parent's event loop alive unless the parent process calls uv_unref() on
//   *the child's process handle.
//   
	uv_process_detached = 1 << 3
//
//   *Hide the subprocess window that would normally be created. This option is
//   *only meaningful on Windows systems. On Unix it is silently ignored.
//   
	uv_process_windows_hide = 1 << 4
//
//   *Hide the subprocess console window that would normally be created. This
//   *option is only meaningful on Windows systems. On Unix it is silently
//   *ignored.
//   
	uv_process_windows_hide_console = 1 << 5
//
//   *Hide the subprocess GUI window that would normally be created. This
//   *option is only meaningful on Windows systems. On Unix it is silently
//   *ignored.
//   
	uv_process_windows_hide_gui = 1 << 6
//
//   *On Windows, if the path to the program to execute, specified in
//   *uv_process_options_t's file field, has a directory component,
//   *search for the exact file name before trying variants with
//   *extensions like '.exe' or '.cmd'.
//   
	uv_process_windows_file_path_exact_name = 1 << 7
}

//
// *uv_process_t is a subclass of uv_handle_t.
// 
struct Uv_process_s { 
	data voidptr
	loop &Uv_loop_t
	type_ Uv_handle_type
	close_cb Uv_close_cb
	handle_queue Uv__queue
	next_closing &Uv_handle_t
	flags u32
	exit_cb Uv_exit_cb
	pid int
	queue Uv__queue
	status int
}
fn C.uv_spawn(loop &Uv_loop_t, handle &Uv_process_t, options &Uv_process_options_t) int

pub fn uv_spawn(loop &Uv_loop_t, handle &Uv_process_t, options &Uv_process_options_t) int {
	return C.uv_spawn(loop, handle, options)
}

fn C.uv_process_kill(arg0 &Uv_process_t, signum int) int

pub fn uv_process_kill(arg0 &Uv_process_t, signum int) int {
	return C.uv_process_kill(arg0, signum)
}

fn C.uv_kill(pid int, signum int) int

pub fn uv_kill(pid int, signum int) int {
	return C.uv_kill(pid, signum)
}

fn C.uv_process_get_pid(arg0 &Uv_process_t) Uv_pid_t

pub fn uv_process_get_pid(arg0 &Uv_process_t) Uv_pid_t {
	return C.uv_process_get_pid(arg0)
}

//
// *uv_work_t is a subclass of uv_req_t.
// 
struct Uv_work_s { 
	data voidptr
	loop &Uv_loop_t
	type_ Uv_req_type
	reserved [6]voidptr
	work_cb Uv_work_cb
	after_work_cb Uv_after_work_cb
	work_req Uv__work
}
fn C.uv_queue_work(loop &Uv_loop_t, req &Uv_work_t, work_cb Uv_work_cb, after_work_cb Uv_after_work_cb) int

pub fn uv_queue_work(loop &Uv_loop_t, req &Uv_work_t, work_cb Uv_work_cb, after_work_cb Uv_after_work_cb) int {
	return C.uv_queue_work(loop, req, work_cb, after_work_cb)
}

fn C.uv_cancel(req &Uv_req_t) int

pub fn uv_cancel(req &Uv_req_t) int {
	return C.uv_cancel(req)
}

struct Uv_cpu_times_s { 
	user u64
// milliseconds 
	nice u64
// milliseconds 
	sys u64
// milliseconds 
	idle u64
// milliseconds 
	irq u64
// milliseconds 
}
struct Uv_cpu_info_s { 
	model &i8
	speed int
	cpu_times Uv_cpu_times_t
}
//
// *IPv6 doesn't support broadcast but this is the closest thing
// 
struct Uv_interface_address_s { 
	name &i8
	phys_addr [6]i8
	is_internal int
	address Union (unnamed union at /Users/daniel/homelab/GitHub/languages/v-projects/vlibuv/thirdparty/include/uv.h
	netmask Union (unnamed union at /Users/daniel/homelab/GitHub/languages/v-projects/vlibuv/thirdparty/include/uv.h
	broadcast Union (unnamed union at /Users/daniel/homelab/GitHub/languages/v-projects/vlibuv/thirdparty/include/uv.h
}
struct Uv_passwd_s { 
	username &i8
	uid u32
	gid u32
	shell &i8
	homedir &i8
	gecos &i8
}
struct Uv_group_s { 
	groupname &i8
	gid u32
	members &&u8
}
struct Uv_utsname_s { 
	sysname [256]i8
	release [256]i8
	version [256]i8
	machine [256]i8
// This struct does not contain the nodename and domainname fields present in
//     the utsname type. domainname is a GNU extension. Both fields are referred
//     to as meaningless in the docs. 
}
struct Uv_statfs_s { 
	f_type u64
	f_bsize u64
	f_blocks u64
	f_bfree u64
	f_bavail u64
	f_files u64
	f_ffree u64
	f_spare [4]u64
}
enum Uv_dirent_type_t {
	uv_dirent_unknown
	uv_dirent_file
	uv_dirent_dir
	uv_dirent_link
	uv_dirent_fifo
	uv_dirent_socket
	uv_dirent_char
	uv_dirent_block
}

struct Uv_dirent_s { 
	name &i8
	type_ Uv_dirent_type_t
}
fn C.uv_setup_args(argc int, argv &&u8) &&u8

pub fn uv_setup_args(argc int, argv &&u8) &&u8 {
	return C.uv_setup_args(argc, argv)
}

fn C.uv_get_process_title(buffer &i8, size usize) int

pub fn uv_get_process_title(buffer &i8, size usize) int {
	return C.uv_get_process_title(buffer, size)
}

fn C.uv_set_process_title(title &i8) int

pub fn uv_set_process_title(title &i8) int {
	return C.uv_set_process_title(title)
}

fn C.uv_resident_set_memory(rss &usize) int

pub fn uv_resident_set_memory(rss &usize) int {
	return C.uv_resident_set_memory(rss)
}

fn C.uv_uptime(uptime &f64) int

pub fn uv_uptime(uptime &f64) int {
	return C.uv_uptime(uptime)
}

struct Uv_rusage_t { 
	ru_utime Uv_timeval_t
// user CPU time used 
	ru_stime Uv_timeval_t
// system CPU time used 
	ru_maxrss u64
// maximum resident set size 
	ru_ixrss u64
// integral shared memory size 
	ru_idrss u64
// integral unshared data size 
	ru_isrss u64
// integral unshared stack size 
	ru_minflt u64
// page reclaims (soft page faults) 
	ru_majflt u64
// page faults (hard page faults) 
	ru_nswap u64
// swaps 
	ru_inblock u64
// block input operations 
	ru_oublock u64
// block output operations 
	ru_msgsnd u64
// IPC messages sent 
	ru_msgrcv u64
// IPC messages received 
	ru_nsignals u64
// signals received 
	ru_nvcsw u64
// voluntary context switches 
	ru_nivcsw u64
// involuntary context switches 
}
fn C.uv_getrusage(rusage &Uv_rusage_t) int

pub fn uv_getrusage(rusage &Uv_rusage_t) int {
	return C.uv_getrusage(rusage)
}

fn C.uv_os_homedir(buffer &i8, size &usize) int

pub fn uv_os_homedir(buffer &i8, size &usize) int {
	return C.uv_os_homedir(buffer, size)
}

fn C.uv_os_tmpdir(buffer &i8, size &usize) int

pub fn uv_os_tmpdir(buffer &i8, size &usize) int {
	return C.uv_os_tmpdir(buffer, size)
}

fn C.uv_os_get_passwd(pwd &Uv_passwd_t) int

pub fn uv_os_get_passwd(pwd &Uv_passwd_t) int {
	return C.uv_os_get_passwd(pwd)
}

fn C.uv_os_free_passwd(pwd &Uv_passwd_t)

pub fn uv_os_free_passwd(pwd &Uv_passwd_t) {
	C.uv_os_free_passwd(pwd)
}

fn C.uv_os_get_passwd2(pwd &Uv_passwd_t, uid Uv_uid_t) int

pub fn uv_os_get_passwd2(pwd &Uv_passwd_t, uid Uv_uid_t) int {
	return C.uv_os_get_passwd2(pwd, uid)
}

fn C.uv_os_get_group(grp &Uv_group_t, gid Uv_uid_t) int

pub fn uv_os_get_group(grp &Uv_group_t, gid Uv_uid_t) int {
	return C.uv_os_get_group(grp, gid)
}

fn C.uv_os_free_group(grp &Uv_group_t)

pub fn uv_os_free_group(grp &Uv_group_t) {
	C.uv_os_free_group(grp)
}

fn C.uv_os_getpid() Uv_pid_t

pub fn uv_os_getpid() Uv_pid_t {
	return C.uv_os_getpid()
}

fn C.uv_os_getppid() Uv_pid_t

pub fn uv_os_getppid() Uv_pid_t {
	return C.uv_os_getppid()
}

// On IBM i PASE, the highest process priority is -10 
// RUNPTY(99) 
// RUNPTY(50) 
// RUNPTY(20) 
// RUNTY(12) 
// RUNPTY(6) 
// RUNPTY(1) 
fn C.uv_os_getpriority(pid Uv_pid_t, priority &int) int

pub fn uv_os_getpriority(pid Uv_pid_t, priority &int) int {
	return C.uv_os_getpriority(pid, priority)
}

fn C.uv_os_setpriority(pid Uv_pid_t, priority int) int

pub fn uv_os_setpriority(pid Uv_pid_t, priority int) int {
	return C.uv_os_setpriority(pid, priority)
}


const ( // empty enum
	uv_thread_priority_highest = 2
	uv_thread_priority_above_normal = 1
	uv_thread_priority_normal = 0
	uv_thread_priority_below_normal = -1
	uv_thread_priority_lowest = -2
)

fn C.uv_thread_getpriority(tid Uv_thread_t, priority &int) int

pub fn uv_thread_getpriority(tid Uv_thread_t, priority &int) int {
	return C.uv_thread_getpriority(tid, priority)
}

fn C.uv_thread_setpriority(tid Uv_thread_t, priority int) int

pub fn uv_thread_setpriority(tid Uv_thread_t, priority int) int {
	return C.uv_thread_setpriority(tid, priority)
}

fn C.uv_available_parallelism() u32

pub fn uv_available_parallelism() u32 {
	return C.uv_available_parallelism()
}

fn C.uv_cpu_info(cpu_infos &&Uv_cpu_info_t, count &int) int

pub fn uv_cpu_info(cpu_infos &&Uv_cpu_info_t, count &int) int {
	return C.uv_cpu_info(cpu_infos, count)
}

fn C.uv_free_cpu_info(cpu_infos &Uv_cpu_info_t, count int)

pub fn uv_free_cpu_info(cpu_infos &Uv_cpu_info_t, count int) {
	C.uv_free_cpu_info(cpu_infos, count)
}

fn C.uv_cpumask_size() int

pub fn uv_cpumask_size() int {
	return C.uv_cpumask_size()
}

fn C.uv_interface_addresses(addresses &&Uv_interface_address_t, count &int) int

pub fn uv_interface_addresses(addresses &&Uv_interface_address_t, count &int) int {
	return C.uv_interface_addresses(addresses, count)
}

fn C.uv_free_interface_addresses(addresses &Uv_interface_address_t, count int)

pub fn uv_free_interface_addresses(addresses &Uv_interface_address_t, count int) {
	C.uv_free_interface_addresses(addresses, count)
}

struct Uv_env_item_s { 
	name &i8
	value &i8
}
fn C.uv_os_environ(envitems &&Uv_env_item_t, count &int) int

pub fn uv_os_environ(envitems &&Uv_env_item_t, count &int) int {
	return C.uv_os_environ(envitems, count)
}

fn C.uv_os_free_environ(envitems &Uv_env_item_t, count int)

pub fn uv_os_free_environ(envitems &Uv_env_item_t, count int) {
	C.uv_os_free_environ(envitems, count)
}

fn C.uv_os_getenv(name &i8, buffer &i8, size &usize) int

pub fn uv_os_getenv(name &i8, buffer &i8, size &usize) int {
	return C.uv_os_getenv(name, buffer, size)
}

fn C.uv_os_setenv(name &i8, value &i8) int

pub fn uv_os_setenv(name &i8, value &i8) int {
	return C.uv_os_setenv(name, value)
}

fn C.uv_os_unsetenv(name &i8) int

pub fn uv_os_unsetenv(name &i8) int {
	return C.uv_os_unsetenv(name)
}

//
//    Fallback for the maximum hostname size, including the null terminator. The
//    Windows gethostname() documentation states that 256 bytes will always be
//    large enough to hold the null-terminated hostname.
//  
fn C.uv_os_gethostname(buffer &i8, size &usize) int

pub fn uv_os_gethostname(buffer &i8, size &usize) int {
	return C.uv_os_gethostname(buffer, size)
}

fn C.uv_os_uname(buffer &Uv_utsname_t) int

pub fn uv_os_uname(buffer &Uv_utsname_t) int {
	return C.uv_os_uname(buffer)
}

struct Uv_metrics_s { 
	loop_count u64
	events u64
	events_waiting u64
// private 
	reserved [13]&u64
}
fn C.uv_metrics_info(loop &Uv_loop_t, metrics &Uv_metrics_t) int

pub fn uv_metrics_info(loop &Uv_loop_t, metrics &Uv_metrics_t) int {
	return C.uv_metrics_info(loop, metrics)
}

fn C.uv_metrics_idle_time(loop &Uv_loop_t) u64

pub fn uv_metrics_idle_time(loop &Uv_loop_t) u64 {
	return C.uv_metrics_idle_time(loop)
}

enum Uv_fs_type {
	uv_fs_unknown = -1
	uv_fs_custom
	uv_fs_open
	uv_fs_close
	uv_fs_read
	uv_fs_write
	uv_fs_sendfile
	uv_fs_stat
	uv_fs_lstat
	uv_fs_fstat
	uv_fs_ftruncate
	uv_fs_utime
	uv_fs_futime
	uv_fs_access
	uv_fs_chmod
	uv_fs_fchmod
	uv_fs_fsync
	uv_fs_fdatasync
	uv_fs_unlink
	uv_fs_rmdir
	uv_fs_mkdir
	uv_fs_mkdtemp
	uv_fs_rename
	uv_fs_scandir
	uv_fs_link
	uv_fs_symlink
	uv_fs_readlink
	uv_fs_chown
	uv_fs_fchown
	uv_fs_lchown
	uv_fs_realpath
	uv_fs_copyfile
	uv_fs_opendir
	uv_fs_readdir
	uv_fs_closedir
	uv_fs_statfs
	uv_fs_mkstemp
	uv_fs_lutime
}

struct Uv_dir_s { 
	dirents &Uv_dirent_t
	nentries usize
	reserved [4]voidptr
	dir &DIR
}
// uv_fs_t is a subclass of uv_req_t. 
struct Uv_fs_s { 
	data voidptr
	loop &Uv_loop_t
	type_ Uv_req_type
	reserved [6]voidptr
	fs_type Uv_fs_type
	cb Uv_fs_cb
	result isize
	ptr voidptr
	path &i8
	statbuf Uv_stat_t
// Stores the result of uv_fs_stat() and uv_fs_fstat(). 
	new_path &i8
	file Uv_os_fd_t
	flags int
	mode Mode_t
	nbufs u32
	bufs &Uv_buf_t
	off Off_t
	uid Uv_uid_t
	gid Uv_gid_t
	btime f64
	atime f64
	mtime f64
	work_req Uv__work
	bufsml [4]Uv_buf_t
}
fn C.uv_fs_get_type(arg0 &Uv_fs_t) Uv_fs_type

pub fn uv_fs_get_type(arg0 &Uv_fs_t) Uv_fs_type {
	return C.uv_fs_get_type(arg0)
}

fn C.uv_fs_get_result(arg0 &Uv_fs_t) isize

pub fn uv_fs_get_result(arg0 &Uv_fs_t) isize {
	return C.uv_fs_get_result(arg0)
}

fn C.uv_fs_get_system_error(arg0 &Uv_fs_t) int

pub fn uv_fs_get_system_error(arg0 &Uv_fs_t) int {
	return C.uv_fs_get_system_error(arg0)
}

fn C.uv_fs_get_ptr(arg0 &Uv_fs_t) voidptr

pub fn uv_fs_get_ptr(arg0 &Uv_fs_t) voidptr {
	return C.uv_fs_get_ptr(arg0)
}

fn C.uv_fs_get_path(arg0 &Uv_fs_t) &i8

pub fn uv_fs_get_path(arg0 &Uv_fs_t) &i8 {
	return C.uv_fs_get_path(arg0)
}

fn C.uv_fs_get_statbuf(arg0 &Uv_fs_t) &Uv_stat_t

pub fn uv_fs_get_statbuf(arg0 &Uv_fs_t) &Uv_stat_t {
	return C.uv_fs_get_statbuf(arg0)
}

fn C.uv_fs_req_cleanup(req &Uv_fs_t)

pub fn uv_fs_req_cleanup(req &Uv_fs_t) {
	C.uv_fs_req_cleanup(req)
}

fn C.uv_fs_close(loop &Uv_loop_t, req &Uv_fs_t, file Uv_os_fd_t, cb Uv_fs_cb) int

pub fn uv_fs_close(loop &Uv_loop_t, req &Uv_fs_t, file Uv_os_fd_t, cb Uv_fs_cb) int {
	return C.uv_fs_close(loop, req, file, cb)
}

fn C.uv_fs_open(loop &Uv_loop_t, req &Uv_fs_t, path &i8, flags int, mode int, cb Uv_fs_cb) int

pub fn uv_fs_open(loop &Uv_loop_t, req &Uv_fs_t, path &i8, flags int, mode int, cb Uv_fs_cb) int {
	return C.uv_fs_open(loop, req, path, flags, mode, cb)
}

fn C.uv_fs_read(loop &Uv_loop_t, req &Uv_fs_t, file Uv_os_fd_t, bufs &Uv_buf_t, nbufs u32, offset i64, cb Uv_fs_cb) int

pub fn uv_fs_read(loop &Uv_loop_t, req &Uv_fs_t, file Uv_os_fd_t, bufs &Uv_buf_t, nbufs u32, offset i64, cb Uv_fs_cb) int {
	return C.uv_fs_read(loop, req, file, bufs, nbufs, offset, cb)
}

fn C.uv_fs_unlink(loop &Uv_loop_t, req &Uv_fs_t, path &i8, cb Uv_fs_cb) int

pub fn uv_fs_unlink(loop &Uv_loop_t, req &Uv_fs_t, path &i8, cb Uv_fs_cb) int {
	return C.uv_fs_unlink(loop, req, path, cb)
}

fn C.uv_fs_write(loop &Uv_loop_t, req &Uv_fs_t, file Uv_os_fd_t, bufs &Uv_buf_t, nbufs u32, offset i64, cb Uv_fs_cb) int

pub fn uv_fs_write(loop &Uv_loop_t, req &Uv_fs_t, file Uv_os_fd_t, bufs &Uv_buf_t, nbufs u32, offset i64, cb Uv_fs_cb) int {
	return C.uv_fs_write(loop, req, file, bufs, nbufs, offset, cb)
}

//
// *This flag can be used with uv_fs_copyfile() to return an error if the
// *destination already exists.
// 
//
// *This flag can be used with uv_fs_copyfile() to attempt to create a reflink.
// *If copy-on-write is not supported, a fallback copy mechanism is used.
// 
//
// *This flag can be used with uv_fs_copyfile() to attempt to create a reflink.
// *If copy-on-write is not supported, an error is returned.
// 
fn C.uv_fs_copyfile(loop &Uv_loop_t, req &Uv_fs_t, path &i8, new_path &i8, flags int, cb Uv_fs_cb) int

pub fn uv_fs_copyfile(loop &Uv_loop_t, req &Uv_fs_t, path &i8, new_path &i8, flags int, cb Uv_fs_cb) int {
	return C.uv_fs_copyfile(loop, req, path, new_path, flags, cb)
}

fn C.uv_fs_mkdir(loop &Uv_loop_t, req &Uv_fs_t, path &i8, mode int, cb Uv_fs_cb) int

pub fn uv_fs_mkdir(loop &Uv_loop_t, req &Uv_fs_t, path &i8, mode int, cb Uv_fs_cb) int {
	return C.uv_fs_mkdir(loop, req, path, mode, cb)
}

fn C.uv_fs_mkdtemp(loop &Uv_loop_t, req &Uv_fs_t, tpl &i8, cb Uv_fs_cb) int

pub fn uv_fs_mkdtemp(loop &Uv_loop_t, req &Uv_fs_t, tpl &i8, cb Uv_fs_cb) int {
	return C.uv_fs_mkdtemp(loop, req, tpl, cb)
}

fn C.uv_fs_mkstemp(loop &Uv_loop_t, req &Uv_fs_t, tpl &i8, cb Uv_fs_cb) int

pub fn uv_fs_mkstemp(loop &Uv_loop_t, req &Uv_fs_t, tpl &i8, cb Uv_fs_cb) int {
	return C.uv_fs_mkstemp(loop, req, tpl, cb)
}

fn C.uv_fs_rmdir(loop &Uv_loop_t, req &Uv_fs_t, path &i8, cb Uv_fs_cb) int

pub fn uv_fs_rmdir(loop &Uv_loop_t, req &Uv_fs_t, path &i8, cb Uv_fs_cb) int {
	return C.uv_fs_rmdir(loop, req, path, cb)
}

fn C.uv_fs_scandir(loop &Uv_loop_t, req &Uv_fs_t, path &i8, flags int, cb Uv_fs_cb) int

pub fn uv_fs_scandir(loop &Uv_loop_t, req &Uv_fs_t, path &i8, flags int, cb Uv_fs_cb) int {
	return C.uv_fs_scandir(loop, req, path, flags, cb)
}

fn C.uv_fs_scandir_next(req &Uv_fs_t, ent &Uv_dirent_t) int

pub fn uv_fs_scandir_next(req &Uv_fs_t, ent &Uv_dirent_t) int {
	return C.uv_fs_scandir_next(req, ent)
}

fn C.uv_fs_opendir(loop &Uv_loop_t, req &Uv_fs_t, path &i8, cb Uv_fs_cb) int

pub fn uv_fs_opendir(loop &Uv_loop_t, req &Uv_fs_t, path &i8, cb Uv_fs_cb) int {
	return C.uv_fs_opendir(loop, req, path, cb)
}

fn C.uv_fs_readdir(loop &Uv_loop_t, req &Uv_fs_t, dir &Uv_dir_t, cb Uv_fs_cb) int

pub fn uv_fs_readdir(loop &Uv_loop_t, req &Uv_fs_t, dir &Uv_dir_t, cb Uv_fs_cb) int {
	return C.uv_fs_readdir(loop, req, dir, cb)
}

fn C.uv_fs_closedir(loop &Uv_loop_t, req &Uv_fs_t, dir &Uv_dir_t, cb Uv_fs_cb) int

pub fn uv_fs_closedir(loop &Uv_loop_t, req &Uv_fs_t, dir &Uv_dir_t, cb Uv_fs_cb) int {
	return C.uv_fs_closedir(loop, req, dir, cb)
}

fn C.uv_fs_stat(loop &Uv_loop_t, req &Uv_fs_t, path &i8, cb Uv_fs_cb) int

pub fn uv_fs_stat(loop &Uv_loop_t, req &Uv_fs_t, path &i8, cb Uv_fs_cb) int {
	return C.uv_fs_stat(loop, req, path, cb)
}

fn C.uv_fs_fstat(loop &Uv_loop_t, req &Uv_fs_t, file Uv_os_fd_t, cb Uv_fs_cb) int

pub fn uv_fs_fstat(loop &Uv_loop_t, req &Uv_fs_t, file Uv_os_fd_t, cb Uv_fs_cb) int {
	return C.uv_fs_fstat(loop, req, file, cb)
}

fn C.uv_fs_rename(loop &Uv_loop_t, req &Uv_fs_t, path &i8, new_path &i8, cb Uv_fs_cb) int

pub fn uv_fs_rename(loop &Uv_loop_t, req &Uv_fs_t, path &i8, new_path &i8, cb Uv_fs_cb) int {
	return C.uv_fs_rename(loop, req, path, new_path, cb)
}

fn C.uv_fs_fsync(loop &Uv_loop_t, req &Uv_fs_t, file Uv_os_fd_t, cb Uv_fs_cb) int

pub fn uv_fs_fsync(loop &Uv_loop_t, req &Uv_fs_t, file Uv_os_fd_t, cb Uv_fs_cb) int {
	return C.uv_fs_fsync(loop, req, file, cb)
}

fn C.uv_fs_fdatasync(loop &Uv_loop_t, req &Uv_fs_t, file Uv_os_fd_t, cb Uv_fs_cb) int

pub fn uv_fs_fdatasync(loop &Uv_loop_t, req &Uv_fs_t, file Uv_os_fd_t, cb Uv_fs_cb) int {
	return C.uv_fs_fdatasync(loop, req, file, cb)
}

fn C.uv_fs_ftruncate(loop &Uv_loop_t, req &Uv_fs_t, file Uv_os_fd_t, offset i64, cb Uv_fs_cb) int

pub fn uv_fs_ftruncate(loop &Uv_loop_t, req &Uv_fs_t, file Uv_os_fd_t, offset i64, cb Uv_fs_cb) int {
	return C.uv_fs_ftruncate(loop, req, file, offset, cb)
}

fn C.uv_fs_sendfile(loop &Uv_loop_t, req &Uv_fs_t, out_fd Uv_os_fd_t, in_fd Uv_os_fd_t, in_offset i64, length usize, cb Uv_fs_cb) int

pub fn uv_fs_sendfile(loop &Uv_loop_t, req &Uv_fs_t, out_fd Uv_os_fd_t, in_fd Uv_os_fd_t, in_offset i64, length usize, cb Uv_fs_cb) int {
	return C.uv_fs_sendfile(loop, req, out_fd, in_fd, in_offset, length, cb)
}

fn C.uv_fs_access(loop &Uv_loop_t, req &Uv_fs_t, path &i8, mode int, cb Uv_fs_cb) int

pub fn uv_fs_access(loop &Uv_loop_t, req &Uv_fs_t, path &i8, mode int, cb Uv_fs_cb) int {
	return C.uv_fs_access(loop, req, path, mode, cb)
}

fn C.uv_fs_chmod(loop &Uv_loop_t, req &Uv_fs_t, path &i8, mode int, cb Uv_fs_cb) int

pub fn uv_fs_chmod(loop &Uv_loop_t, req &Uv_fs_t, path &i8, mode int, cb Uv_fs_cb) int {
	return C.uv_fs_chmod(loop, req, path, mode, cb)
}

fn C.uv_fs_utime(loop &Uv_loop_t, req &Uv_fs_t, path &i8, atime f64, mtime f64, cb Uv_fs_cb) int

pub fn uv_fs_utime(loop &Uv_loop_t, req &Uv_fs_t, path &i8, atime f64, mtime f64, cb Uv_fs_cb) int {
	return C.uv_fs_utime(loop, req, path, atime, mtime, cb)
}

fn C.uv_fs_utime_ex(loop &Uv_loop_t, req &Uv_fs_t, path &i8, btime f64, atime f64, mtime f64, cb Uv_fs_cb) int

pub fn uv_fs_utime_ex(loop &Uv_loop_t, req &Uv_fs_t, path &i8, btime f64, atime f64, mtime f64, cb Uv_fs_cb) int {
	return C.uv_fs_utime_ex(loop, req, path, btime, atime, mtime, cb)
}

fn C.uv_fs_futime(loop &Uv_loop_t, req &Uv_fs_t, file Uv_os_fd_t, atime f64, mtime f64, cb Uv_fs_cb) int

pub fn uv_fs_futime(loop &Uv_loop_t, req &Uv_fs_t, file Uv_os_fd_t, atime f64, mtime f64, cb Uv_fs_cb) int {
	return C.uv_fs_futime(loop, req, file, atime, mtime, cb)
}

fn C.uv_fs_futime_ex(loop &Uv_loop_t, req &Uv_fs_t, file Uv_os_fd_t, btime f64, atime f64, mtime f64, cb Uv_fs_cb) int

pub fn uv_fs_futime_ex(loop &Uv_loop_t, req &Uv_fs_t, file Uv_os_fd_t, btime f64, atime f64, mtime f64, cb Uv_fs_cb) int {
	return C.uv_fs_futime_ex(loop, req, file, btime, atime, mtime, cb)
}

fn C.uv_fs_lutime(loop &Uv_loop_t, req &Uv_fs_t, path &i8, atime f64, mtime f64, cb Uv_fs_cb) int

pub fn uv_fs_lutime(loop &Uv_loop_t, req &Uv_fs_t, path &i8, atime f64, mtime f64, cb Uv_fs_cb) int {
	return C.uv_fs_lutime(loop, req, path, atime, mtime, cb)
}

fn C.uv_fs_lstat(loop &Uv_loop_t, req &Uv_fs_t, path &i8, cb Uv_fs_cb) int

pub fn uv_fs_lstat(loop &Uv_loop_t, req &Uv_fs_t, path &i8, cb Uv_fs_cb) int {
	return C.uv_fs_lstat(loop, req, path, cb)
}

fn C.uv_fs_link(loop &Uv_loop_t, req &Uv_fs_t, path &i8, new_path &i8, cb Uv_fs_cb) int

pub fn uv_fs_link(loop &Uv_loop_t, req &Uv_fs_t, path &i8, new_path &i8, cb Uv_fs_cb) int {
	return C.uv_fs_link(loop, req, path, new_path, cb)
}

//
// *This flag can be used with uv_fs_symlink() on Windows to specify whether
// *path argument points to a directory.
// 
//
// *This flag can be used with uv_fs_symlink() on Windows to specify whether
// *the symlink is to be created using junction points.
// 
fn C.uv_fs_symlink(loop &Uv_loop_t, req &Uv_fs_t, path &i8, new_path &i8, flags int, cb Uv_fs_cb) int

pub fn uv_fs_symlink(loop &Uv_loop_t, req &Uv_fs_t, path &i8, new_path &i8, flags int, cb Uv_fs_cb) int {
	return C.uv_fs_symlink(loop, req, path, new_path, flags, cb)
}

fn C.uv_fs_readlink(loop &Uv_loop_t, req &Uv_fs_t, path &i8, cb Uv_fs_cb) int

pub fn uv_fs_readlink(loop &Uv_loop_t, req &Uv_fs_t, path &i8, cb Uv_fs_cb) int {
	return C.uv_fs_readlink(loop, req, path, cb)
}

fn C.uv_fs_realpath(loop &Uv_loop_t, req &Uv_fs_t, path &i8, cb Uv_fs_cb) int

pub fn uv_fs_realpath(loop &Uv_loop_t, req &Uv_fs_t, path &i8, cb Uv_fs_cb) int {
	return C.uv_fs_realpath(loop, req, path, cb)
}

fn C.uv_fs_fchmod(loop &Uv_loop_t, req &Uv_fs_t, file Uv_os_fd_t, mode int, cb Uv_fs_cb) int

pub fn uv_fs_fchmod(loop &Uv_loop_t, req &Uv_fs_t, file Uv_os_fd_t, mode int, cb Uv_fs_cb) int {
	return C.uv_fs_fchmod(loop, req, file, mode, cb)
}

fn C.uv_fs_chown(loop &Uv_loop_t, req &Uv_fs_t, path &i8, uid Uv_uid_t, gid Uv_gid_t, cb Uv_fs_cb) int

pub fn uv_fs_chown(loop &Uv_loop_t, req &Uv_fs_t, path &i8, uid Uv_uid_t, gid Uv_gid_t, cb Uv_fs_cb) int {
	return C.uv_fs_chown(loop, req, path, uid, gid, cb)
}

fn C.uv_fs_fchown(loop &Uv_loop_t, req &Uv_fs_t, file Uv_os_fd_t, uid Uv_uid_t, gid Uv_gid_t, cb Uv_fs_cb) int

pub fn uv_fs_fchown(loop &Uv_loop_t, req &Uv_fs_t, file Uv_os_fd_t, uid Uv_uid_t, gid Uv_gid_t, cb Uv_fs_cb) int {
	return C.uv_fs_fchown(loop, req, file, uid, gid, cb)
}

fn C.uv_fs_lchown(loop &Uv_loop_t, req &Uv_fs_t, path &i8, uid Uv_uid_t, gid Uv_gid_t, cb Uv_fs_cb) int

pub fn uv_fs_lchown(loop &Uv_loop_t, req &Uv_fs_t, path &i8, uid Uv_uid_t, gid Uv_gid_t, cb Uv_fs_cb) int {
	return C.uv_fs_lchown(loop, req, path, uid, gid, cb)
}

fn C.uv_fs_statfs(loop &Uv_loop_t, req &Uv_fs_t, path &i8, cb Uv_fs_cb) int

pub fn uv_fs_statfs(loop &Uv_loop_t, req &Uv_fs_t, path &i8, cb Uv_fs_cb) int {
	return C.uv_fs_statfs(loop, req, path, cb)
}

enum Uv_fs_event {
	uv_rename = 1
	uv_change = 2
}

struct Uv_fs_event_s { 
	data voidptr
	loop &Uv_loop_t
	type_ Uv_handle_type
	close_cb Uv_close_cb
	handle_queue Uv__queue
	next_closing &Uv_handle_t
	flags u32
// private 
	path &i8
	cb Uv_fs_event_cb
	event_watcher Uv__io_t
	realpath &i8
	realpath_len int
	cf_flags int
	cf_cb &Uv_async_t
	cf_events Uv__queue
	cf_member Uv__queue
	cf_error int
	cf_mutex Uv_mutex_t
}
//
// *uv_fs_stat() based polling file watcher.
// 
struct Uv_fs_poll_s { 
	data voidptr
	loop &Uv_loop_t
	type_ Uv_handle_type
	close_cb Uv_close_cb
	handle_queue Uv__queue
	next_closing &Uv_handle_t
	flags u32
// Private, don't touch. 
	poll_ctx voidptr
}
fn C.uv_fs_poll_init(loop &Uv_loop_t, handle &Uv_fs_poll_t) int

pub fn uv_fs_poll_init(loop &Uv_loop_t, handle &Uv_fs_poll_t) int {
	return C.uv_fs_poll_init(loop, handle)
}

fn C.uv_fs_poll_start(handle &Uv_fs_poll_t, poll_cb Uv_fs_poll_cb, path &i8, interval u32) int

pub fn uv_fs_poll_start(handle &Uv_fs_poll_t, poll_cb Uv_fs_poll_cb, path &i8, interval u32) int {
	return C.uv_fs_poll_start(handle, poll_cb, path, interval)
}

fn C.uv_fs_poll_stop(handle &Uv_fs_poll_t) int

pub fn uv_fs_poll_stop(handle &Uv_fs_poll_t) int {
	return C.uv_fs_poll_stop(handle)
}

fn C.uv_fs_poll_getpath(handle &Uv_fs_poll_t, buffer &i8, size &usize) int

pub fn uv_fs_poll_getpath(handle &Uv_fs_poll_t, buffer &i8, size &usize) int {
	return C.uv_fs_poll_getpath(handle, buffer, size)
}

struct Uv_signal_s { 
	data voidptr
	loop &Uv_loop_t
	type_ Uv_handle_type
	close_cb Uv_close_cb
	handle_queue Uv__queue
	next_closing &Uv_handle_t
	flags u32
	signal_cb Uv_signal_cb
	signum int
	tree_entry  struct {	rbe_left &Uv_signal_s
	rbe_right &Uv_signal_s
	rbe_parent &Uv_signal_s
	rbe_color int
}

	caught_signals u32
	dispatched_signals u32
}
fn C.uv_signal_init(loop &Uv_loop_t, handle &Uv_signal_t) int

pub fn uv_signal_init(loop &Uv_loop_t, handle &Uv_signal_t) int {
	return C.uv_signal_init(loop, handle)
}

fn C.uv_signal_start(handle &Uv_signal_t, signal_cb Uv_signal_cb, signum int) int

pub fn uv_signal_start(handle &Uv_signal_t, signal_cb Uv_signal_cb, signum int) int {
	return C.uv_signal_start(handle, signal_cb, signum)
}

fn C.uv_signal_start_oneshot(handle &Uv_signal_t, signal_cb Uv_signal_cb, signum int) int

pub fn uv_signal_start_oneshot(handle &Uv_signal_t, signal_cb Uv_signal_cb, signum int) int {
	return C.uv_signal_start_oneshot(handle, signal_cb, signum)
}

fn C.uv_signal_stop(handle &Uv_signal_t) int

pub fn uv_signal_stop(handle &Uv_signal_t) int {
	return C.uv_signal_stop(handle)
}

fn C.uv_loadavg(avg &f64)

pub fn uv_loadavg(avg &f64) {
	C.uv_loadavg(avg)
}

//
// *Flags to be passed to uv_fs_event_start().
// 
enum Uv_fs_event_flags {
//
//   *By default, if the fs event watcher is given a directory name, we will
//   *watch for all events in that directory. This flags overrides this behavior
//   *and makes fs_event report only changes to the directory entry itself. This
//   *flag does not affect individual files watched.
//   *This flag is currently not implemented yet on any backend.
//   
	uv_fs_event_watch_entry = 1
//
//   *By default uv_fs_event will try to use a kernel interface such as inotify
//   *or kqueue to detect events. This may not work on remote filesystems such
//   *as NFS mounts. This flag makes fs_event fall back to calling stat() on a
//   *regular interval.
//   *This flag is currently not implemented yet on any backend.
//   
	uv_fs_event_stat = 2
//
//   *By default, event watcher, when watching directory, is not registering
//   *(is ignoring) changes in it's subdirectories.
//   *This flag will override this behaviour on platforms that support it.
//   
	uv_fs_event_recursive = 4
}

fn C.uv_fs_event_init(loop &Uv_loop_t, handle &Uv_fs_event_t) int

pub fn uv_fs_event_init(loop &Uv_loop_t, handle &Uv_fs_event_t) int {
	return C.uv_fs_event_init(loop, handle)
}

fn C.uv_fs_event_start(handle &Uv_fs_event_t, cb Uv_fs_event_cb, path &i8, flags u32) int

pub fn uv_fs_event_start(handle &Uv_fs_event_t, cb Uv_fs_event_cb, path &i8, flags u32) int {
	return C.uv_fs_event_start(handle, cb, path, flags)
}

fn C.uv_fs_event_stop(handle &Uv_fs_event_t) int

pub fn uv_fs_event_stop(handle &Uv_fs_event_t) int {
	return C.uv_fs_event_stop(handle)
}

fn C.uv_fs_event_getpath(handle &Uv_fs_event_t, buffer &i8, size &usize) int

pub fn uv_fs_event_getpath(handle &Uv_fs_event_t, buffer &i8, size &usize) int {
	return C.uv_fs_event_getpath(handle, buffer, size)
}

fn C.uv_ip4_addr(ip &i8, port int, addr &Sockaddr_in) int

pub fn uv_ip4_addr(ip &i8, port int, addr &Sockaddr_in) int {
	return C.uv_ip4_addr(ip, port, addr)
}

fn C.uv_ip6_addr(ip &i8, port int, addr &Sockaddr_in6) int

pub fn uv_ip6_addr(ip &i8, port int, addr &Sockaddr_in6) int {
	return C.uv_ip6_addr(ip, port, addr)
}

fn C.uv_ip4_name(src &Sockaddr_in, dst &i8, size usize) int

pub fn uv_ip4_name(src &Sockaddr_in, dst &i8, size usize) int {
	return C.uv_ip4_name(src, dst, size)
}

fn C.uv_ip6_name(src &Sockaddr_in6, dst &i8, size usize) int

pub fn uv_ip6_name(src &Sockaddr_in6, dst &i8, size usize) int {
	return C.uv_ip6_name(src, dst, size)
}

fn C.uv_ip_name(src &Sockaddr, dst &i8, size usize) int

pub fn uv_ip_name(src &Sockaddr, dst &i8, size usize) int {
	return C.uv_ip_name(src, dst, size)
}

fn C.uv_inet_ntop(af int, src voidptr, dst &i8, size usize) int

pub fn uv_inet_ntop(af int, src voidptr, dst &i8, size usize) int {
	return C.uv_inet_ntop(af, src, dst, size)
}

fn C.uv_inet_pton(af int, src &i8, dst voidptr) int

pub fn uv_inet_pton(af int, src &i8, dst voidptr) int {
	return C.uv_inet_pton(af, src, dst)
}

struct Uv_random_s { 
	data voidptr
	loop &Uv_loop_t
	type_ Uv_req_type
	reserved [6]voidptr
// private 
	status int
	buf voidptr
	buflen usize
	cb Uv_random_cb
	work_req Uv__work
}
fn C.uv_random(loop &Uv_loop_t, req &Uv_random_t, buf voidptr, buflen usize, flags u32, cb Uv_random_cb) int

pub fn uv_random(loop &Uv_loop_t, req &Uv_random_t, buf voidptr, buflen usize, flags u32, cb Uv_random_cb) int {
	return C.uv_random(loop, req, buf, buflen, flags, cb)
}

fn C.uv_if_indextoname(ifindex u32, buffer &i8, size &usize) int

pub fn uv_if_indextoname(ifindex u32, buffer &i8, size &usize) int {
	return C.uv_if_indextoname(ifindex, buffer, size)
}

fn C.uv_if_indextoiid(ifindex u32, buffer &i8, size &usize) int

pub fn uv_if_indextoiid(ifindex u32, buffer &i8, size &usize) int {
	return C.uv_if_indextoiid(ifindex, buffer, size)
}

fn C.uv_exepath(buffer &i8, size &usize) int

pub fn uv_exepath(buffer &i8, size &usize) int {
	return C.uv_exepath(buffer, size)
}

fn C.uv_cwd(buffer &i8, size &usize) int

pub fn uv_cwd(buffer &i8, size &usize) int {
	return C.uv_cwd(buffer, size)
}

fn C.uv_chdir(dir &i8) int

pub fn uv_chdir(dir &i8) int {
	return C.uv_chdir(dir)
}

fn C.uv_get_free_memory() u64

pub fn uv_get_free_memory() u64 {
	return C.uv_get_free_memory()
}

fn C.uv_get_total_memory() u64

pub fn uv_get_total_memory() u64 {
	return C.uv_get_total_memory()
}

fn C.uv_get_constrained_memory() u64

pub fn uv_get_constrained_memory() u64 {
	return C.uv_get_constrained_memory()
}

fn C.uv_get_available_memory() u64

pub fn uv_get_available_memory() u64 {
	return C.uv_get_available_memory()
}

fn C.uv_clock_gettime(clock_id Uv_clock_id, ts &Uv_timespec_t) int

pub fn uv_clock_gettime(clock_id Uv_clock_id, ts &Uv_timespec_t) int {
	return C.uv_clock_gettime(clock_id, ts)
}

fn C.uv_hrtime() u64

pub fn uv_hrtime() u64 {
	return C.uv_hrtime()
}

fn C.uv_sleep(msec u32)

pub fn uv_sleep(msec u32) {
	C.uv_sleep(msec)
}

fn C.uv_disable_stdio_inheritance()

pub fn uv_disable_stdio_inheritance() {
	C.uv_disable_stdio_inheritance()
}

fn C.uv_dlopen(filename &i8, lib &Uv_lib_t) int

pub fn uv_dlopen(filename &i8, lib &Uv_lib_t) int {
	return C.uv_dlopen(filename, lib)
}

fn C.uv_dlclose(lib &Uv_lib_t)

pub fn uv_dlclose(lib &Uv_lib_t) {
	C.uv_dlclose(lib)
}

fn C.uv_dlsym(lib &Uv_lib_t, name &i8, ptr &voidptr) int

pub fn uv_dlsym(lib &Uv_lib_t, name &i8, ptr &voidptr) int {
	return C.uv_dlsym(lib, name, ptr)
}

fn C.uv_dlerror(lib &Uv_lib_t) &i8

pub fn uv_dlerror(lib &Uv_lib_t) &i8 {
	return C.uv_dlerror(lib)
}

fn C.uv_mutex_init(handle &Uv_mutex_t) int

pub fn uv_mutex_init(handle &Uv_mutex_t) int {
	return C.uv_mutex_init(handle)
}

fn C.uv_mutex_init_recursive(handle &Uv_mutex_t) int

pub fn uv_mutex_init_recursive(handle &Uv_mutex_t) int {
	return C.uv_mutex_init_recursive(handle)
}

fn C.uv_mutex_destroy(handle &Uv_mutex_t)

pub fn uv_mutex_destroy(handle &Uv_mutex_t) {
	C.uv_mutex_destroy(handle)
}

fn C.uv_mutex_lock(handle &Uv_mutex_t)

pub fn uv_mutex_lock(handle &Uv_mutex_t) {
	C.uv_mutex_lock(handle)
}

fn C.uv_mutex_trylock(handle &Uv_mutex_t) int

pub fn uv_mutex_trylock(handle &Uv_mutex_t) int {
	return C.uv_mutex_trylock(handle)
}

fn C.uv_mutex_unlock(handle &Uv_mutex_t)

pub fn uv_mutex_unlock(handle &Uv_mutex_t) {
	C.uv_mutex_unlock(handle)
}

fn C.uv_rwlock_init(rwlock &Uv_rwlock_t) int

pub fn uv_rwlock_init(rwlock &Uv_rwlock_t) int {
	return C.uv_rwlock_init(rwlock)
}

fn C.uv_rwlock_destroy(rwlock &Uv_rwlock_t)

pub fn uv_rwlock_destroy(rwlock &Uv_rwlock_t) {
	C.uv_rwlock_destroy(rwlock)
}

fn C.uv_rwlock_rdlock(rwlock &Uv_rwlock_t)

pub fn uv_rwlock_rdlock(rwlock &Uv_rwlock_t) {
	C.uv_rwlock_rdlock(rwlock)
}

fn C.uv_rwlock_tryrdlock(rwlock &Uv_rwlock_t) int

pub fn uv_rwlock_tryrdlock(rwlock &Uv_rwlock_t) int {
	return C.uv_rwlock_tryrdlock(rwlock)
}

fn C.uv_rwlock_rdunlock(rwlock &Uv_rwlock_t)

pub fn uv_rwlock_rdunlock(rwlock &Uv_rwlock_t) {
	C.uv_rwlock_rdunlock(rwlock)
}

fn C.uv_rwlock_wrlock(rwlock &Uv_rwlock_t)

pub fn uv_rwlock_wrlock(rwlock &Uv_rwlock_t) {
	C.uv_rwlock_wrlock(rwlock)
}

fn C.uv_rwlock_trywrlock(rwlock &Uv_rwlock_t) int

pub fn uv_rwlock_trywrlock(rwlock &Uv_rwlock_t) int {
	return C.uv_rwlock_trywrlock(rwlock)
}

fn C.uv_rwlock_wrunlock(rwlock &Uv_rwlock_t)

pub fn uv_rwlock_wrunlock(rwlock &Uv_rwlock_t) {
	C.uv_rwlock_wrunlock(rwlock)
}

fn C.uv_sem_init(sem &Uv_sem_t, value u32) int

pub fn uv_sem_init(sem &Uv_sem_t, value u32) int {
	return C.uv_sem_init(sem, value)
}

fn C.uv_sem_destroy(sem &Uv_sem_t)

pub fn uv_sem_destroy(sem &Uv_sem_t) {
	C.uv_sem_destroy(sem)
}

fn C.uv_sem_post(sem &Uv_sem_t)

pub fn uv_sem_post(sem &Uv_sem_t) {
	C.uv_sem_post(sem)
}

fn C.uv_sem_wait(sem &Uv_sem_t)

pub fn uv_sem_wait(sem &Uv_sem_t) {
	C.uv_sem_wait(sem)
}

fn C.uv_sem_trywait(sem &Uv_sem_t) int

pub fn uv_sem_trywait(sem &Uv_sem_t) int {
	return C.uv_sem_trywait(sem)
}

fn C.uv_cond_init(cond &Uv_cond_t) int

pub fn uv_cond_init(cond &Uv_cond_t) int {
	return C.uv_cond_init(cond)
}

fn C.uv_cond_destroy(cond &Uv_cond_t)

pub fn uv_cond_destroy(cond &Uv_cond_t) {
	C.uv_cond_destroy(cond)
}

fn C.uv_cond_signal(cond &Uv_cond_t)

pub fn uv_cond_signal(cond &Uv_cond_t) {
	C.uv_cond_signal(cond)
}

fn C.uv_cond_broadcast(cond &Uv_cond_t)

pub fn uv_cond_broadcast(cond &Uv_cond_t) {
	C.uv_cond_broadcast(cond)
}

fn C.uv_barrier_init(barrier &Uv_barrier_t, count u32) int

pub fn uv_barrier_init(barrier &Uv_barrier_t, count u32) int {
	return C.uv_barrier_init(barrier, count)
}

fn C.uv_barrier_destroy(barrier &Uv_barrier_t)

pub fn uv_barrier_destroy(barrier &Uv_barrier_t) {
	C.uv_barrier_destroy(barrier)
}

fn C.uv_barrier_wait(barrier &Uv_barrier_t) int

pub fn uv_barrier_wait(barrier &Uv_barrier_t) int {
	return C.uv_barrier_wait(barrier)
}

fn C.uv_cond_wait(cond &Uv_cond_t, mutex &Uv_mutex_t)

pub fn uv_cond_wait(cond &Uv_cond_t, mutex &Uv_mutex_t) {
	C.uv_cond_wait(cond, mutex)
}

fn C.uv_cond_timedwait(cond &Uv_cond_t, mutex &Uv_mutex_t, timeout u64) int

pub fn uv_cond_timedwait(cond &Uv_cond_t, mutex &Uv_mutex_t, timeout u64) int {
	return C.uv_cond_timedwait(cond, mutex, timeout)
}

fn C.uv_once(guard &Uv_once_t, callback fn ())

pub fn uv_once(guard &Uv_once_t, callback fn ()) {
	C.uv_once(guard, callback)
}

fn C.uv_key_create(key &Uv_key_t) int

pub fn uv_key_create(key &Uv_key_t) int {
	return C.uv_key_create(key)
}

fn C.uv_key_delete(key &Uv_key_t)

pub fn uv_key_delete(key &Uv_key_t) {
	C.uv_key_delete(key)
}

fn C.uv_key_get(key &Uv_key_t) voidptr

pub fn uv_key_get(key &Uv_key_t) voidptr {
	return C.uv_key_get(key)
}

fn C.uv_key_set(key &Uv_key_t, value voidptr)

pub fn uv_key_set(key &Uv_key_t, value voidptr) {
	C.uv_key_set(key, value)
}

fn C.uv_gettimeofday(tv &Uv_timeval_t) int

pub fn uv_gettimeofday(tv &Uv_timeval_t) int {
	return C.uv_gettimeofday(tv)
}

type Uv_thread_cb = fn (voidptr)
fn C.uv_thread_create(tid &Uv_thread_t, entry Uv_thread_cb, arg voidptr) int

pub fn uv_thread_create(tid &Uv_thread_t, entry Uv_thread_cb, arg voidptr) int {
	return C.uv_thread_create(tid, entry, arg)
}

enum Uv_thread_create_flags {
	uv_thread_no_flags = 0
	uv_thread_has_stack_size = 1
}

struct Uv_thread_options_t { 
	flags u32
	stack_size usize
// More fields may be added at any time. 
}
fn C.uv_thread_create_ex(tid &Uv_thread_t, params &Uv_thread_options_t, entry Uv_thread_cb, arg voidptr) int

pub fn uv_thread_create_ex(tid &Uv_thread_t, params &Uv_thread_options_t, entry Uv_thread_cb, arg voidptr) int {
	return C.uv_thread_create_ex(tid, params, entry, arg)
}

fn C.uv_thread_setaffinity(tid &Uv_thread_t, cpumask &i8, oldmask &i8, mask_size usize) int

pub fn uv_thread_setaffinity(tid &Uv_thread_t, cpumask &i8, oldmask &i8, mask_size usize) int {
	return C.uv_thread_setaffinity(tid, cpumask, oldmask, mask_size)
}

fn C.uv_thread_getaffinity(tid &Uv_thread_t, cpumask &i8, mask_size usize) int

pub fn uv_thread_getaffinity(tid &Uv_thread_t, cpumask &i8, mask_size usize) int {
	return C.uv_thread_getaffinity(tid, cpumask, mask_size)
}

fn C.uv_thread_getcpu() int

pub fn uv_thread_getcpu() int {
	return C.uv_thread_getcpu()
}

fn C.uv_thread_detach(tid &Uv_thread_t) int

pub fn uv_thread_detach(tid &Uv_thread_t) int {
	return C.uv_thread_detach(tid)
}

fn C.uv_thread_join(tid &Uv_thread_t) int

pub fn uv_thread_join(tid &Uv_thread_t) int {
	return C.uv_thread_join(tid)
}

fn C.uv_thread_self() Uv_thread_t

pub fn uv_thread_self() Uv_thread_t {
	return C.uv_thread_self()
}

fn C.uv_thread_equal(t1 &Uv_thread_t, t2 &Uv_thread_t) int

pub fn uv_thread_equal(t1 &Uv_thread_t, t2 &Uv_thread_t) int {
	return C.uv_thread_equal(t1, t2)
}

// The presence of these unions force similar struct layout. 
union Uv_any_handle { 
	async Uv_async_t
	check Uv_check_t
	fs_event Uv_fs_event_t
	fs_poll Uv_fs_poll_t
	handle Uv_handle_t
	idle Uv_idle_t
	pipe Uv_pipe_t
	poll Uv_poll_t
	prepare Uv_prepare_t
	process Uv_process_t
	stream Uv_stream_t
	tcp Uv_tcp_t
	timer Uv_timer_t
	tty Uv_tty_t
	udp Uv_udp_t
	signal Uv_signal_t
}
union Uv_any_req { 
	req Uv_req_t
	connect Uv_connect_t
	c.write Uv_write_t
	shutdown Uv_shutdown_t
	udp_send Uv_udp_send_t
	fs Uv_fs_t
	work Uv_work_t
	getaddrinfo Uv_getaddrinfo_t
	getnameinfo Uv_getnameinfo_t
	random Uv_random_t
}
struct Uv_loop_s { 
// User data - use this for whatever. 
	data voidptr
// Loop reference counting. 
	active_handles u32
	handle_queue Uv__queue
	active_reqs Union (unnamed union at /Users/daniel/homelab/GitHub/languages/v-projects/vlibuv/thirdparty/include/uv.h
// Internal storage for future extensions. 
	internal_fields voidptr
// Internal flag to signal loop stop. 
	stop_flag u32
	reserved [4]voidptr
	flags u32
	backend_fd int
	pending_queue Uv__queue
	watcher_queue Uv__queue
	watchers &&Uv__io_t
	nwatchers u32
	nfds u32
	wq Uv__queue
	wq_mutex Uv_mutex_t
	wq_async Uv_async_t
	cloexec_lock Uv_rwlock_t
	closing_handles &Uv_handle_t
	process_handles Uv__queue
	prepare_handles Uv__queue
	check_handles Uv__queue
	idle_handles Uv__queue
	async_handles Uv__queue
	async_io_watcher Uv__io_t
	async_wfd int
	timer_heap  struct {	min voidptr
	nelts u32
}

	timer_counter u64
	time u64
	signal_pipefd [2]int
	signal_io_watcher Uv__io_t
	child_watcher Uv_signal_t
	emfile_fd int
	cf_thread Uv_thread_t
	_cf_reserved voidptr
	cf_state voidptr
	cf_mutex Uv_mutex_t
	cf_sem Uv_sem_t
	cf_signals Uv__queue
}
fn C.uv_loop_get_data(arg0 &Uv_loop_t) voidptr

pub fn uv_loop_get_data(arg0 &Uv_loop_t) voidptr {
	return C.uv_loop_get_data(arg0)
}

fn C.uv_loop_set_data(arg0 &Uv_loop_t, data voidptr)

pub fn uv_loop_set_data(arg0 &Uv_loop_t, data voidptr) {
	C.uv_loop_set_data(arg0, data)
}

// String utilities needed internally for dealing with Windows. 
fn C.uv_utf16_length_as_wtf8(utf16 &u16, utf16_len isize) usize

pub fn uv_utf16_length_as_wtf8(utf16 &u16, utf16_len isize) usize {
	return C.uv_utf16_length_as_wtf8(utf16, utf16_len)
}

fn C.uv_utf16_to_wtf8(utf16 &u16, utf16_len isize, wtf8_ptr &&u8, wtf8_len_ptr &usize) int

pub fn uv_utf16_to_wtf8(utf16 &u16, utf16_len isize, wtf8_ptr &&u8, wtf8_len_ptr &usize) int {
	return C.uv_utf16_to_wtf8(utf16, utf16_len, wtf8_ptr, wtf8_len_ptr)
}

fn C.uv_wtf8_length_as_utf16(wtf8 &i8) isize

pub fn uv_wtf8_length_as_utf16(wtf8 &i8) isize {
	return C.uv_wtf8_length_as_utf16(wtf8)
}

fn C.uv_wtf8_to_utf16(wtf8 &i8, utf16 &u16, utf16_len usize)

pub fn uv_wtf8_to_utf16(wtf8 &i8, utf16 &u16, utf16_len usize) {
	C.uv_wtf8_to_utf16(wtf8, utf16, utf16_len)
}

// Don't export the private CPP symbols. 
// UV_H 
