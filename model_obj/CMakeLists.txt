# @file   CMakeLists.txt
# @author LKostyra (costyrra.xl@gmail.com)
# @brief  CMake for model_obj

FILE(GLOB_RECURSE MODEL_OBJ_SOURCES *.cpp)
FILE(GLOB_RECURSE MODEL_OBJ_HEADERS *.h)

ADD_LIBRARY(model_obj ${MODEL_OBJ_SOURCES} ${MODEL_OBJ_HEADERS})
SET_TARGET_PROPERTIES(model_obj PROPERTIES LINKER_LANGUAGE CXX)
ADD_CUSTOM_COMMAND(TARGET model_obj POST_BUILD COMMAND
                   ${CMAKE_COMMAND} -E copy $<TARGET_FILE:model_obj> ${NFEDEPS_OUTPUT_DIRECTORY}/${targetfile})
