module vuv
// semaphore functions
fn C.uv_sem_init(sem &C.uv_sem_t, value usize) int
fn C.uv_sem_destroy(sem &C.uv_sem_t)
fn C.uv_sem_post(sem &C.uv_sem_t)
fn C.uv_sem_wait(sem &C.uv_sem_t)
fn C.uv_sem_trywait(sem &C.uv_sem_t) int

struct Semaphore {
	sem &C.uv_sem_t
}

pub fn sem_init(value int) Semaphore {
	s := &C.uv_sem_t(unsafe { nil })
	C.uv_sem_init(s, usize(value))
	return Semaphore{s}
}

pub fn (s &Semaphore) destroy() {
	C.uv_sem_destroy(s.sem)
}

pub fn (s &Semaphore) post() {
	C.uv_sem_post(s.sem)
}

pub fn (s &Semaphore) wait() {
	C.uv_sem_wait(s.sem)
}

pub fn (s &Semaphore) trywait() {
	C.uv_sem_trywait(s.sem)
}
