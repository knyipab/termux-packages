TERMUX_PKG_HOMEPAGE='https://www.librecad.org/'
TERMUX_PKG_DESCRIPTION='A 2D CAD drawing tool based on the community edition of QCad'
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=2.2.0.2
TERMUX_PKG_SRCURL="https://github.com/LibreCAD/LibreCAD/archive/${TERMUX_PKG_VERSION}.tar.gz"
TERMUX_PKG_SHA256=fcb888a550f1f515ef6a2f7af2dd02605dd5c6da8a23f6c3a52479f8532ac109
TERMUX_PKG_DEPENDS="libmuparser, libxcb, qt5-qtbase, qt5-qtsvg"
TERMUX_PKG_BUILD_DEPENDS="boost, imagemagick, librsvg, qt5-qtbase-cross-tools, qt5-qttools-cross-tools"
TERMUX_PKG_AUTO_UPDATE=true

termux_step_configure() {
	"${TERMUX_PREFIX}/opt/qt/cross/bin/qmake" \
		-spec "${TERMUX_PREFIX}/lib/qt/mkspecs/termux-cross" \
		${TERMUX_PKG_EXTRA_CONFIGURE_ARGS} $TERMUX_PKG_SRCDIR
}

termux_step_make_install() {
	install -Dm755 -t $TERMUX_PREFIX/bin unix/librecad unix/librecad
	install -Dm644 -t $TERMUX_PREFIX/share/applications $TERMUX_PKG_SRCDIR/desktop/librecad.desktop
	install -Dm644 -t $TERMUX_PREFIX/share/pixmaps $TERMUX_PKG_SRCDIR/librecad/res/main/librecad.png
	install -Dm644 $TERMUX_PKG_SRCDIR/desktop/librecad.sharedmimeinfo $TERMUX_PREFIX/share/mime/packages/librecad.xml
	install -Dm644 "$TERMUX_PKG_SRCDIR/desktop/graphics_icons_and_splash/Icon LibreCAD/Icon_Librecad.svg" $TERMUX_PREFIX/share/icons/hicolor/scalable/apps/librecad.svg
}
