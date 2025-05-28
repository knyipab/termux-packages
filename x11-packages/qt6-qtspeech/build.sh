TERMUX_PKG_HOMEPAGE='https://www.qt.io'
TERMUX_PKG_DESCRIPTION='Qt Speech support'
TERMUX_PKG_LICENSE='GPL-3.0-only,LGPL-3.0-only'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='6.9.0'
TERMUX_PKG_SRCURL='https://download.qt.io/official_releases/qt/6.9/6.9.0/submodules/qtspeech-everywhere-src-6.9.0.tar.xz'
TERMUX_PKG_SHA256='a981b68c71743d77a3ce4437ad118d3851390f05a1ab26a859fb9b8c5938c971'
TERMUX_PKG_DEPENDS='qt6-qtbase, qt6-qtmultimedia, libc++'
TERMUX_PKG_BUILD_DEPENDS='cmake, ninja, qt6-qtdeclarative'
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
	-DCMAKE_SYSTEM_NAME=Linux
	-DBUILD_TESTING=OFF
	-DQT_BUILD_TESTS=OFF
	-DQT_BUILD_EXAMPLES=OFF
"

termux_step_pre_configure() {
	return 0
}
