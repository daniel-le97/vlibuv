# vlibuv

v bindings for libuv

## install

```
v install --git https://github.com/daniel-le97/vlibuv.git
```

you may need to run 'make update' before developing

```bash
make update
```

## version 0.0.2

direct lower level bindings to libuv are in ./uv and these should be mostly complete

```
import vlibuv.uv
```

higher level bindings are available via the main vlibuv module, but these are not fully complete

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
