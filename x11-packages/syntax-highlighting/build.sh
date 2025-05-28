TERMUX_PKG_HOMEPAGE='https://api.kde.org/frameworks/ksyntaxhighlighting/html/index.html'
TERMUX_PKG_DESCRIPTION='Syntax highlighting engine for Kate syntax definitions'
TERMUX_PKG_LICENSE='MIT'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='6.3.0'
TERMUX_PKG_SRCURL='https://download.kde.org/stable/frameworks/6.3/syntax-highlighting-6.3.0.tar.xz'
TERMUX_PKG_SHA256='38300a35c969bef5fa36b437d54342da0a0c805282a657519bd4e2f7b42df984'
TERMUX_PKG_DEPENDS='qt6-qtbase, libc++'
TERMUX_PKG_BUILD_DEPENDS='extra-cmake-modules, kf6-kconfig-cross-tools, perl'
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
	-DCMAKE_SYSTEM_NAME=Linux
	-DBUILD_TESTING=OFF
	-DKF6_HOST_TOOLING=$TERMUX_PREFIX/opt/kf6/cross/lib/cmake/
"

termux_step_pre_configure() {
	return 0
}
