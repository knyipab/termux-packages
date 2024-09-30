TERMUX_PKG_HOMEPAGE='https://community.kde.org/Frameworks'
TERMUX_PKG_DESCRIPTION='Widgets for KConfig'
TERMUX_PKG_LICENSE="LGPL-2.0, LGPL-3.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=6.6.0
TERMUX_PKG_SRCURL=https://download.kde.org/stable/frameworks/${TERMUX_PKG_VERSION%.*}/kconfigwidgets-${TERMUX_PKG_VERSION}.tar.xz
TERMUX_PKG_SHA256=83b141867609a8e63e3cbe874e519f2d3d8a53ff7dce958b8157c697d5cc5872
TERMUX_PKG_DEPENDS="kf6-kcodecs, kf6-kcolorscheme, kf6-kconfig, kf6-kcoreaddons, kf6-ki18n, kf6-kwidgetsaddons, qt6-qtbase"
TERMUX_PKG_BUILD_DEPENDS="extra-cmake-modules, qt6-qttools"
TERMUX_PKG_AUTO_UPDATE=true
