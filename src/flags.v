module vlibuv

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
	#flag -I @VMODROOT/thirdparty/include
	#flag -I @VMODROOT/thirdparty/src
	#include "uv.h"

	// #common source files
	// #flag @VMODROOT/thirdparty/src/*.c
	#flag @VMODROOT/thirdparty/src/strtok.o
	#flag @VMODROOT/thirdparty/src/idna.o
	#flag @VMODROOT/thirdparty/src/timer.o
	#flag @VMODROOT/thirdparty/src/threadpool.o
	#flag @VMODROOT/thirdparty/src/version.o
	#flag @VMODROOT/thirdparty/src/fs-poll.o
	#flag @VMODROOT/thirdparty/src/inet.o
	#flag @VMODROOT/thirdparty/src/uv-data-getter-setters.o
	#flag @VMODROOT/thirdparty/src/thread-common.o
	#flag @VMODROOT/thirdparty/src/uv-common.o
	#flag @VMODROOT/thirdparty/src/strscpy.o
	#flag @VMODROOT/thirdparty/src/random.o
	#flag @VMODROOT/thirdparty/src/loop-watcher.o

	$if windows {
		#flag @VMODROOT/thirdparty/src/win/thread.o
		#flag @VMODROOT/thirdparty/src/win/async.o
		#flag @VMODROOT/thirdparty/src/win/process.o
		#flag @VMODROOT/thirdparty/src/win/pipe.o
		#flag @VMODROOT/thirdparty/src/win/util.o
		#flag @VMODROOT/thirdparty/src/win/loop-watcher.o
		#flag @VMODROOT/thirdparty/src/win/handle.o
		#flag @VMODROOT/thirdparty/src/win/poll.o
		#flag @VMODROOT/thirdparty/src/win/detect-wakeup.o
		#flag @VMODROOT/thirdparty/src/win/udp.o
		#flag @VMODROOT/thirdparty/src/win/fs.o
		#flag @VMODROOT/thirdparty/src/win/process-stdio.o
		#flag @VMODROOT/thirdparty/src/win/winsock.o
		#flag @VMODROOT/thirdparty/src/win/core.o
		#flag @VMODROOT/thirdparty/src/win/winapi.o
		#flag @VMODROOT/thirdparty/src/win/snprintf.o
		#flag @VMODROOT/thirdparty/src/win/tcp.o
		#flag @VMODROOT/thirdparty/src/win/getaddrinfo.o
		#flag @VMODROOT/thirdparty/src/win/error.o
		#flag @VMODROOT/thirdparty/src/win/getnameinfo.o
		#flag @VMODROOT/thirdparty/src/win/tty.o
		#flag @VMODROOT/thirdparty/src/win/fs-event.o
		#flag @VMODROOT/thirdparty/src/win/signal.o
		#flag @VMODROOT/thirdparty/src/win/dl.o
		#flag @VMODROOT/thirdparty/src/win/stream.o
	}

	// Unix-like specific source files (Linux, macOS, FreeBSD, OpenBSD)
	$if !windows {
		#flag @VMODROOT/thirdparty/src/unix/core.o
		#flag @VMODROOT/thirdparty/src/unix/dl.o
		#flag @VMODROOT/thirdparty/src/unix/fs.o
		#flag @VMODROOT/thirdparty/src/unix/getaddrinfo.o
		#flag @VMODROOT/thirdparty/src/unix/getnameinfo.o
		// #flag @VMODROOT/thirdparty/src/unix/internal.h
		// #flag @VMODROOT/thirdparty/src/unix/loop-watcher.o
		#flag @VMODROOT/thirdparty/src/unix/loop.o
		#flag @VMODROOT/thirdparty/src/unix/pipe.o
		#flag @VMODROOT/thirdparty/src/unix/poll.o
		#flag @VMODROOT/thirdparty/src/unix/process.o
		#flag @VMODROOT/thirdparty/src/unix/random-devurandom.o
		#flag @VMODROOT/thirdparty/src/unix/signal.o
		#flag @VMODROOT/thirdparty/src/unix/stream.o
		#flag @VMODROOT/thirdparty/src/unix/tcp.o
		#flag @VMODROOT/thirdparty/src/unix/thread.o
		#flag @VMODROOT/thirdparty/src/unix/tty.o
		#flag @VMODROOT/thirdparty/src/unix/udp.o
		#flag @VMODROOT/thirdparty/src/unix/async.o
		$if macos {
			#flag -D_DARWIN_USE_64_BIT_INODE=1
			#flag -D_DARWIN_UNLIMITED_SELECT=1
			#flag @VMODROOT/thirdparty/src/unix/bsd-ifaddrs.o
			#flag @VMODROOT/thirdparty/src/unix/darwin-proctitle.o
			// #flag @VMODROOT/thirdparty/src/unix/darwin-stub.h
			#flag @VMODROOT/thirdparty/src/unix/darwin.o
			#flag @VMODROOT/thirdparty/src/unix/fsevents.o
			#flag @VMODROOT/thirdparty/src/unix/kqueue.o
			#flag @VMODROOT/thirdparty/src/unix/proctitle.o
			#flag @VMODROOT/thirdparty/src/unix/random-getentropy.o
		}
		$if freebsd {
			#flag @VMODROOT/thirdparty/src/unix/bsd-ifaddrs.o
			#flag @VMODROOT/thirdparty/src/unix/bsd-proctitle.o
			#flag @VMODROOT/thirdparty/src/unix/freebsd.o
			#flag @VMODROOT/thirdparty/src/unix/kqueue.o
			#flag @VMODROOT/thirdparty/src/unix/posix-hrtime.o
			#flag @VMODROOT/thirdparty/src/unix/random-getrandom.o
		}
		$if dragonfly {
			#flag @VMODROOT/thirdparty/src/unix/bsd-ifaddrs.o
			#flag @VMODROOT/thirdparty/src/unix/bsd-proctitle.o
			#flag @VMODROOT/thirdparty/src/unix/freebsd.o
			#flag @VMODROOT/thirdparty/src/unix/kqueue.o
			#flag @VMODROOT/thirdparty/src/unix/posix-hrtime.o
		}
		$if haiku {
			#flag @VMODROOT/thirdparty/src/unix/bsd-ifaddrs.o
			#flag @VMODROOT/thirdparty/src/unix/haiku.o
			#flag @VMODROOT/thirdparty/src/unix/no-fsevents.o
			#flag @VMODROOT/thirdparty/src/unix/no-proctitle.o
			#flag @VMODROOT/thirdparty/src/unix/posix-hrtime.o
			#flag @VMODROOT/thirdparty/src/unix/posix-poll.o
		}
		$if linux {
			#flag -D_GNU_SOURCE
			#flag @VMODROOT/thirdparty/src/unix/linux.o
			#flag @VMODROOT/thirdparty/src/unix/procfs-exepath.o
			#flag @VMODROOT/thirdparty/src/unix/proctitle.o
			#flag @VMODROOT/thirdparty/src/unix/random-getrandom.o
			#flag @VMODROOT/thirdparty/src/unix/random-sysctl-linux.o
		}
		$if netbsd {
			#flag @VMODROOT/thirdparty/src/unix/bsd-ifaddrs.o
			#flag @VMODROOT/thirdparty/src/unix/bsd-proctitle.o
			#flag @VMODROOT/thirdparty/src/unix/kqueue.o
			#flag @VMODROOT/thirdparty/src/unix/netbsd.o
			#flag @VMODROOT/thirdparty/src/unix/posix-hrtime.o
		}
		$if openbsd {
			#flag @VMODROOT/thirdparty/src/unix/bsd-ifaddrs.o
			#flag @VMODROOT/thirdparty/src/unix/bsd-proctitle.o
			#flag @VMODROOT/thirdparty/src/unix/kqueue.o
			#flag @VMODROOT/thirdparty/src/unix/openbsd.o
			#flag @VMODROOT/thirdparty/src/unix/posix-hrtime.o
			#flag @VMODROOT/thirdparty/src/unix/random-getentropy.o
		}
	}
}
