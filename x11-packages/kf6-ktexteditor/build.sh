TERMUX_PKG_HOMEPAGE='https://community.kde.org/Frameworks'
TERMUX_PKG_DESCRIPTION='Advanced embeddable text editor'
TERMUX_PKG_LICENSE='LGPL-2.0-only,LGPL-3.0-only'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='6.3.0'
TERMUX_PKG_SRCURL='https://download.kde.org/stable/frameworks/6.3/ktexteditor-6.3.0.tar.xz'
TERMUX_PKG_SHA256='979dbffaeb0a0413b3745efa180aa0be6e1ed8bf8f5a938281499b931e283776'
TERMUX_PKG_DEPENDS='editorconfig-core-c, kf6-karchive, kf6-kauth, kf6-kcodecs, kf6-kcolorscheme, kf6-kcompletion, kf6-kconfig, kf6-kconfigwidgets, kf6-kcoreaddons, kf6-kguiaddons, kf6-ki18n, kf6-kio, kf6-kitemviews, kf6-kparts, kf6-kwidgetsaddons, kf6-kxmlgui, qt6-qtdeclarative, qt6-qtbase, qt6-qtspeech, kf6-sonnet, syntax-highlighting, libc++'
TERMUX_PKG_BUILD_DEPENDS='doxygen, extra-cmake-modules, qt6-qttools, kf6-kconfig-cross-tools'
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
	-DCMAKE_SYSTEM_NAME=Linux
	-DBUILD_TESTING=OFF
	-DBUILD_QCH=OFF
	-DKF6_HOST_TOOLING=$TERMUX_PREFIX/opt/kf6/cross/lib/cmake/
	-DKDE_INSTALL_QMLDIR=lib/qt6/qml
	-DKDE_INSTALL_QTPLUGINDIR=lib/qt6/plugins
"

termux_step_pre_configure() {
	return 0
}
