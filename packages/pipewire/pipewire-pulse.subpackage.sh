TERMUX_SUBPKG_DESCRIPTION="pipewire - ALSA configuration"
$_so_ver=0.3
TERMUX_SUBPKG_INCLUDE="
bin/pipewire-pulse
etc/pipewire/pipewire-pulse.conf.d
lib/pipewire-$_so_ver/libpipewire-module-protocol-pulse.so
lib/pipewire-$_so_ver/libpipewire-module-pulse-tunnel.so
share/pipewire/pipewire-pulse.conf*
"
