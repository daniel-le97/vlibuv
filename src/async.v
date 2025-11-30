module vlibuv
import vlibuv.uv
// // async functions
// fn uv.async_init(loop &uv.Uv_loop_t, handle &uv.Uv_async_t, cb fn (handle &uv.Uv_async_t)) int
// fn uv.async_send(handle &uv.Uv_async_t) int

pub struct Async {
pub mut:
	handle &uv.Uv_async_t
}

pub fn Async.new(loop Loop, callback fn (handle Async)) !Async {
	return new_async(loop, callback)
}

pub fn new_async(l &Loop, callback fn (handle Async)) Async {
	a := &uv.Uv_async_t{}
	uv.async_init(l.loop, a, fn [callback] (handle &uv.Uv_async_t) {
		unsafe {
			callback(Async{handle})
		}
	})
	return Async{unsafe { a }}
}

pub fn (a Async) send() !int {
	return error_checker(uv.async_send(a.handle))
}

pub fn (a &Async) raw() &uv.Uv_async_t {
	return a.handle
}
