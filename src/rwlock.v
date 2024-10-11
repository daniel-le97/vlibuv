module vlibuv

// lock functions

fn C.uv_rwlock_init(handle &C.uv_rwlock_t) int
fn C.uv_rwlock_destroy(handle &C.uv_rwlock_t)
fn C.uv_rwlock_rdlock(handle &C.uv_rwlock_t)
fn C.uv_rwlock_tryrdlock(handle &C.uv_rwlock_t) int
fn C.uv_rwlock_rdunlock(handle &C.uv_rwlock_t)
fn C.uv_rwlock_wrlock(handle &C.uv_rwlock_t)
fn C.uv_rwlock_trywrlock(handle &C.uv_rwlock_t) int
fn C.uv_rwlock_wrunlock(handle &C.uv_rwlock_t)

struct Rwlock {
	rwlock &C.uv_rwlock_t
}

pub fn rwlock_init() Rwlock {
	r := &C.uv_rwlock_t{}
	C.uv_rwlock_init(r)
	return Rwlock{r}
}

pub fn (r &Rwlock) destroy() {
	C.uv_rwlock_destroy(r.rwlock)
}

pub fn (r &Rwlock) rdlock() {
	C.uv_rwlock_rdlock(r.rwlock)
}

pub fn (r &Rwlock) tryrdlock() {
	C.uv_rwlock_tryrdlock(r.rwlock)
}

pub fn (r &Rwlock) rdunlock() {
	C.uv_rwlock_rdunlock(r.rwlock)
}

pub fn (r &Rwlock) wrlock() {
	C.uv_rwlock_rdunlock(r.rwlock)
}

pub fn (r &Rwlock) trywrlock() {
	C.uv_rwlock_rdunlock(r.rwlock)
}

pub fn (r &Rwlock) wrunlock() {
	C.uv_rwlock_rdunlock(r.rwlock)
}
