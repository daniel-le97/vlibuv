module vlibuv
import vlibuv.uv
// fn uv.thread_detach(tid &uv.Uv_thread_t) int
// fn uv.thread_create_ex(tid &uv.Uv_thread_t, const_params &uv.thread_options_t, entry fn (arg voidptr), arg voidptr) int
// fn uv.thread_create(tid &uv.Uv_thread_t, entry fn (arg voidptr), arg voidptr) int
// fn uv.thread_setaffinity(tid &uv.Uv_thread_t, cpumask &char, oldmask &char, mask_size usize) int
// fn uv.thread_getaffinity(tid &uv.Uv_thread_t, cpumask &char, mask_size usize) int
// fn uv.thread_getcpu() int
// fn uv.thread_join(tid &uv.Uv_thread_t)
// fn uv.thread_self() uv.Uv_thread_t
// fn uv.thread_equal(const_t1 &uv.Uv_thread_t, const_t2 &uv.Uv_thread_t) int

struct UVthread {
	thread &uv.Uv_thread_t
}

pub fn new_thread() UVthread {
	t := &uv.Uv_thread_t(unsafe { nil })
	return UVthread{t}
}

fn (t UVthread) create(entry fn (voidptr), arg voidptr) !int {
	r := uv.thread_create(t.thread, entry, arg)
	return error_checker(r)
}

pub enum UVthread_create_flags {
	no_flags       = 0
	has_stack_size = 1
}

fn (t UVthread) create_ex(flag UVthread_create_flags, size usize, entry fn (voidptr), arg voidptr) !int {
	return error('not implemented')
	// r := uv.thread_create_ex(t.thread, , entry, arg)
	// return error_checker(r)
}

fn (t UVthread) join() {
	uv.thread_join(t.thread)
}

fn (t UVthread) self() UVthread {
	th := uv.thread_self()
	return UVthread{&th}
}

fn (t UVthread) equal(th UVthread) bool {
	return uv.thread_equal(t.thread, th.thread) == 1
}

fn (t UVthread) getcpu(th UVthread) bool {
	return uv.thread_equal(t.thread, th.thread) == 1
}

fn (t UVthread) detach(th UVthread) !int {
	return error_checker(uv.thread_detach(t.thread))
}
