TERMUX_PKG_HOMEPAGE=https://fritzing.org/
TERMUX_PKG_DESCRIPTION="An Electronic Design Automation software (parts files)"
TERMUX_PKG_LICENSE="custom"
TERMUX_PKG_LICENSE_FILE="LICENSE.txt"
TERMUX_PKG_MAINTAINER="@termux"
# Nowadays the release build seems to be hidden behind a paywall.
# Then we need to guess based on the github repo
_COMMIT=76235099ed556e52003de63522fdd74e61d53a36
TERMUX_PKG_VERSION=1.0.4
TERMUX_PKG_SRCURL=git+https://github.com/fritzing/fritzing-parts
TERMUX_PKG_GIT_BRANCH=develop

termux_step_post_get_source() {
	git fetch --unshallow
	git checkout $_COMMIT
}

termux_step_make_install() {
	mkdir -p $TERMUX_PREFIX/share/fritzing/parts
	cp -r $TERMUX_PKG_SRCDIR/* $TERMUX_PREFIX/share/fritzing/parts
}
