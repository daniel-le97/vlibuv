module vlibuv

// async functions
fn C.uv_async_init(loop &C.uv_loop_t, handle &C.uv_async_t, cb fn (handle &C.uv_async_t)) int
fn C.uv_async_send(handle &C.uv_async_t) int

pub struct Async {
	Handle
}

pub fn async_init(l &Loop, callback fn (handle Async)) Async {
	a := &C.uv_async_t{}
	C.uv_async_init(l.loop, a, fn [callback] (handle &C.uv_async_t) {
		unsafe {
			callback(Async{Handle{handle}})
		}
	})
	return Async{Handle{a}}
}

pub fn (a Async) send() !int {
	return error_checker(C.uv_async_send(a.handle))
}
