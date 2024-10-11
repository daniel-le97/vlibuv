# vlibuv

v bindings for libuv


you may need to run 'make update' before developing

```bash
make update
```

## version 0.0.2

old bindings have been moved to ./uv

```
// http_server_uv.v
import vlibuv.uv
```

new bindings are now available via vlibuv

```
import vlibuv
```

new bindings are not fully complete i am missing the following, but may be missing more

- fs
- pipe
- dl
- key

## note

this currently compiles libuv from source or a static library on macos, other platforms have not yet been tested

passing -d uv_static, assumes libuv is installed as a static library at /usr/local/ or /opt/homebrew on macOS
