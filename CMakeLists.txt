# @file   CMakeLists.txt
# @author LKostyra (costyrra.xl@gmail.com)
# @brief  Main CMake file for nfEngine Deps

CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

PROJECT(nfEngineDeps)

# Pre-define Release build
IF(NOT DEFINED CMAKE_BUILD_TYPE)
    SET(CMAKE_BUILD_TYPE Release)
ENDIF(NOT DEFINED CMAKE_BUILD_TYPE)

# Get platform name from uname if it is not defined
EXECUTE_PROCESS(COMMAND uname -m
                OUTPUT_VARIABLE BUILD_PLATFORM OUTPUT_STRIP_TRAILING_WHITESPACE)

# Set required variables
SET(CMAKE_CXX_FLAGS       "${CMAKE_CXX_FLAGS} -O2 -std=c++0x")
SET(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -O0 -g -std=c++0x")

# enable Position Independent Code
ADD_DEFINITIONS("-fPIC")

# If any macros specific to project are needed, prefix them with NFEDEPS_
SET(NFEDEPS_ROOT_DIRECTORY ${CMAKE_SOURCE_DIR})
SET(NFEDEPS_OUTPUT_DIRECTORY
    ${NFEDEPS_ROOT_DIRECTORY}/Bin/${BUILD_PLATFORM}/${CMAKE_BUILD_TYPE})

# Building outputs
SET(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${NFEDEPS_OUTPUT_DIRECTORY})
SET(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${NFEDEPS_OUTPUT_DIRECTORY})

MESSAGE("Creating Makefile for nfEngine Deps")

MESSAGE("Output path is ${NFEDEPS_OUTPUT_DIRECTORY}")
MESSAGE("Build type is ${CMAKE_BUILD_TYPE}")
MESSAGE("Platform is ${BUILD_PLATFORM}")

# Add all projects
ADD_SUBDIRECTORY("bullet")
#ADD_SUBDIRECTORY("FreeType") # TODO FINISH
ADD_SUBDIRECTORY("gtest")
ADD_SUBDIRECTORY("jpeg")
ADD_SUBDIRECTORY("libpng")
ADD_SUBDIRECTORY("model_obj")
ADD_SUBDIRECTORY("squish")
ADD_SUBDIRECTORY("zlib")

FILE(MAKE_DIRECTORY ${NFEDEPS_OUTPUT_DIRECTORY})
