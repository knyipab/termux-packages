TERMUX_PKG_HOMEPAGE=https://www.libraw.org
TERMUX_PKG_DESCRIPTION="A library for reading RAW files obtained from digital photo cameras (CRW/CR2, NEF, RAF, DNG, and others"
TERMUX_PKG_LICENSE="LGPL-2.1"
TERMUX_PKG_MAINTAINER="@termux-user-repository"
TERMUX_PKG_VERSION=0.21.3
TERMUX_PKG_SRCURL=https://www.libraw.org/data/LibRaw-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=dba34b7fc1143503942fa32ad9db43e94f714e62a4a856e91617f8f3e1e0aa5c
TERMUX_PKG_DEPENDS="littlecms, libjasper"
TERMUX_PKG_AUTO_UPDATE=true

termux_step_pre_configure() {
	LDFLAGS+=" $($CC -print-libgcc-file-name) -fopenmp -static-openmp"
}
