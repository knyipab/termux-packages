TERMUX_PKG_HOMEPAGE=https://gitlab.freedesktop.org/pipewire/helvum
TERMUX_PKG_DESCRIPTION="A GTK patchbay for pipewire. "
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="0.5.1"
TERMUX_PKG_SRCURL="https://gitlab.freedesktop.org/pipewire/helvum/-/archive/${TERMUX_PKG_VERSION}/helvum-${TERMUX_PKG_VERSION}.tar.bz2"
TERMUX_PKG_SHA256=d4f5cc0c3a70a91edfc816f12a10426dadd9ca74ea82662e2df5e6c4eb31d8ca
TERMUX_PKG_DEPENDS="gdk-pixbuf, glib, graphene, gtk4, hicolor-icon-theme, libadwaita, libcairo, pipewire, pango"
TERMUX_PKG_BUILD_DEPENDS="appstream-glib"
TERMUX_PKG_AUTO_UPDATE=true

termux_step_pre_configure() {
	termux_setup_meson
	termux_setup_rust
}
