# @file   CMakeLists.txt
# @author mkkulagowski (mk.kulagowski(at)gmail.com)
# @brief  CMakeLists for libsquish

FILE(GLOB SQUISH_SOURCES src/*.cpp)
FILE(GLOB SQUISH_HEADERS src/*.h)

INCLUDE_DIRECTORIES(src)

ADD_LIBRARY(squish ${SQUISH_SOURCES} ${SQUISH_HEADERS})

SET_TARGET_PROPERTIES(squish PROPERTIES COMPILE_FLAGS -DSQUISH_USE_SSE=2
                                        COMPILE_FLAGS -msse)

ADD_CUSTOM_COMMAND(TARGET squish POST_BUILD COMMAND
                   ${CMAKE_COMMAND} -E copy $<TARGET_FILE:squish> ${NFEDEPS_OUTPUT_DIRECTORY}/${targetfile})