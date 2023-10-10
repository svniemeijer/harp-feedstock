#!/bin/bash
set -e
set -x

mkdir build
cd build

cmake $CMAKE_ARGS \
  -DCMAKE_BUILD_TYPE="Release" \
  -DCMAKE_INSTALL_PREFIX="$PREFIX" \
  -DCMAKE_PREFIX_PATH="$PREFIX" \
  -DHARP_BUILD_PYTHON=True \
  -DHARP_BUILD_R=$HARP_BUILD_R \
  -DCODA_INCLUDE_DIR="$PREFIX/include" \
  -DCODA_LIBRARY_DIR="$PREFIX/lib" \
  -DJPEG_INCLUDE_DIR="$PREFIX/include" \
  -DJPEG_LIBRARY_DIR="${PREFIX}/lib" \
  -DJPEG_LIBRARY="${PREFIX}/lib/libjpeg${SHLIB_EXT}" \
  -DZLIB_INCLUDE_DIR="$PREFIX/include" \
  -DZLIB_LIBRARY="${PREFIX}/lib/libz${SHLIB_EXT}" \
  -DZLIB_LIBRARY_DIR="${PREFIX}/lib" \
  ..

make -j$CPU_COUNT
