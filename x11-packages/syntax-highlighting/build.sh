TERMUX_PKG_HOMEPAGE='https://api.kde.org/frameworks/ksyntaxhighlighting/html/index.html'
TERMUX_PKG_DESCRIPTION='Syntax highlighting engine for structured text and code'
TERMUX_PKG_LICENSE='MIT'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='6.14.0'
TERMUX_PKG_SRCURL="https://download.kde.org/stable/frameworks/${TERMUX_PKG_VERSION%.*}/syntax-highlighting-${TERMUX_PKG_VERSION}.tar.xz"
TERMUX_PKG_SHA256="dfdc025ac968a7d0cb430826e54f3e96b4ca8798cff4b5df7df493e2d0e4dfbc"
TERMUX_PKG_DEPENDS="qt6-qtbase, libc++"
TERMUX_PKG_BUILD_DEPENDS="extra-cmake-modules (>= ${TERMUX_PKG_VERSION}), qt6-qttools, perl"
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DCMAKE_SYSTEM_NAME=Linux
-DKDE_INSTALL_QMLDIR=lib/qt6/qml
-DKDE_INSTALL_QTPLUGINDIR=lib/qt6/plugins
"

termux_step_host_build() {
	termux_setup_cmake
	cd "$TERMUX_PKG_SRCDIR/src/tools"
	# patch CMakeLists.txt
	mv CMakeLists.txt CMakeLists.txt.bak
	cat > CMakeLists.txt <<-EOF
	cmake_minimum_required(VERSION 3.16)
	add_link_options("-Wl,-rpath=${TERMUX_PREFIX}/opt/qt6/cross/lib")

	find_package(Qt6 REQUIRED COMPONENTS Core Widgets Xml)

	function(ecm_mark_nongui_executable)
	endfunction()

	EOF
	cat CMakeLists.txt.bak >> CMakeLists.txt

	mkdir -p build
	cmake -B build \
		-DCMAKE_BUILD_TYPE=MinSizeRel \
		-DCMAKE_PREFIX_PATH="$TERMUX_PREFIX/opt/qt6/cross/lib/cmake" \
		.
	cmake --build build
	mv CMakeLists.txt.bak CMakeLists.txt
}
