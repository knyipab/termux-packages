TERMUX_PKG_HOMEPAGE=https://www.opencascade.com/
TERMUX_PKG_DESCRIPTION="Opencascade Technology (OCCT), 3D modeling and numerical simulation C++ library"
TERMUX_PKG_LICENSE="custom:OCCT-LGPL-exception-1.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=7.7.2
# Source URL uses version with underscores, e.g., V7_7_2
TERMUX_PKG_SRCURL=https://github.com/Open-Cascade-SAS/OCCT/archive/refs/tags/V${TERMUX_PKG_VERSION//./_}.tar.gz
TERMUX_PKG_SHA256=9557f35a88587905aa7f9401f7321a0e695115391049f84678c50300ab89004b
TERMUX_PKG_DEPENDS="freeimage, freetype, rapidjson, tbb, vtk"
TERMUX_PKG_BUILD_DEPENDS="cmake, ninja, python, doxygen, ffmpeg"
TERMUX_PKG_BUILD_IN_SRC=true

# Note: The archive extracts to a directory like OCCT-V7_7_2.
# If the build system does not automatically find the CMakeLists.txt,
# TERMUX_PKG_SRCDIR might need to be set to "OCCT-V${TERMUX_PKG_VERSION//./_}"
# or termux_step_pre_configure() might need:
# cd OCCT-V${TERMUX_PKG_VERSION//./_}

TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DCMAKE_BUILD_TYPE=Release
-DBUILD_SHARED_LIBS=ON
-DBUILD_MODULE_ApplicationFramework=ON
-DBUILD_MODULE_DataExchange=ON
-DBUILD_MODULE_Draw=ON
-DBUILD_MODULE_FoundationClasses=ON
-DBUILD_MODULE_ModelingAlgorithms=ON
-DBUILD_MODULE_ModelingData=ON
-DBUILD_MODULE_OcctOverview=OFF
-DBUILD_MODULE_PerformanceHarness=OFF
-DBUILD_MODULE_Samples=OFF
-DBUILD_MODULE_ShapeHealing=ON
-DBUILD_MODULE_Visualization=ON
-DBUILD_MODULE_XDEComponents=ON
-D3RDPARTY_DOXYGEN_EXECUTABLE=$TERMUX_PREFIX/bin/doxygen
-DINSTALL_DIR_INCLUDE=include/opencascade
-DINSTALL_DIR_RESOURCE=share/opencascade/resource
-DINSTALL_DIR_DATA=share/opencascade/data
-DINSTALL_SAMPLES=OFF
-DINSTALL_DOC=OFF
-DUSE_FREEIMAGE=ON
-DUSE_FREETYPE=ON
-DUSE_RAPIDJSON=ON
-DUSE_TBB=ON
-DUSE_VTK=ON
-DUSE_OPENGL_ES=ON
-DOCCT_WITH_VTK_DYNLINK=ON
-DBUILD_DRAW_EXE=OFF
"

# The default termux_step_configure, termux_step_make, and termux_step_make_install
# are expected to work for a standard CMake project.
# No need to override them unless specific issues arise during testing.
