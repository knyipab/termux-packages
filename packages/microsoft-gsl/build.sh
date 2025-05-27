TERMUX_PKG_HOMEPAGE=https://github.com/microsoft/GSL
TERMUX_PKG_DESCRIPTION="Microsoft GSL (Guidelines Support Library) implementation"
TERMUX_PKG_LICENSE=MIT
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=4.0.0
TERMUX_PKG_SRCURL=https://github.com/microsoft/GSL/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=23a2659d620899d0a30036240e07b7050108ab1000bd9a0c3582013d6a5180b4
TERMUX_PKG_PLATFORM_INDEPENDENT=true
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make_install() {
	mkdir -p $TERMUX_PREFIX/include/gsl
	# The archive extracts to GSL-${TERMUX_PKG_VERSION}
	# Headers are in GSL-${TERMUX_PKG_VERSION}/include/gsl/
	cp -r GSL-${TERMUX_PKG_VERSION}/include/gsl/* $TERMUX_PREFIX/include/gsl/
}

termux_step_make() {
	# Nothing to make
	return 0
}

termux_step_configure() {
	# Nothing to configure
	return 0
}
