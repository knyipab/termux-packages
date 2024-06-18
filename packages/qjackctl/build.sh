TERMUX_PKG_HOMEPAGE=https://qjackctl.sourceforge.io
TERMUX_PKG_DESCRIPTION="JACK Audio Connection Kit Qt GUI Interface"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_VERSION=0.9.91
TERMUX_PKG_SRCURL=git+https://github.com/rncbc/qjackctl
TERMUX_PKG_GIT_BRANCH=qjackctl_${TERMUX_PKG_VERSION//./_}
TERMUX_PKG_DEPENDS="alsa-lib, hicolor-icon-theme, jack, qt6-qtbase, qt6-qtsvg, qt6-qttools"
TERMUX_PKG_BUILD_DEPENDS="qt6-qtbase-cross-tools, qt6-qttools-cross-tools, jack2"
TERMUX_PKG_AUTO_UPDATE=true
# TODO: remove below line when QSharedMemoryPosix leakage issue is fixed by implementing the libandroid-sysv-semaphore for Android 14+ (https://github.com/termux/termux-packages/issues/20571)
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="-DCONFIG_SYSTEM_TRAY=no -DCONFIG_XUNIQUE=no"
