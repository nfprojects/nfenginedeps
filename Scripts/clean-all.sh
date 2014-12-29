#!/bin/bash

echo "Cleaning entire nfEngineDeps directory"
./clean-cmake.sh

echo "Removing compiled libraries"
rm -rf Bin

echo "Removing AntTweakBar compilation results"
pushd . > /dev/null
cd AntTweakBar

find . -name libAntTweakBar\* | xargs rm
find . -name \*.o | xargs rm

popd > /dev/null
