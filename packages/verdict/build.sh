TERMUX_PKG_HOMEPAGE=https://github.com/sandialabs/verdict
TERMUX_PKG_DESCRIPTION="Sandia's Verdict Library for mesh verification"
TERMUX_PKG_LICENSE=LGPL2.1
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=1.6.3
TERMUX_PKG_SRCURL=https://github.com/sandialabs/verdict/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=69052d806b89f2a0333199610ba604d09c64ed95157f2770579104148450718a
TERMUX_PKG_BUILD_DEPENDS="cmake, ninja"
# No explicit TERMUX_PKG_DEPENDS beyond standard C++ runtime
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DCMAKE_BUILD_TYPE=Release
-DBUILD_SHARED_LIBS=ON
-DVERDICT_ENABLE_TESTS=OFF
-DVERDICT_ENABLE_EXAMPLES=OFF
"

# The default termux_step_configure, termux_step_make, and termux_step_make_install
# are expected to work for a standard CMake project.
# No need to override them.
