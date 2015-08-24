#!/bin/bash

CPU_COUNT=`grep -c ^processor /proc/cpuinfo`
echo "Available CPU cores: ${CPU_COUNT}"
echo

pushd . > /dev/null
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd ${DIR}/..
echo -n "Current directory is "; pwd

Scripts/clean.sh
echo

# Clean cmake
echo "Cleaning CMake files"
Scripts/clean-cmake.sh
echo

PLATFORM=$( uname -m )

# Build Debug
echo "Building nfEngineDeps: Type Debug, Platform ${PLATFORM}"
cmake . -DCMAKE_BUILD_TYPE=Debug
make -j ${CPU_COUNT}
echo

# Clean cmake
echo "Cleaning CMake files"
Scripts/clean-cmake.sh
echo

# Build Release
echo "Building nfEngineDeps: Type Release, Platform ${PLATFORM}"
cmake . -DCMAKE_BUILD_TYPE=Release
make -j ${CPU_COUNT}
echo

popd > /dev/null
