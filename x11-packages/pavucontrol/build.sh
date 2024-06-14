TERMUX_PKG_HOMEPAGE=https://freedesktop.org/software/pulseaudio/pavucontrol/
TERMUX_PKG_DESCRIPTION="PulseAudio Volume Control"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=6.0
TERMUX_PKG_SRCURL=https://gitlab.freedesktop.org/pulseaudio/pavucontrol/-/archive/v$TERMUX_PKG_VERSION/pavucontrol-v$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=0d7ced3b9d215bcfae8fd5df5429aa07b0517984925cfa1cd020a9505749a994
TERMUX_PKG_DEPENDS="gtk4, gtkmm4, json-glib, libcanberra, pulseaudio, libsigc++-3.0"
TERMUX_PKG_AUTO_UPDATE=true
