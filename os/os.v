module os

import vlibuv.uv


// Priority levels for process priority
pub enum Priority {
	high   = -20
	above  = -10
	normal = 0
	below  = 10
	low    = 20
}

// CpuInfo holds CPU information
pub struct CpuInfo {
pub:
	model string
	speed int
	times CpuTimes
}

// CpuTimes holds CPU timing information
pub struct CpuTimes {
pub:
	user u64
	nice u64
	sys  u64
	idle u64
	irq  u64
}

// EnvItem represents an environment variable
pub struct Env {
pub:
	name  string
	value string
}

// HostInfo holds hostname information
pub struct HostInfo {
pub:
	sysname  string
	release  string
	version  string
	machine  string
}


// homedir returns the home directory of the current user
pub fn homedir() !string {
	return uv.call_with_buffer(uv.os_homedir)
}

// tmpdir returns the system temporary directory
pub fn tmpdir() !string {
	return uv.call_with_buffer(uv.os_tmpdir)
}

// gethostname returns the hostname of the machine
pub fn gethostname() !string {
	return uv.call_with_buffer(uv.os_gethostname)
}

// process_title returns the current process title
pub fn process_title() !string {
	return uv.call_with_buffer(uv.get_process_title)
}

// set_process_title sets the current process title
pub fn set_process_title(title string) !int {
	ret := uv.set_process_title(title.str)
	if ret < 0 {
		return error(uv.get_error_message(ret))
	}
	return ret
}

// pid returns the process ID of the current process
pub fn pid() int {
	return uv.os_getpid()
}

// ppid returns the process ID of the parent process
pub fn ppid() int {
	return uv.os_getppid()
}

// getenv retrieves an environment variable value
pub fn getenv(name string) !string {
	buf_size := uv.buff_size
	mut buf := []char{len: buf_size}
	mut size := usize(buf_size)

	ret := unsafe { uv.os_getenv(name.str, &buf[0], &size) }
	if ret < 0 {
		return error(uv.get_error_message(ret))
	}

	unsafe {
		return cstring_to_vstring(&buf[0])
	}
}

// setenv sets an environment variable
pub fn setenv(name string, value string) !int {
	ret := uv.os_setenv(name.str, value.str)
	if ret < 0 {
		return error(uv.get_error_message(ret))
	}
	return ret
}

// unsetenv removes an environment variable
pub fn unsetenv(name string) !int {
	ret := uv.os_unsetenv(name.str)
	if ret < 0 {
		return error(uv.get_error_message(ret))
	}
	return ret
}

// getpriority returns the priority of a process
pub fn getpriority(pid int) !int {
	mut priority := 0
	ret := uv.os_getpriority(pid, &priority)
	if ret < 0 {
		return error(uv.get_error_message(ret))
	}
	return priority
}

// setpriority sets the priority of a process
pub fn setpriority(pid int, priority int) !int {
	ret := uv.os_setpriority(pid, priority)
	if ret < 0 {
		return error(uv.get_error_message(ret))
	}
	return ret
}

// cpus returns information about the system CPUs
pub fn cpus() ![]CpuInfo {
	mut cpu_infos := &uv.Uv_cpu_info_t(unsafe { nil })
	mut count := 0

	ret := uv.cpu_info(&cpu_infos, &count)
	if ret < 0 {
		return error(uv.get_error_message(ret))
	}

	defer {
		uv.free_cpu_info(cpu_infos, count)
	}

	mut result := []CpuInfo{}
	unsafe {
		for i in 0 .. count {
			cpu := cpu_infos[i]
			// Manually convert C string to V string (same pattern as environ())
			model_len := C.strlen(cpu.model)
			model_str := (&u8(cpu.model)).vstring_with_len(int(model_len))

			info := CpuInfo{
				model: model_str
				speed: cpu.speed
				times: CpuTimes{
					user: cpu.cpu_times.user
					nice: cpu.cpu_times.nice
					sys:  cpu.cpu_times.sys
					idle: cpu.cpu_times.idle
					irq:  cpu.cpu_times.irq
				}
			}
			result << info
		}
	}

	return result
}

// available_parallelism returns the number of logical CPUs
pub fn available_parallelism() usize {
	return uv.available_parallelism()
}

// environ returns all environment variables
pub fn environ() ![]Env {
	mut env_items := &uv.Uv_env_item_t(unsafe { nil })
	mut count := 0

	ret := uv.os_environ(&env_items, &count)
	if ret < 0 {
		return error(uv.get_error_message(ret))
	}

	mut result := []Env{}
	unsafe {
		for i in 0 .. count {
			item := env_items[i]
			// Manually convert C strings to V strings without relying on cstring_to_vstring
			name_len := C.strlen(item.name)
			value_len := C.strlen(item.value)

			name_str := (&u8(item.name)).vstring_with_len(int(name_len))
			value_str := (&u8(item.value)).vstring_with_len(int(value_len))

			result << Env{
				name:  name_str
				value: value_str
			}
		}
	}

	return result
}

// uname returns system information
pub fn uname() !HostInfo {
	mut utsname := uv.Uv_utsname_t{}
	ret := uv.os_uname(&utsname)
	if ret < 0 {
		return error(uv.get_error_message(ret))
	}

	return HostInfo{
		sysname:  unsafe { cstring_to_vstring(&char(&utsname.sysname[0])) }
		release:  unsafe { cstring_to_vstring(&char(&utsname.release[0])) }
		version:  unsafe { cstring_to_vstring(&char(&utsname.version[0])) }
		machine:  unsafe { cstring_to_vstring(&char(&utsname.machine[0])) }
	}
}



// resident_set_memory returns the resident set memory size in bytes
pub fn resident_set_memory() !u64 {
	mut rss := usize(0)
	ret := uv.resident_set_memory(&rss)
	if ret < 0 {
		return error(uv.get_error_message(ret))
	}
	return u64(rss)
}

// uptime returns the system uptime in seconds
pub fn uptime() !f64 {
	mut up := f64(0)
	ret := uv.uptime(&up)
	if ret < 0 {
		return error(uv.get_error_message(ret))
	}
	return up
}
