TERMUX_PKG_HOMEPAGE=https://jackaudio.org/
TERMUX_PKG_DESCRIPTION="jack2 (non-functioning, for building pipewire)"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_DEPENDS="libdb, libandroid-sysv-semaphore, libandroid-shmem"
TERMUX_PKG_VERSION=1.9.22
TERMUX_PKG_SRCURL=https://github.com/jackaudio/jack2/archive/refs/tags/v$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=1e42b9fc4ad7db7befd414d45ab2f8a159c0b30fcd6eee452be662298766a849
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_configure() {
	CFLAGS+=" -ffast-math"
	CXXFLAGS+=" -ffast-math"
	LDFLAGS+=" -Wl,--as-needed"
	python3 ./waf configure --alsa --classic --prefix="$TERMUX_PREFIX"
}

termux_step_make() {
	python3 ./waf build -j $TERMUX_MAKE_PROCESSES
}

termux_step_make_install() {
	python3 ./waf install --destdir="$TERMUX_PREFIX"
}
