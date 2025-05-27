TERMUX_PKG_HOMEPAGE='https://apps.kde.org/kate/'
TERMUX_PKG_DESCRIPTION='Advanced text editor'
TERMUX_PKG_LICENSE="GPL-2.0-or-later LGPL-2.0-or-later"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="25.04.1"
TERMUX_PKG_SRCURL="https://download.kde.org/stable/release-service/${TERMUX_PKG_VERSION}/src/kate-${TERMUX_PKG_VERSION}.tar.xz"
TERMUX_PKG_SHA256='820f0412a8485472844ea83881c47e1b90093ce3e2729e6910f9d3593fe530aa'

TERMUX_PKG_DEPENDS="libc++, kf6-karchive, kf6-kbookmarks, kf6-kcolorscheme, kf6-kcompletion, kf6-kconfig, kf6-kconfigwidgets, kf6-kcoreaddons, kf6-kguiaddons, kf6-ki18n, kf6-kiconthemes, kf6-kio, kf6-knewstuff, kf6-kparts, kf6-kservice, kf6-ktexteditor, kf6-kuserfeedback, kf6-kwidgetsaddons, kf6-kwindowsystem, kf6-kxmlgui, qt6-qtbase, kf6-ksyntaxhighlighting"

TERMUX_PKG_BUILD_DEPENDS="extra-cmake-modules, kf6-kdoctools, qtkeychain-qt6, kf6-kconfig-cross-tools"

TERMUX_PKG_AUTO_UPDATE=true

TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DCMAKE_SYSTEM_NAME=Linux
-DBUILD_TESTING=OFF
-DKF6_HOST_TOOLING=$TERMUX_PREFIX/opt/kf6/cross/lib/cmake/
"

termux_step_pre_configure() {
    # Empty for now
    return 0
}
