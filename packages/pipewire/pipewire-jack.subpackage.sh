TERMUX_SUBPKG_DESCRIPTION="pipewire - JACK replacement"
TERMUX_SUBPKG_INCLUDE="
bin/pw-jack
include/jack
lib/libjack*
lib/pkgconfig/jack.pc
share/pipewire/jack.conf
"
TERMUX_SUBPKG_CONFLICTS="jack1, jack2"
