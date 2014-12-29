#!/bin/bash

CPU_COUNT=`grep -c ^processor /proc/cpuinfo`
echo "Available CPU cores: ${CPU_COUNT}"
echo

./clean-all.sh
echo

# Build Debug
echo "Building nfEngineDeps in Debug mode"
cmake . -DCMAKE_BUILD_TYPE=Debug
make -j ${CPU_COUNT}
echo

# Clean cmake for Release build
echo "Cleaning CMake files"
./clean-cmake.sh
echo

# Build Release
echo "Building nfEngineDeps in Release mode"
cmake . -DCMAKE_BUILD_TYPE=Release
make -j ${CPU_COUNT}
