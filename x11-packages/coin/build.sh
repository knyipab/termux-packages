TERMUX_PKG_HOMEPAGE=https://coin3d.github.io/
TERMUX_PKG_DESCRIPTION="High-level, retained-mode 3D graphics library (Open Inventor clone)"
TERMUX_PKG_LICENSE="BSD 3-Clause"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=4.0.2
TERMUX_PKG_SRCURL=https://github.com/coin3d/coin/archive/refs/tags/Coin-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=b72f8f93197100250a9f323730964eba5178a50a9956a7c7a309d7de5a806c8a
TERMUX_PKG_DEPENDS="boost, libglu"
TERMUX_PKG_BUILD_DEPENDS="cmake, ninja, doxygen, boost"
TERMUX_PKG_BUILD_IN_SRC=true

# Note: The archive extracts to a directory like coin-Coin-4.0.2.
# If the build system does not automatically find the CMakeLists.txt,
# TERMUX_PKG_SRCDIR might need to be set to "coin-Coin-${TERMUX_PKG_VERSION}"
# or termux_step_pre_configure() might need:
# cd coin-Coin-${TERMUX_PKG_VERSION}

TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DCMAKE_BUILD_TYPE=Release
-DBUILD_SHARED_LIBS=ON
-DCOIN_BUILD_DOCUMENTATION=OFF
-DCOIN_BUILD_DOXYGEN_DOCUMENTATION=OFF
-DCOIN_BUILD_TESTS=OFF
-DCOIN_BUILD_EXAMPLES=OFF
-DCOIN_THREADSAFE=ON
-DCOIN_USE_CPP11=ON
-DCOIN_USE_SYSTEM_BOOST=ON
-DCOIN_USE_OPENGL_ES1=OFF
-DCOIN_USE_OPENGL_ES2=ON
-DCOIN_INSTALL_PCH=OFF
-DCOIN_BUILD_MAC_FRAMEWORK=OFF
-DCOIN_BUILD_MSVC_STATIC_RUNTIME=OFF
"

# The default termux_step_configure, termux_step_make, and termux_step_make_install
# are expected to work for a standard CMake project.
# No need to override them unless specific issues arise during testing.
