TERMUX_PKG_HOMEPAGE=https://fritzing.org/
TERMUX_PKG_DESCRIPTION="An Electronic Design Automation software"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="@termux"
# Nowadays the release build seems to be hidden behind a paywall.
# Then we need to guess based on the github repo.
_COMMIT=a8c6ef7cf66f7a42b9b233d6137f1b70a9573a25
TERMUX_PKG_VERSION=1.0.4
TERMUX_PKG_SRCURL=git+https://github.com/fritzing/fritzing-app
TERMUX_PKG_GIT_BRANCH=develop
TERMUX_PKG_DEPENDS="fritzing-data, fritzing-parts, libc++, libgit2, qt6-qtbase, qt6-qtserialport, qt6-qtsvg"
TERMUX_PKG_BUILD_DEPENDS="boost, boost-headers, qt6-qttools"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
PREFIX=$TERMUX_PREFIX
PKG_CONFIG=pkg-config
BOOST_ROOT=$TERMUX_PREFIX
"

termux_step_post_get_source() {
	git fetch --unshallow
	git checkout $_COMMIT

	# Allow use of newer Qt versions
	git revert -n 1bf5a03f27b7401631baaedb1ceb9c313a5ffe3d
	git revert -n 20eeb4c2f95f3de669e90a1f3fa2ac49cdcc33ac

	# Dynamically link against system libgit2
	sed -i 's/LIBGIT_STATIC = true/LIBGIT_STATIC = false/' phoenix.pro
}

termux_step_configure() {
	"${TERMUX_PREFIX}/opt/qt6/cross/bin/qmake6" \
		${TERMUX_PKG_EXTRA_CONFIGURE_ARGS} "$TERMUX_PKG_SRCDIR"
}
