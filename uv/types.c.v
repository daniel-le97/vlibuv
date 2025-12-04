module uv

// ============================================================================
// Core Event Loop
// ============================================================================

pub type Uv_loop_t = C.uv_loop_t

// ============================================================================
// Handle Types
// Base handle type and specific I/O handle types
// ============================================================================

pub type Uv_handle_t = C.uv_handle_t

// Stream handles (bidirectional data flow)
pub type Uv_stream_t = C.uv_stream_t
pub type Uv_tcp_t = C.uv_tcp_t

pub fn (t &Uv_tcp_t) to_stream() &Uv_stream_t {
	return unsafe { &Uv_stream_t(t) }
}

pub fn (t &Uv_tcp_t) to_handle() &Uv_handle_t {
	return unsafe { &Uv_handle_t(t) }
}

pub type Uv_pipe_t = C.uv_pipe_t
pub type Uv_tty_t = C.uv_tty_t

// UDP socket handle (connectionless)
pub type Uv_udp_t = C.uv_udp_t

// File system and polling handles
pub type Uv_fs_event_t = C.uv_fs_event_t
pub type Uv_fs_poll_t = C.uv_fs_poll_t
pub type Uv_dir_t = C.uv_dir_t

// Event loop watchers
pub type Uv_poll_t = C.uv_poll_t
pub type Uv_timer_t = C.uv_timer_t
pub type Uv_prepare_t = C.uv_prepare_t
pub type Uv_check_t = C.uv_check_t
pub type Uv_idle_t = C.uv_idle_t

// Signal handling
pub type Uv_signal_t = C.uv_signal_t

// Process and async handles
pub type Uv_process_t = C.uv_process_t
pub type Uv_async_t = C.uv_async_t

// ============================================================================
// Request Types
// Asynchronous operation handles
// ============================================================================

pub type Uv_req_t = C.uv_req_t

// Network requests
pub type Uv_getaddrinfo_t = C.uv_getaddrinfo_t
pub type Uv_getnameinfo_t = C.uv_getnameinfo_t

// Stream operation requests
pub type Uv_shutdown_t = C.uv_shutdown_t
pub type Uv_write_t = C.uv_write_t
pub type Uv_connect_t = C.uv_connect_t

// UDP operation requests
pub type Uv_udp_send_t = C.uv_udp_send_t

// File system requests
pub type Uv_fs_t = C.uv_fs_t

// Thread pool work requests
pub type Uv_work_t = C.uv_work_t

// Random data request
pub type Uv_random_t = C.uv_random_t

// ============================================================================
// Buffer Types
// Memory buffer handling for I/O operations
// ============================================================================

pub type Uv_buf_t = C.uv_buf_t

// ============================================================================
// Process Types
// Process management and options
// ============================================================================

pub type Uv_process_options_t = C.uv_process_options_t

// ============================================================================
// System Information Types
// System metrics, resource info, and environment data
// ============================================================================

// System resource information
pub type Uv_cpu_info_t = C.uv_cpu_info_t
pub type Uv_metrics_t = C.uv_metrics_t
pub type Uv_rusage_t = C.uv_rusage_t

// File system information
pub type Uv_stat_t = C.uv_stat_t
pub type Uv_statfs_t = C.uv_statfs_t
pub type Uv_dirent_t = C.uv_dirent_t

// Network information
pub type Uv_interface_address_t = C.uv_interface_address_t

// System information
pub type Uv_utsname_t = C.uv_utsname_t

// User and group information
pub type Uv_env_item_t = C.uv_env_item_t
pub type Uv_passwd_t = C.uv_passwd_t
pub type Uv_group_t = C.uv_group_t
pub type Uv_uid_t = C.uv_uid_t
pub type Uv_gid_t = C.uv_gid_t

// ============================================================================
// Networking Types
// Socket address structures
// ============================================================================

pub type Sockaddr = C.sockaddr
pub type Sockaddr_in = C.sockaddr_in
pub type Sockaddr_in6 = C.sockaddr_in6

// ============================================================================
// Synchronization Primitives
// Thread synchronization and locking mechanisms
// ============================================================================

pub type Uv_mutex_t = C.uv_mutex_t
pub type Uv_rwlock_t = C.uv_rwlock_t
pub type Uv_sem_t = C.uv_sem_t
pub type Uv_barrier_t = C.uv_barrier_t
pub type Uv_cond_t = C.uv_cond_t

// ============================================================================
// Thread Types
// Threading and thread-local storage
// ============================================================================

pub type Uv_thread_t = C.uv_thread_t
pub type Uv_thread_options_t = C.uv_thread_options_t
pub type Uv_once_t = C.uv_once_t
pub type Uv_key_t = C.uv_key_t

// ============================================================================
// Library Types
// Dynamic library loading
// ============================================================================

pub type Uv_lib_t = C.uv_lib_t
