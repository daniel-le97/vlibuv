module vuv

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
	#flag -I @VMODROOT/vuv/thirdparty/include
	#flag -I @VMODROOT/vuv/thirdparty/src
	#include "uv.h"

	// #common source files
	#flag @VMODROOT/vuv/thirdparty/src/strtok.o
	#flag @VMODROOT/vuv/thirdparty/src/idna.o
	#flag @VMODROOT/vuv/thirdparty/src/timer.o
	#flag @VMODROOT/vuv/thirdparty/src/threadpool.o
	#flag @VMODROOT/vuv/thirdparty/src/version.o
	#flag @VMODROOT/vuv/thirdparty/src/fs-poll.o
	#flag @VMODROOT/vuv/thirdparty/src/inet.o
	#flag @VMODROOT/vuv/thirdparty/src/uv-data-getter-setters.o
	#flag @VMODROOT/vuv/thirdparty/src/thread-common.o
	#flag @VMODROOT/vuv/thirdparty/src/uv-common.o
	#flag @VMODROOT/vuv/thirdparty/src/strscpy.o
	#flag @VMODROOT/vuv/thirdparty/src/random.o
	#flag @VMODROOT/vuv/thirdparty/src/loop-watcher.o

	$if windows {
		#flag @VMODROOT/vuv/thirdparty/src/win/thread.o
		#flag @VMODROOT/vuv/thirdparty/src/win/async.o
		#flag @VMODROOT/vuv/thirdparty/src/win/process.o
		#flag @VMODROOT/vuv/thirdparty/src/win/pipe.o
		#flag @VMODROOT/vuv/thirdparty/src/win/util.o
		#flag @VMODROOT/vuv/thirdparty/src/win/loop-watcher.o
		#flag @VMODROOT/vuv/thirdparty/src/win/handle.o
		#flag @VMODROOT/vuv/thirdparty/src/win/poll.o
		#flag @VMODROOT/vuv/thirdparty/src/win/detect-wakeup.o
		#flag @VMODROOT/vuv/thirdparty/src/win/udp.o
		#flag @VMODROOT/vuv/thirdparty/src/win/fs.o
		#flag @VMODROOT/vuv/thirdparty/src/win/process-stdio.o
		#flag @VMODROOT/vuv/thirdparty/src/win/winsock.o
		#flag @VMODROOT/vuv/thirdparty/src/win/core.o
		#flag @VMODROOT/vuv/thirdparty/src/win/winapi.o
		#flag @VMODROOT/vuv/thirdparty/src/win/snprintf.o
		#flag @VMODROOT/vuv/thirdparty/src/win/tcp.o
		#flag @VMODROOT/vuv/thirdparty/src/win/getaddrinfo.o
		#flag @VMODROOT/vuv/thirdparty/src/win/error.o
		#flag @VMODROOT/vuv/thirdparty/src/win/getnameinfo.o
		#flag @VMODROOT/vuv/thirdparty/src/win/tty.o
		#flag @VMODROOT/vuv/thirdparty/src/win/fs-event.o
		#flag @VMODROOT/vuv/thirdparty/src/win/signal.o
		#flag @VMODROOT/vuv/thirdparty/src/win/dl.o
		#flag @VMODROOT/vuv/thirdparty/src/win/stream.o
	}

	// Unix-like specific source files (Linux, macOS, FreeBSD, OpenBSD)
	$if !windows {
		#flag @VMODROOT/vuv/thirdparty/src/unix/core.o
		#flag @VMODROOT/vuv/thirdparty/src/unix/dl.o
		#flag @VMODROOT/vuv/thirdparty/src/unix/fs.o
		#flag @VMODROOT/vuv/thirdparty/src/unix/getaddrinfo.o
		#flag @VMODROOT/vuv/thirdparty/src/unix/getnameinfo.o
		// #flag @VMODROOT/vuv/thirdparty/src/unix/internal.h
		// #flag @VMODROOT/vuv/thirdparty/src/unix/loop-watcher.o
		#flag @VMODROOT/vuv/thirdparty/src/unix/loop.o
		#flag @VMODROOT/vuv/thirdparty/src/unix/pipe.o
		#flag @VMODROOT/vuv/thirdparty/src/unix/poll.o
		#flag @VMODROOT/vuv/thirdparty/src/unix/process.o
		#flag @VMODROOT/vuv/thirdparty/src/unix/random-devurandom.o
		#flag @VMODROOT/vuv/thirdparty/src/unix/signal.o
		#flag @VMODROOT/vuv/thirdparty/src/unix/stream.o
		#flag @VMODROOT/vuv/thirdparty/src/unix/tcp.o
		#flag @VMODROOT/vuv/thirdparty/src/unix/thread.o
		#flag @VMODROOT/vuv/thirdparty/src/unix/tty.o
		#flag @VMODROOT/vuv/thirdparty/src/unix/udp.o
		#flag @VMODROOT/vuv/thirdparty/src/unix/async.o
		$if macos {
			#flag -D_DARWIN_USE_64_BIT_INODE=1
			#flag -D_DARWIN_UNLIMITED_SELECT=1
			#flag @VMODROOT/vuv/thirdparty/src/unix/bsd-ifaddrs.o
			#flag @VMODROOT/vuv/thirdparty/src/unix/darwin-proctitle.o
			// #flag @VMODROOT/vuv/thirdparty/src/unix/darwin-stub.h
			#flag @VMODROOT/vuv/thirdparty/src/unix/darwin.o
			#flag @VMODROOT/vuv/thirdparty/src/unix/fsevents.o
			#flag @VMODROOT/vuv/thirdparty/src/unix/kqueue.o
			#flag @VMODROOT/vuv/thirdparty/src/unix/proctitle.o
			#flag @VMODROOT/vuv/thirdparty/src/unix/random-getentropy.o
		}
		$if freebsd {
			#flag @VMODROOT/vuv/thirdparty/src/unix/bsd-ifaddrs.o
			#flag @VMODROOT/vuv/thirdparty/src/unix/bsd-proctitle.o
			#flag @VMODROOT/vuv/thirdparty/src/unix/freebsd.o
			#flag @VMODROOT/vuv/thirdparty/src/unix/kqueue.o
			#flag @VMODROOT/vuv/thirdparty/src/unix/posix-hrtime.o
			#flag @VMODROOT/vuv/thirdparty/src/unix/random-getrandom.o
		}
		$if dragonfly {
			#flag @VMODROOT/vuv/thirdparty/src/unix/bsd-ifaddrs.o
			#flag @VMODROOT/vuv/thirdparty/src/unix/bsd-proctitle.o
			#flag @VMODROOT/vuv/thirdparty/src/unix/freebsd.o
			#flag @VMODROOT/vuv/thirdparty/src/unix/kqueue.o
			#flag @VMODROOT/vuv/thirdparty/src/unix/posix-hrtime.o
		}
		$if haiku {
			#flag @VMODROOT/vuv/thirdparty/src/unix/bsd-ifaddrs.o
			#flag @VMODROOT/vuv/thirdparty/src/unix/haiku.o
			#flag @VMODROOT/vuv/thirdparty/src/unix/no-fsevents.o
			#flag @VMODROOT/vuv/thirdparty/src/unix/no-proctitle.o
			#flag @VMODROOT/vuv/thirdparty/src/unix/posix-hrtime.o
			#flag @VMODROOT/vuv/thirdparty/src/unix/posix-poll.o
		}
		$if linux {
			#flag -D_GNU_SOURCE
			#flag @VMODROOT/vuv/thirdparty/src/unix/linux.o
			#flag @VMODROOT/vuv/thirdparty/src/unix/procfs-exepath.o
			#flag @VMODROOT/vuv/thirdparty/src/unix/proctitle.o
			#flag @VMODROOT/vuv/thirdparty/src/unix/random-getrandom.o
			#flag @VMODROOT/vuv/thirdparty/src/unix/random-sysctl-linux.o
		}
		$if netbsd {
			#flag @VMODROOT/vuv/thirdparty/src/unix/bsd-ifaddrs.o
			#flag @VMODROOT/vuv/thirdparty/src/unix/bsd-proctitle.o
			#flag @VMODROOT/vuv/thirdparty/src/unix/kqueue.o
			#flag @VMODROOT/vuv/thirdparty/src/unix/netbsd.o
			#flag @VMODROOT/vuv/thirdparty/src/unix/posix-hrtime.o
		}
		$if openbsd {
			#flag @VMODROOT/vuv/thirdparty/src/unix/bsd-ifaddrs.o
			#flag @VMODROOT/vuv/thirdparty/src/unix/bsd-proctitle.o
			#flag @VMODROOT/vuv/thirdparty/src/unix/kqueue.o
			#flag @VMODROOT/vuv/thirdparty/src/unix/openbsd.o
			#flag @VMODROOT/vuv/thirdparty/src/unix/posix-hrtime.o
			#flag @VMODROOT/vuv/thirdparty/src/unix/random-getentropy.o
		}
	}
}
