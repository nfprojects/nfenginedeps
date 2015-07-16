#!/bin/bash

pushd . > /dev/null
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd ${DIR}/..
echo -n "Current directory is "; pwd

echo "Cleaning entire nfEngineDeps directory"
Scripts/clean-cmake.sh

echo "Removing compiled libraries"
rm -rf Bin
find . -name \*.a | xargs rm -f
find . -name \*.so | xargs rm -f

# Remove all makefiles, except for AntTweakBar's Makefile
find . -name Makefile | grep -Ev './AntTweakBar/src/Makefile|./FreeType/tools/ftrandom/Makefile|./squish/src/Makefile' | xargs rm -f

echo "Removing AntTweakBar compilation results"
pushd . > /dev/null
cd AntTweakBar

find . -name libAntTweakBar\* | xargs rm -f
find . -name \*.o | xargs rm -f

popd > /dev/null

popd > /dev/null
