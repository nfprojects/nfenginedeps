# @file   CMakeLists.txt
# @author LKostyra (costyrra.xl@gmail.com)
# @brief  CMake for zlib

FILE(GLOB_RECURSE ZLIB_SOURCES *.c)
FILE(GLOB_RECURSE ZLIB_HEADERS *.h)

ADD_LIBRARY(zlib ${ZLIB_SOURCES} ${ZLIB_HEADERS})
ADD_CUSTOM_COMMAND (TARGET zlib POST_BUILD COMMAND
                    ${CMAKE_COMMAND} -E copy $<TARGET_FILE:zlib> ${NFEDEPS_OUTPUT_DIRECTORY}/${targetfile})
