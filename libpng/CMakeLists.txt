# @file   CMakeLists.txt
# @author LKostyra (costyrra.xl@gmail.com)
# @brief  CMake for libpng

FILE(GLOB_RECURSE PNG_SOURCES *.c)
FILE(GLOB_RECURSE PNG_HEADERS *.h)

ADD_LIBRARY(png ${PNG_SOURCES} ${PNG_HEADERS})
ADD_CUSTOM_COMMAND (TARGET png POST_BUILD COMMAND
                    ${CMAKE_COMMAND} -E copy $<TARGET_FILE:png> ${NFEDEPS_OUTPUT_DIRECTORY}/${targetfile})
