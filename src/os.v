module vlibuv

// os functions
pub fn C.uv_os_homedir(buf &char, size &usize) int

// pub fn os_homedir() string {
// 	return call_fn(C.uv_os_homedir)
// }

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
