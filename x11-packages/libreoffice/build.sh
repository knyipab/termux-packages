TERMUX_PKG_HOMEPAGE=https://www.libreoffice.org/
TERMUX_PKG_DESCRIPTION="LXTask is a GUI application for the Lightweight X11 Desktop Environment (LXDE)"
TERMUX_PKG_LICENSE="MPL-2.0, LGPL-3.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=24.2.3
_LIBREOFFICE_VERSION=24.2.3.2
TERMUX_PKG_SRCURL=https://download.documentfoundation.org/libreoffice/src/$TERMUX_PKG_VERSION/libreoffice-$_LIBREOFFICE_VERSION.tar.xz
TERMUX_PKG_SHA256=f6e2059cd85d07793e8d95828b2412906bdba8bf61a5f76b8c51907898481e64
# Ref: https://gitlab.archlinux.org/archlinux/packaging/packages/libreoffice-fresh/-/blob/main/PKGBUILD?ref_type=heads
# TODO: matches Archlinux deps:
# TERMUX_PKG_DEPENDS="curl, hunspell, python, libwpd, libwps, neon, pango, nspr, libjpeg, libxrandr, libgl, redland, hyphen, lpsolve, gcc-libs, sh, graphite, icu, libxslt, lcms2, poppler, libvisio, libetonyek, libodfgen, libcdr, libmspub, harfbuzz-icu, nss, clucene, hicolor-icon-theme, desktop-file-utils, shared-mime-info, libpagemaker, libxinerama, libabw, libmwaw, libe-book, libcups, liblangtag, libexttextcat, liborcus, libwebp, libcmis, libtommath, libzmf, libatomic_ops, xmlsec, libnumbertext, gpgme, libfreehand, libstaroffice, libepubgen, libqxp, libepoxy, box2d, zxing-cpp, xdg-utils, libldap, fontconfig, zlib, libpng, freetype2, raptor, libxml2, cairo, libx11, expat, glib2, boost-libs, libtiff, dbus, glibc, librevenge, libxext, openjpeg2"
# TODO: to be added="libwpd, libwps, neon, nspr, libgl, redland, lpsolve, gcc-libs, sh, lcms2, libvisio, libetonyek, libodfgen, libcdr, libmspub, nss, clucene, libpagemaker, libabw, libmwaw, libe-book, liblangtag, libexttextcat, liborcus, libcmis, libzmf, libnumbertext, libfreehand, libstaroffice, libepubgen, libqxp, box2d, libldap, expat, glib2, dbus, glibc, librevenge"

# TERMUX_PKG_DEPENDS="hunspell, python, pango, libjpeg-turbo, libxrandr, libhyphen, libgraphite, libicu, libxslt, poppler, harfbuzz-icu, hicolor-icon-theme, desktop-file-utils, shared-mime-info, libxinerama, cups, libwebp, libtommath, libatomic-ops, xmlsec, gpgme, libepoxy, libzxing-cpp, xdg-utils, fontconfig, zlib, libpng, freetype, libraptor2, libxml2, libcairo, libx11, boost, libtiff, libxext, openjpeg"
# TERMUX_PKG_BUILD_DEPENDS="openjdk-17, gtk4, gtk3, qt5-qtbase, qt6-qtbase"
TERMUX_PKG_DEPENDS="cups, openjdk-17, python"
TERMUX_PKG_BUILD_IN_SRC=true
# TERMUX_PKG_EXTRA_CONFIGURE_ARGS="--without-java"
# TERMUX_PKG_EXTRA_CONFIGURE_ARGS="\
# --with-jdk-home=/usr/lib/jvm/java-17-openjdk-amd64 \
# --enable-dbus \
# --enable-gtk3 \
# --enable-gtk4 \
# --enable-qt5 \
# --enable-qt6 \
# --enable-python=system \
# --without-fonts \
# --with-system-libxml \
# --without-myspell-dicts \
# --without-system-firebird \
# --with-system-zxing \
# --with-system-dicts \
# --with-external-dict-dir=$TERMUX_PREFIX/share/hunspell \
# --with-external-hyph-dir=$TERMUX_PREFIX/share/hyphen \
# --with-system-graphite \
# --with-system-boost \
# --with-system-icu \
# --with-system-cairo \
# --with-system-libs \
# --with-system-headers \
# "
# TERMUX_PKG_EXTRA_CONFIGURE_ARGS="--with-jdk-home=/usr/lib/jvm/java-17-openjdk-amd64 --enable-gtk3"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="--with-jdk-home=/usr/lib/jvm/java-17-openjdk-amd64"

termux_step_pre_configure() {
	$TERMUX_PKG_BUILDER_DIR/setup-jdk.sh
	sed -i -e 's/linux-gnu\*|k\*bsd\*-gnu\*|linux-musl\*)/linux-*|k*bsd*-gnu*)/' configure.ac
	sed -i -e 's/linux-gnu\*|k\*bsd\*-gnu\*|linux-musl\*)/linux-*|k*bsd*-gnu*)/' configure
}
