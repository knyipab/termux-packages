TERMUX_PKG_HOMEPAGE=http://utf8cpp.sourceforge.net/
TERMUX_PKG_DESCRIPTION="UTF-8 header-only library for C++"
TERMUX_PKG_LICENSE=BSL-1.0
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=2.3.4
TERMUX_PKG_SRCURL=https://downloads.sourceforge.net/project/utf8cpp/utf8cpp/utf8_v${TERMUX_PKG_VERSION}.zip
TERMUX_PKG_SHA256=9572c873999773297082f50367187e03935483f90c7f7a9e002658f0f19303e7
TERMUX_PKG_PLATFORM_INDEPENDENT=true
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make_install() {
	mkdir -p $TERMUX_PREFIX/include/utf8cpp
	cp -r source/* $TERMUX_PREFIX/include/utf8cpp/
}

termux_step_make() {
	# Nothing to make
	return 0
}

termux_step_configure() {
	# Nothing to configure
	return 0
}
