TERMUX_PKG_HOMEPAGE='https://community.kde.org/Frameworks'
TERMUX_PKG_DESCRIPTION='Framework for collecting user feedback'
TERMUX_PKG_LICENSE='LGPL-2.0-only,LGPL-3.0-only'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='6.3.0'
TERMUX_PKG_SRCURL='https://download.kde.org/stable/frameworks/6.3/kuserfeedback-6.3.0.tar.xz'
TERMUX_PKG_SHA256='3fe2ce37b92a70d604f38fa369b5fe2ea64e268c48aa450e9971fc8404e87006'
TERMUX_PKG_DEPENDS='qt6-qtbase, libc++, qt6-qtdeclarative, qt6-qtsvg'
TERMUX_PKG_BUILD_DEPENDS='extra-cmake-modules, qt6-qtcharts, qt6-qttools, kf6-kconfig-cross-tools'
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
	-DCMAKE_SYSTEM_NAME=Linux
	-DBUILD_TESTING=OFF
	-DKF6_HOST_TOOLING=$TERMUX_PREFIX/opt/kf6/cross/lib/cmake/
	-DKDE_INSTALL_QMLDIR=lib/qt6/qml
	-DKDE_INSTALL_QTPLUGINDIR=lib/qt6/plugins
"

termux_step_pre_configure() {
	return 0
}
