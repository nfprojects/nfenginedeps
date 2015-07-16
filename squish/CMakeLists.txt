# @file   CMakeLists.txt
# @author mkkulagowski (mk.kulagowski(at)gmail.com)
# @brief  CMakeLists for libsquish

# set library output file
SET(SQUISH_LIBRARY ${CMAKE_CURRENT_SOURCE_DIR}/lib/squish.so)

# delegate our build to already existing Makefile
ADD_CUSTOM_TARGET(build_squish ALL
                  COMMAND ${CMAKE_MAKE_PROGRAM}
                  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/
                  COMMENT "Building libsquish from original Makefile")

# add library, which will be imported from our custom target
ADD_LIBRARY(squish STATIC IMPORTED)
SET_PROPERTY(TARGET squish APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
SET_TARGET_PROPERTIES(squish PROPERTIES
                      IMPORTED_LOCATION_NOCONFIG "${SQUISH_LIBRARY}")

# add dependency - this will trigger build and later allow us to refer to squish
# as it was built with CMake
ADD_DEPENDENCIES(squish build_squish)

ADD_CUSTOM_COMMAND(TARGET build_squish POST_BUILD COMMAND
                   ${CMAKE_COMMAND} -E copy ${SQUISH_LIBRARY} ${NFEDEPS_OUTPUT_DIRECTORY}/)
