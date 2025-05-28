TERMUX_PKG_HOMEPAGE=https://www.qt.io/qt-for-python
TERMUX_PKG_DESCRIPTION="Python bindings for Qt6 (includes Shiboken6)"
TERMUX_PKG_LICENSE=LGPL-3.0-or-later
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=6.6.1
TERMUX_PKG_SRCURL=https://download.qt.io/official_releases/QtForPython/pyside6/PySide6-${TERMUX_PKG_VERSION}-src/pyside-setup-opensource-src-${TERMUX_PKG_VERSION}.tar.xz
TERMUX_PKG_SHA256=088284f69a87a03d808e09328178e9a8089097ef801e17b97099ca9eb2319664
TERMUX_PKG_FOLDER_NAME="pyside-setup-opensource-src-${TERMUX_PKG_VERSION}"
TERMUX_PKG_DEPENDS="python, qt6-base, qt6-svg, llvm"
TERMUX_PKG_BUILD_DEPENDS="cmake, ninja, qt6-tools, python"
TERMUX_PKG_BUILD_IN_SRC=true

# LLVM_INSTALL_DIR might need to be adjusted depending on how Termux's LLVM package
# exposes its CMake configuration.
# Common alternatives include ${TERMUX_PREFIX}/lib/cmake/llvm or the output of llvm-config --cmakedir.
# ${TERMUX_PREFIX}/opt/llvm is used here assuming a self-contained LLVM installation in that path.
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DCMAKE_BUILD_TYPE=Release
-DBUILD_TESTS=OFF
-DNO_QT_TOOLS=OFF
-DLLVM_INSTALL_DIR=${TERMUX_PREFIX}/opt/llvm
-DPYTHON_EXECUTABLE=${TERMUX_PREFIX}/bin/python
-DQT_MAJOR_VERSION=6
-DQT_VERSION=${TERMUX_PKG_VERSION}
"

# The default termux_step_configure, termux_step_make, and termux_step_make_install
# are expected to work for a standard CMake project.
# The top-level CMakeLists.txt in pyside-setup-opensource-src-${TERMUX_PKG_VERSION}
# should coordinate the build of Shiboken6 and PySide6.
# No need to override them unless specific issues arise during testing.
