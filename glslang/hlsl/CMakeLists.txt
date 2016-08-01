set(SOURCES
    hlslParseHelper.cpp
    hlslScanContext.cpp
    hlslOpMap.cpp
    hlslTokenStream.cpp
    hlslGrammar.cpp
    hlslParseables.cpp)

set(HEADERS
    hlslParseHelper.h
    hlslTokens.h
    hlslScanContext.h
    hlslOpMap.h
    hlslTokenStream.h
    hlslGrammar.h
    hlslParseables.h)

add_library(hlsl STATIC ${SOURCES} ${HEADERS})
set_property(TARGET hlsl PROPERTY FOLDER hlsl)

if(WIN32)
    source_group("Source" FILES ${SOURCES} ${HEADERS})
endif(WIN32)

ADD_CUSTOM_COMMAND(TARGET hlsl POST_BUILD COMMAND
                   ${CMAKE_COMMAND} -E copy $<TARGET_FILE:hlsl> ${NFEDEPS_OUTPUT_DIRECTORY}/${targetfile})
