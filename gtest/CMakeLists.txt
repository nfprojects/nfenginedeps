# @file   CMakeLists.txt
# @author LKostyra (costyrra.xl@gmail.com)
# @brief  CMake for gtest

FILE(GLOB_RECURSE GTEST_SOURCES *.cc)
FILE(GLOB_RECURSE GTEST_HEADERS *.h)

INCLUDE_DIRECTORIES(include .)

ADD_LIBRARY(gtest ${GTEST_SOURCES} ${GTEST_HEADERS})
ADD_CUSTOM_COMMAND(TARGET gtest POST_BUILD COMMAND
                   ${CMAKE_COMMAND} -E copy $<TARGET_FILE:gtest> ${NFEDEPS_OUTPUT_DIRECTORY}/${targetfile})
