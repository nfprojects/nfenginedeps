# @file   CMakeLists.txt
# @author LKostyra (costyrra.xl@gmail.com)
# @brief  CMake for jpeg

FILE(GLOB_RECURSE JPEG_SOURCES *.cpp)
FILE(GLOB_RECURSE JPEG_HEADERS *.h)

ADD_LIBRARY(jpeg ${JPEG_SOURCES} ${JPEG_HEADERS})
SET_TARGET_PROPERTIES (jpeg PROPERTIES LINKER_LANGUAGE CXX)
