add_library(OSDependent STATIC ossource.cpp ../osinclude.h)
set_property(TARGET OSDependent PROPERTY FOLDER glslang)

ADD_CUSTOM_COMMAND(TARGET OSDependent POST_BUILD COMMAND
                   ${CMAKE_COMMAND} -E copy $<TARGET_FILE:OSDependent> ${NFEDEPS_OUTPUT_DIRECTORY}/${targetfile})
