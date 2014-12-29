# @file   CMakeLists.txt
# @author LKostyra (costyrra.xl@gmail.com)
# @brief  CMakeLists for AntTweakBar

# it is assumed that this CMakeLists.txt is used as a part of nfEngineDeps
# if AntTweakBar was needed to be built separately, some extra lines are needed

# set library output file
SET(ANTTWEAKBAR_LIBRARY ${CMAKE_CURRENT_SOURCE_DIR}/lib/libAntTweakBar.so)

# delegate our build to already existing Makefile
ADD_CUSTOM_TARGET(build_AntTweakBar ALL
                  COMMAND ${CMAKE_MAKE_PROGRAM}
                  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/src
                  COMMENT "Building AntTweakBar from original Makefile")

# add library, which will be imported from our custom target
ADD_LIBRARY(AntTweakBar STATIC IMPORTED)
SET_PROPERTY(TARGET AntTweakBar APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
SET_TARGET_PROPERTIES(AntTweakBar PROPERTIES
                      IMPORTED_LOCATION_NOCONFIG "${ANTTWEAKBAR_LIBRARY}")

# add dependency - this will trigger build and later allow us to refer to Ant
# as it was built with CMake
ADD_DEPENDENCIES(AntTweakBar build_AntTweakBar)

ADD_CUSTOM_COMMAND(TARGET build_AntTweakBar POST_BUILD COMMAND
                   ${CMAKE_COMMAND} -E copy ${ANTTWEAKBAR_LIBRARY} ${NFEDEPS_OUTPUT_DIRECTORY}/)

# AntTweakBar needs "lib" directory to properly compile output files
FILE(MAKE_DIRECTORY lib)
