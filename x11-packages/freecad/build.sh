TERMUX_PKG_HOMEPAGE=https://www.freecadweb.org/
TERMUX_PKG_DESCRIPTION="Feature based parametric 3D CAD modeler"
TERMUX_PKG_LICENSE=LGPL-2.1-or-later
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=1.0.1
TERMUX_PKG_SRCURL=https://github.com/FreeCAD/FreeCAD/archive/${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=f4459bf5607744c49c47abc475b6f0a636970f4160799f7a515e523190739d51
TERMUX_PKG_DEPENDS="boost, coin, fmt, glew, libmed, opencascade, pugixml, pyside6, python-markdown, python-matplotlib, python-pivy, python-ply, python-yaml, qt6-svg, verdict, xerces-c, utf8cpp, microsoft-gsl, fast_float, cgns, liblas, openvdb, python"
TERMUX_PKG_BUILD_DEPENDS="cmake, eigen, git, libharu, ninja, nlohmann-json, swig, dos2unix, pkg-config, python"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_post_extract_package() {
	# Release tarballs should contain submodules. If using a git checkout,
	# or if problems arise, uncomment the following:
	# git submodule update --init --recursive
	return
}

TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DCMAKE_BUILD_TYPE=Release
-DBUILD_SHARED_LIBS=ON
-DPYTHON_EXECUTABLE=${TERMUX_PREFIX}/bin/python
-DPYTHON_SITELIB=${TERMUX_PREFIX}/lib/python\$(termux_python_get_major_minor)/site-packages
-DBUILD_ENABLE_CXX_STD=C++17
-DBUILD_FLAT_MESH=ON
-DBUILD_GUI=ON
-DFREECAD_USE_GUI=ON
-DFREECAD_USE_EXTERNAL_PIVY=ON
-DFREECAD_USE_OCC_VARIANT=\"Official Version\"
-DFREECAD_QT_VERSION=6
-DBUILD_DESIGNER_PLUGIN=ON
-DFREECAD_USE_QT_FILEDIALOG=ON
-DINSTALL_TO_SITEPACKAGES=ON
-DCMAKE_INSTALL_PREFIX=${TERMUX_PREFIX}
-DCMAKE_INSTALL_BINDIR=bin
-DCMAKE_INSTALL_DATADIR=share/freecad
-DCMAKE_INSTALL_DOCDIR=share/doc/freecad
-DCMAKE_INSTALL_LIBDIR=lib/freecad
-DFREECAD_USE_OPENVR=OFF
-DFREECAD_USE_LIBSHAPERT=OFF
-DFREECAD_USE_SPNAV=OFF
-DBUILD_FEM_NETGEN=OFF
-DBUILD_CLOUD=OFF
-DBUILD_PLOT=OFF
-DBUILD_ROBOT=OFF
-DBUILD_WEB=OFF
-DFREECAD_USE_SYSTEM_SMESH=OFF
-DFREECAD_ENABLE_MED3_TESTS=OFF
-DFREECAD_ENABLE_OCC_TESTS=OFF
"

# The default termux_step_configure, termux_step_make, and termux_step_make_install
# are expected to work for a standard CMake project.
# No need to override them unless specific issues arise during testing.
