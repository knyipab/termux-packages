TERMUX_PKG_HOMEPAGE=https://github.com/fastfloat/fast_float
TERMUX_PKG_DESCRIPTION="Fast and exact implementation of from_chars for float and double types"
TERMUX_PKG_LICENSE="MIT OR Apache-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=6.1.1
TERMUX_PKG_SRCURL=https://github.com/fastfloat/fast_float/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=01a30a6a83843883560a79e050b36c805327bdcb804595046c35d1481d706270
TERMUX_PKG_PLATFORM_INDEPENDENT=true
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make_install() {
	mkdir -p $TERMUX_PREFIX/include/fast_float
	# The archive extracts to fast_float-${TERMUX_PKG_VERSION}
	# Headers are in fast_float-${TERMUX_PKG_VERSION}/include/fast_float/
	cp -r fast_float-${TERMUX_PKG_VERSION}/include/fast_float/* $TERMUX_PREFIX/include/fast_float/
}

termux_step_make() {
	# Nothing to make
	return 0
}

termux_step_configure() {
	# Nothing to configure
	return 0
}
