set(SOURCES InitializeDll.cpp InitializeDll.h)

add_library(OGLCompiler STATIC ${SOURCES})
set_property(TARGET OGLCompiler PROPERTY FOLDER glslang)

if(WIN32)
    source_group("Source" FILES ${SOURCES})
endif(WIN32)

ADD_CUSTOM_COMMAND(TARGET OGLCompiler POST_BUILD COMMAND
                   ${CMAKE_COMMAND} -E copy $<TARGET_FILE:OGLCompiler> ${NFEDEPS_OUTPUT_DIRECTORY}/${targetfile})
