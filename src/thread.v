module vlibuv

fn C.uv_thread_detach(tid &C.uv_thread_t) int
fn C.uv_thread_create_ex(tid &C.uv_thread_t, const_params &C.uv_thread_options_t, entry fn (arg voidptr), arg voidptr) int
fn C.uv_thread_create(tid &C.uv_thread_t, entry fn (arg voidptr), arg voidptr) int
fn C.uv_thread_setaffinity(tid &C.uv_thread_t, cpumask &char, oldmask &char, mask_size usize) int
fn C.uv_thread_getaffinity(tid &C.uv_thread_t, cpumask &char, mask_size usize) int
fn C.uv_thread_getcpu() int
fn C.uv_thread_join(tid &C.uv_thread_t)
fn C.uv_thread_self() C.uv_thread_t
fn C.uv_thread_equal(const_t1 &C.uv_thread_t, const_t2 &C.uv_thread_t) int

struct UVthread {
	thread &C.uv_thread_t
}

pub fn new_thread() UVthread {
	t := &C.uv_thread_t(unsafe { nil })
	return UVthread{t}
}

fn (t UVthread) create(entry fn (voidptr), arg voidptr) !int {
	r := C.uv_thread_create(t.thread, entry, arg)
	return error_checker(r)
}

pub enum UVthread_create_flags {
	no_flags       = 0
	has_stack_size = 1
}

// fn (t UVthread) create_ex(flag UVthread_create_flags, size usize, entry fn (voidptr), arg voidptr) !int {

// 	r := C.uv_thread_create_ex(t.thread, , entry, arg)
// 	return error_checker(r)
// }

fn (t UVthread) join() {
	C.uv_thread_join(t.thread)
}

fn (t UVthread) self() UVthread {
	th := C.uv_thread_self()
	return UVthread{&th}
}

fn (t UVthread) equal(th UVthread) bool {
	return C.uv_thread_equal(t.thread, th.thread) == 1
}

fn (t UVthread) getcpu(th UVthread) bool {
	return C.uv_thread_equal(t.thread, th.thread) == 1
}

fn (t UVthread) detach(th UVthread) !int {
	return error_checker(C.uv_thread_detach(t.thread))
}
