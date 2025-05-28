TERMUX_PKG_HOMEPAGE=https://liblas.org/
TERMUX_PKG_DESCRIPTION="Library for reading and writing LAS LiDAR format"
TERMUX_PKG_LICENSE=BSD-3-Clause
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=1.8.1
TERMUX_PKG_SRCURL=https://download.osgeo.org/liblas/libLAS-${TERMUX_PKG_VERSION}.tar.bz2
TERMUX_PKG_SHA256=0b8f44a086220a3356f094a0909542875e965990eff2d74dd809724d70508361
TERMUX_PKG_DEPENDS="boost, gdal, libgeotiff, laszip, zlib"
TERMUX_PKG_BUILD_DEPENDS="cmake, ninja"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DCMAKE_BUILD_TYPE=Release
-DBUILD_SHARED_LIBS=ON
-DWITH_GDAL=ON
-DWITH_GEOTIFF=ON
-DWITH_LASZIP=ON
-DWITH_TESTS=OFF
"

# The default termux_step_configure, termux_step_make, and termux_step_make_install
# are expected to work for a standard CMake project.
# No need to override them.
