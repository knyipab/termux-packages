TERMUX_PKG_HOMEPAGE=https://github.com/coin3d/pivy
TERMUX_PKG_DESCRIPTION="Python bindings for Coin3D library"
TERMUX_PKG_LICENSE=BSD-3-Clause
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=0.6.9
TERMUX_PKG_SRCURL=https://github.com/coin3d/pivy/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=260305071989ac68536e95a080d22f411ab5f6762149cd1b3b96126e4ea61c0a
TERMUX_PKG_DEPENDS="python, coin, pyside6, qt6-base, python-numpy"
TERMUX_PKG_BUILD_DEPENDS="cmake, ninja, swig, python-setuptools, boost"
TERMUX_PKG_BUILD_IN_SRC=true

TERMUX_PKG_EXTRA_CONFIGURE_ARGS=" \
    -DCMAKE_BUILD_TYPE=Release \
    -DPIVY_USE_QT6=ON \
    -DPIVY_BUILD_WITH_SOQT=OFF \
    -DPYTHON_EXECUTABLE=${TERMUX_PREFIX}/bin/python \
    -DSITE_INSTALL_DIR=${TERMUX_PREFIX}/lib/python\$(termux_python_get_major_minor)/site-packages \
"

# Default termux_step_configure, termux_step_make, and termux_step_make_install
# are used for CMake projects.
