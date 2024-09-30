# vlang libuv bindings

you may need to run 'make update' before developing

```bash
make update
```

## WIP
note this is not fully complete

about ~99% of the libuv api is available

this currently compiles libuv from source or a static library on macos, other platforms have not yet been tested


API is very subject to change, i will most likely be splitting this into submodules

ie. fs functions will be at ./vlibuv/fs


```
import vlibuv.fs
```

## extra
passing -d uv_static, assumes libuv is installed as a static library at /usr/local/ or /opt/homebrew on macOS


## semantics

all types are available via Uv_type_t

ie.

```v
@[typedef]
struct C.uv_tcp_t

pub type Uv_tcp_t = C.uv_tcp_t
```


functions are available without the uv_ prefix


ie.

```v
fn C.uv_version() &usize

pub fn version() &usize {
    return C.uv_version()
}


```
