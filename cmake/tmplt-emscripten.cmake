
# MIT License Copyright (c) 2024-2025 Tomáš Mark

function(emscripten target)
    # ==============================================================================
    # Set target properties
    # ==============================================================================
    if(CMAKE_SYSTEM_NAME STREQUAL "Emscripten")
        message(STATUS "Emscripten detected")
        set(raylib_VERBOSE 1)
        set_target_properties(${target} PROPERTIES SUFFIX ".html")
        set_target_properties(
            ${target}
            PROPERTIES
                COMPILE_FLAGS
                "-s USE_GLFW=3 -s ASSERTIONS=1 -s WASM=1 -s ASYNCIFY -s GL_ENABLE_GET_PROC_ADDRESS=1"
        )

        set_target_properties(
            ${target}
            PROPERTIES
                LINK_FLAGS
                "-s USE_GLFW=3 -s ASSERTIONS=1 -s WASM=1 -s ASYNCIFY -s GL_ENABLE_GET_PROC_ADDRESS=1"
        )

        if(ENABLE_EMSCRIPTEN_PTHREAD)
        message(STATUS "Emscripten pthread enabled")
        set(raylib_VERBOSE 1)
        set_target_properties(${target} PROPERTIES COMPILE_FLAGS "-s USE_PTHREADS=1 -pthread")
        set_target_properties(${target} PROPERTIES LINK_FLAGS "-s USE_PTHREADS=1 -pthread")
        endif()
    endif()

    # Checks if OSX and links appropriate frameworks (Only required on MacOS)
    if(APPLE)
        target_link_libraries(${PROJECT_NAME} "-framework IOKit")
        target_link_libraries(${PROJECT_NAME} "-framework Cocoa")
        target_link_libraries(${PROJECT_NAME} "-framework OpenGL")
    endif()

endfunction()
