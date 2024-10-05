TERMUX_PKG_HOMEPAGE=https://www.kde.org/
TERMUX_PKG_DESCRIPTION="Advanced configuration system (KDE)"
TERMUX_PKG_LICENSE="LGPL-2.1"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="6.6.0"
TERMUX_PKG_REVISION=2
TERMUX_PKG_SRCURL="https://download.kde.org/stable/frameworks/${TERMUX_PKG_VERSION%.*}/kconfig-${TERMUX_PKG_VERSION}.tar.xz"
TERMUX_PKG_SHA256=070bd019b07e15201e4c7072b71337c75f6917407406a1a7107fca1bff2855fe
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="libc++, qt6-qtbase, qt6-qtdeclarative"
TERMUX_PKG_BUILD_DEPENDS="extra-cmake-modules, qt6-qttools"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DCMAKE_SYSTEM_NAME=Linux
-DKDE_INSTALL_QMLDIR=lib/qt6/qml
"

# provide kconfig_compiler_kf6 for the cross-compiling host
termux_step_post_make_install() {
	# patch files
	cat >$TERMUX_PKG_SRCDIR/CMakeLists.txt <<-EOF
	cmake_minimum_required(VERSION 3.16)

	find_package(Qt6 REQUIRED COMPONENTS Core Widgets Xml)

	function(ecm_mark_nongui_executable)
	endfunction()

	add_subdirectory(src/kconfig_compiler)

	EOF
	sed -e 's|#include "../core/kconfig_version.h"|#include "KF6/KConfig/kconfig_version.h"|' -i $TERMUX_PKG_SRCDIR/src/kconfig_compiler/kconfig_compiler.cpp

	# build
	termux_setup_cmake
	termux_setup_ninja
	(
		unset AS CC CPP CXX LD AR CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
		cmake \
			-G Ninja \
			-S ${TERMUX_PKG_SRCDIR} \
			-DCMAKE_BUILD_TYPE=MinSizeRel \
			-DCMAKE_FIND_ROOT_PATH=/:$TERMUX_PREFIX \
			-DCMAKE_PREFIX_PATH=$TERMUX_PREFIX/opt/qt6/cross/lib/cmake \
			-DCMAKE_INSTALL_PREFIX=$TERMUX_PREFIX/opt/kf6/cross \
			-DKDE_INSTALL_LIBEXECDIR_KF=lib/libexec/kf6
		ninja \
			-j ${TERMUX_PKG_MAKE_PROCESSES} \
			install
	)
	mkdir -p $TERMUX_PREFIX/opt/kf6/cross/lib/cmake
	cp -r $TERMUX_PREFIX/lib/cmake/KF6Config $TERMUX_PREFIX/opt/kf6/cross/lib/cmake
	sed -e 's|_IMPORT_PREFIX "'$TERMUX_PREFIX'"|_IMPORT_PREFIX "'$TERMUX_PREFIX'/opt/kf6/cross"|' -i $TERMUX_PREFIX/opt/kf6/cross/lib/cmake/KF6Config/KF6ConfigCompilerTargets.cmake
	sed -e 's|'$TERMUX_PREFIX'/lib/libexec/kf6/kconfig_compiler_kf6|'$TERMUX_PREFIX'/opt/kf6/cross/lib/libexec/kf6/kconfig_compiler_kf6|' -i $TERMUX_PREFIX/opt/kf6/cross/lib/cmake/KF6Config/KF6ConfigCompilerTargets-release.cmake
}
