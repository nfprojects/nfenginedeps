# @file   CMakeLists.txt
# @author LKostyra (costyrra.xl@gmail.com)
# @brief  CMake for jpeg

SET(JPEG_SOURCES jpgd.cpp jpge.cpp)
SET(JPEG_HEADERS jpgd.h jpge.h)

ADD_LIBRARY(jpeg ${JPEG_SOURCES} ${JPEG_HEADERS})
SET_TARGET_PROPERTIES (jpeg PROPERTIES LINKER_LANGUAGE CXX)
