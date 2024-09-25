# vlang libuv bindings

note this is not fully complete, most structs and functions have been declared for the C side of things, but no v wrappers yet.

## features
1. compiles libuv from source with the v build system

## extra
passing -d uv_static, assumes libuv is installed as a static library at /usr/local/ or /opt/homebrew on macOS
