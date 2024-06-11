TERMUX_SUBPKG_DESCRIPTION="pipewire - ALSA configuration"
TERMUX_SUBPKG_INCLUDE="
lib/udev
share/alsa-card-profile
share/alsa/alsa.conf.d/50-pipewire.conf
"

termux_step_create_subpkg_debscripts() {
	cat <<- EOF > ./postinst
	#!$TERMUX_PREFIX/bin/sh
	echo "Installing dependencies through pip..."
	pip3 install scour
	EOF
}
