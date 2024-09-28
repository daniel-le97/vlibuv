module main

//  add -d uv_static to your v build command to use libuv static library instead of building from source
const compile_static = $d('uv_static', false)

const libuv_path = $env('LIBUV_PATH')

$if compile_static {
	$if macos {
		#flag -I /opt/homebrew/include
		#flag -L /opt/homebrew/lib
		#flag -l uv
		#include "uv.h"
	} $else {
		#flag -I /usr/local/include
		#flag -L /usr/local/lib
		#flag -l uv
		#include "uv.h"
	}
} $else {
	#flag -I @VMODROOT/src/thirdparty/include
	#flag -I @VMODROOT/src/thirdparty/src
	#include "uv.h"

	// #common source files
	#flag @VMODROOT/src/thirdparty/src/strtok.o
	#flag @VMODROOT/src/thirdparty/src/idna.o
	#flag @VMODROOT/src/thirdparty/src/timer.o
	#flag @VMODROOT/src/thirdparty/src/threadpool.o
	#flag @VMODROOT/src/thirdparty/src/version.o
	#flag @VMODROOT/src/thirdparty/src/fs-poll.o
	#flag @VMODROOT/src/thirdparty/src/inet.o
	#flag @VMODROOT/src/thirdparty/src/uv-data-getter-setters.o
	#flag @VMODROOT/src/thirdparty/src/thread-common.o
	#flag @VMODROOT/src/thirdparty/src/uv-common.o
	#flag @VMODROOT/src/thirdparty/src/strscpy.o
	#flag @VMODROOT/src/thirdparty/src/random.o

	$if windows {
		#flag @VMODROOT/src/thirdparty/src/win/thread.o
		#flag @VMODROOT/src/thirdparty/src/win/async.o
		#flag @VMODROOT/src/thirdparty/src/win/process.o
		#flag @VMODROOT/src/thirdparty/src/win/pipe.o
		#flag @VMODROOT/src/thirdparty/src/win/util.o
		#flag @VMODROOT/src/thirdparty/src/win/loop-watcher.o
		#flag @VMODROOT/src/thirdparty/src/win/handle.o
		#flag @VMODROOT/src/thirdparty/src/win/poll.o
		#flag @VMODROOT/src/thirdparty/src/win/detect-wakeup.o
		#flag @VMODROOT/src/thirdparty/src/win/udp.o
		#flag @VMODROOT/src/thirdparty/src/win/fs.o
		#flag @VMODROOT/src/thirdparty/src/win/process-stdio.o
		#flag @VMODROOT/src/thirdparty/src/win/winsock.o
		#flag @VMODROOT/src/thirdparty/src/win/core.o
		#flag @VMODROOT/src/thirdparty/src/win/winapi.o
		#flag @VMODROOT/src/thirdparty/src/win/snprintf.o
		#flag @VMODROOT/src/thirdparty/src/win/tcp.o
		#flag @VMODROOT/src/thirdparty/src/win/getaddrinfo.o
		#flag @VMODROOT/src/thirdparty/src/win/error.o
		#flag @VMODROOT/src/thirdparty/src/win/getnameinfo.o
		#flag @VMODROOT/src/thirdparty/src/win/tty.o
		#flag @VMODROOT/src/thirdparty/src/win/fs-event.o
		#flag @VMODROOT/src/thirdparty/src/win/signal.o
		#flag @VMODROOT/src/thirdparty/src/win/dl.o
		#flag @VMODROOT/src/thirdparty/src/win/stream.o
	}

	// Unix-like specific source files (Linux, macOS, FreeBSD, OpenBSD)
	$if !windows {
		#flag @VMODROOT/src/thirdparty/src/unix/core.o
		#flag @VMODROOT/src/thirdparty/src/unix/dl.o
		#flag @VMODROOT/src/thirdparty/src/unix/fs.o
		#flag @VMODROOT/src/thirdparty/src/unix/getaddrinfo.o
		#flag @VMODROOT/src/thirdparty/src/unix/getnameinfo.o
		// #flag @VMODROOT/src/thirdparty/src/unix/internal.h
		#flag @VMODROOT/src/thirdparty/src/unix/loop-watcher.o
		#flag @VMODROOT/src/thirdparty/src/unix/loop.o
		#flag @VMODROOT/src/thirdparty/src/unix/pipe.o
		#flag @VMODROOT/src/thirdparty/src/unix/poll.o
		#flag @VMODROOT/src/thirdparty/src/unix/process.o
		#flag @VMODROOT/src/thirdparty/src/unix/random-devurandom.o
		#flag @VMODROOT/src/thirdparty/src/unix/signal.o
		#flag @VMODROOT/src/thirdparty/src/unix/stream.o
		#flag @VMODROOT/src/thirdparty/src/unix/tcp.o
		#flag @VMODROOT/src/thirdparty/src/unix/thread.o
		#flag @VMODROOT/src/thirdparty/src/unix/tty.o
		#flag @VMODROOT/src/thirdparty/src/unix/udp.o
		#flag @VMODROOT/src/thirdparty/src/unix/async.o
		$if macos {
			#flag -D_DARWIN_USE_64_BIT_INODE=1
			#flag -D_DARWIN_UNLIMITED_SELECT=1
			#flag @VMODROOT/src/thirdparty/src/unix/bsd-ifaddrs.o
			#flag @VMODROOT/src/thirdparty/src/unix/darwin-proctitle.o
			// #flag @VMODROOT/src/thirdparty/src/unix/darwin-stub.h
			#flag @VMODROOT/src/thirdparty/src/unix/darwin.o
			#flag @VMODROOT/src/thirdparty/src/unix/fsevents.o
			#flag @VMODROOT/src/thirdparty/src/unix/kqueue.o
			#flag @VMODROOT/src/thirdparty/src/unix/proctitle.o
			#flag @VMODROOT/src/thirdparty/src/unix/random-getentropy.o
		}
		$if freebsd {
			#flag @VMODROOT/src/thirdparty/src/unix/bsd-ifaddrs.o
			#flag @VMODROOT/src/thirdparty/src/unix/bsd-proctitle.o
			#flag @VMODROOT/src/thirdparty/src/unix/freebsd.o
			#flag @VMODROOT/src/thirdparty/src/unix/kqueue.o
			#flag @VMODROOT/src/thirdparty/src/unix/posix-hrtime.o
			#flag @VMODROOT/src/thirdparty/src/unix/random-getrandom.o
		}
		$if dragonfly {
			#flag @VMODROOT/src/thirdparty/src/unix/bsd-ifaddrs.o
			#flag @VMODROOT/src/thirdparty/src/unix/bsd-proctitle.o
			#flag @VMODROOT/src/thirdparty/src/unix/freebsd.o
			#flag @VMODROOT/src/thirdparty/src/unix/kqueue.o
			#flag @VMODROOT/src/thirdparty/src/unix/posix-hrtime.o
		}
		$if haiku {
			#flag @VMODROOT/src/thirdparty/src/unix/bsd-ifaddrs.o
			#flag @VMODROOT/src/thirdparty/src/unix/haiku.o
			#flag @VMODROOT/src/thirdparty/src/unix/no-fsevents.o
			#flag @VMODROOT/src/thirdparty/src/unix/no-proctitle.o
			#flag @VMODROOT/src/thirdparty/src/unix/posix-hrtime.o
			#flag @VMODROOT/src/thirdparty/src/unix/posix-poll.o
		}
		$if linux {
			#flag -D_GNU_SOURCE
			#flag @VMODROOT/src/thirdparty/src/unix/linux.o
			#flag @VMODROOT/src/thirdparty/src/unix/procfs-exepath.o
			#flag @VMODROOT/src/thirdparty/src/unix/proctitle.o
			#flag @VMODROOT/src/thirdparty/src/unix/random-getrandom.o
			#flag @VMODROOT/src/thirdparty/src/unix/random-sysctl-linux.o
		}
		$if netbsd {
			#flag @VMODROOT/src/thirdparty/src/unix/bsd-ifaddrs.o
			#flag @VMODROOT/src/thirdparty/src/unix/bsd-proctitle.o
			#flag @VMODROOT/src/thirdparty/src/unix/kqueue.o
			#flag @VMODROOT/src/thirdparty/src/unix/netbsd.o
			#flag @VMODROOT/src/thirdparty/src/unix/posix-hrtime.o
		}
		$if openbsd {
			#flag @VMODROOT/src/thirdparty/src/unix/bsd-ifaddrs.o
			#flag @VMODROOT/src/thirdparty/src/unix/bsd-proctitle.o
			#flag @VMODROOT/src/thirdparty/src/unix/kqueue.o
			#flag @VMODROOT/src/thirdparty/src/unix/openbsd.o
			#flag @VMODROOT/src/thirdparty/src/unix/posix-hrtime.o
			#flag @VMODROOT/src/thirdparty/src/unix/random-getentropy.o
		}
	}
}
