module vlibuv

// barrier functions

fn C.uv_barrier_init(handle &C.uv_barrier_t, count usize) int
fn C.uv_barrier_destroy(handle &C.uv_barrier_t)
fn C.uv_barrier_wait(handle &C.uv_barrier_t)

struct Barrier {
	handle &C.uv_barrier_t
}

pub fn barrier_init(count int) Barrier {
	b := &C.uv_barrier_t{}
	C.uv_barrier_init(b, usize(count))
	return Barrier{b}
}

pub fn (b &Barrier) destroy() {
	C.uv_barrier_destroy(b.handle)
}

pub fn (b &Barrier) wait() {
	C.uv_barrier_wait(b.handle)
}
