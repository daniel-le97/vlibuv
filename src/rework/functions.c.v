module uv

fn C.uv_version() &u32
fn C.uv_version_string() &char
fn C.uv_library_shutdown()

// typedef void* (*uv_malloc_func)(size_t size);
pub type Malloc_fn = fn (size usize) &u8

// typedef void* (*uv_realloc_func)(void* ptr, size_t size);
pub type Realloc_fn = fn (ptr voidptr, size usize) &u8

// typedef void* (*uv_calloc_func)(size_t count, size_t size);
pub type Calloc_fn = fn (count usize, size usize) &u8

// typedef void (*uv_free_func)(void* ptr);
pub type Free_fn = fn (ptr voidptr) voidptr

fn C.uv_replace_allocator(malloc Malloc_fn, realloc Realloc_fn, calloc Calloc_fn, free Free_fn) int
