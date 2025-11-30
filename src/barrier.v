module vlibuv
import vlibuv.uv

// // barrier functions

// fn uv.barrier_init(handle &uv.Uv_barrier_t, count usize) int
// fn uv.barrier_destroy(handle &uv.Uv_barrier_t)
// fn uv.barrier_wait(handle &uv.Uv_barrier_t)

pub struct Barrier {
	handle &uv.Uv_barrier_t
}

pub fn Barrier.new(count int) Barrier {
	return new_barrier(count)
}

pub fn new_barrier(count int) Barrier {
	b := &uv.Uv_barrier_t{}
	uv.barrier_init(b, usize(count))
	return Barrier{b}
}

pub fn (b &Barrier) destroy() {
	uv.barrier_destroy(b.handle)
}

pub fn (b &Barrier) wait() {
	uv.barrier_wait(b.handle)
}

pub fn (b &Barrier) raw() &uv.Uv_barrier_t {
	return b.handle
}
