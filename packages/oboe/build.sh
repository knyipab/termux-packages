TERMUX_PKG_HOMEPAGE=https://github.com/google/oboe
TERMUX_PKG_DESCRIPTION="Oboe is a C++ library that makes it easy to build high-performance audio apps on Android."
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="1.8.1"
TERMUX_PKG_SRCURL="https://github.com/google/oboe/releases/download/$TERMUX_PKG_VERSION/oboe-$TERMUX_PKG_VERSION.aar"
TERMUX_PKG_SHA256=88e29b4fbd0ba8c60970fc785de480f6fed2aa7319c05cfaa44082f13bb8bfdf
TERMUX_PKG_AUTO_UPDATE=true

termux_step_make_install() {
	if [ "$TERMUX_ARCH" = "arm" ]; then
		arch_suffix="armeabi-v7a"
	elif [ "$TERMUX_ARCH" = "aarch64" ]; then
		arch_suffix="arm64-v8a"
	elif [ "$TERMUX_ARCH" = "i686" ]; then
		arch_suffix="x86"
	elif [ "$TERMUX_ARCH" = "x86_64" ]; then
		arch_suffix="x86_64"
	else
		echo "unknown arch"
		exit 1
	fi
	install -Dm 644 prefab/modules/oboe/include $(TERMUX_PREFIX)/include
	install -Dm 644 prefab/modules/oboe/libs/android.$arch_suffix $(TERMUX_PREFIX)/lib
}
