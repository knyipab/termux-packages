TERMUX_PKG_HOMEPAGE='https://community.kde.org/Frameworks'
TERMUX_PKG_DESCRIPTION='Document centric plugin system'
TERMUX_PKG_LICENSE='LGPL-2.0-only,LGPL-3.0-only'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='6.3.0'
TERMUX_PKG_SRCURL='https://download.kde.org/stable/frameworks/6.3/kparts-6.3.0.tar.xz'
TERMUX_PKG_SHA256='42fc276673f499889d5713d8a9c061c7f7a76885141f214d7f12f9e58ca50400'
TERMUX_PKG_DEPENDS='kf6-kconfig, kf6-kcoreaddons, kf6-ki18n, kf6-kio, kf6-kwidgetsaddons, kf6-kxmlgui, qt6-qtbase, libc++'
TERMUX_PKG_BUILD_DEPENDS='doxygen, extra-cmake-modules, qt6-qttools, kf6-kconfig-cross-tools'
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
	-DCMAKE_SYSTEM_NAME=Linux
	-DBUILD_TESTING=OFF
	-DBUILD_QCH=OFF
	-DKF6_HOST_TOOLING=$TERMUX_PREFIX/opt/kf6/cross/lib/cmake/
"

termux_step_pre_configure() {
	return 0
}
