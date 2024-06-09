TERMUX_PKG_HOMEPAGE=https://gitlab.freedesktop.org/pipewire/helvum
TERMUX_PKG_DESCRIPTION="A GTK patchbay for pipewire."
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="0.5.1"
TERMUX_PKG_SRCURL="https://gitlab.freedesktop.org/pipewire/helvum/-/archive/${TERMUX_PKG_VERSION}/helvum-${TERMUX_PKG_VERSION}.tar.bz2"
TERMUX_PKG_SHA256=18ecba7174bf9f5da39cdf749e6cf260bd09b6831ba2f8165b20771cd10af4e5
TERMUX_PKG_DEPENDS="gdk-pixbuf, glib, graphene, gtk4, hicolor-icon-theme, libadwaita, libcairo, pipewire, pango"
TERMUX_PKG_BUILD_DEPENDS="appstream-glib"
TERMUX_PKG_AUTO_UPDATE=true
