# vlibuv

v bindings for libuv

## note
this currently compiles libuv from source on Ubuntu, macOS, and Windows, other platforms have not yet been tested

V version: V 0.4.12, Commit: d0dc13e
libuv version: branch v1.x, Commit: 8e02462

passing -d uv_static, assumes libuv is installed as a static library at /usr/local/ or /opt/homebrew on macOS

using TCC is currently not supported on windows.

## Install

```
v install --git https://github.com/daniel-le97/vlibuv.git
```
or
```
git clone https://github.com/daniel-le97/vlibuv.git ~/.vmodules/vlibuv
```

## Development
you may need to run "build.vsh update" and "build.vsh symlink" before developing

```bash
v run build.vsh update
```
- updates libuv, only do this if you really need

```bash

v run build.vsh symlink
```
 - symlinks this project to ~/.vmodules

## Version 0.0.4

direct lower level bindings to libuv are in ./uv and these should be mostly complete

```
import vlibuv.uv
```

higher level bindings are available via the main vlibuv module, but these are not fully complete.

the higher level bindings are made with the lower level bindings so there are plenty of escape hatches

```
import vlibuv
```


missing:
 - udp
 - thread
 - os
 - fs



