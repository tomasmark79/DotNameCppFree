# MIT License Copyright (c) 2024-2025 Tomáš Mark

# SERVER SIDE DEPENDENCIS Apache directives example for CORS <IfModule mod_headers.c> Header set
# Cross-Origin-Opener-Policy "same-origin" Header set Cross-Origin-Embedder-Policy "require-corp"
# </IfModule>

function(emscripten target isHtml reqPthreads customPrePath)
    if(CMAKE_SYSTEM_NAME STREQUAL "Emscripten")
        message(STATUS "Emscripten environment detected")

        # define PLATFORM_WEB
        target_compile_definitions(${target} PRIVATE PLATFORM_WEB)

        set_target_properties(${target} PROPERTIES OUTPUT_NAME "${target}")

        if(isHtml EQUAL 1)
            message(STATUS "html target requested")
            set_target_properties(${target} PROPERTIES SUFFIX ".html")
        endif()

        # available switches - updated for newer Emscripten versions
        set(_wasm "-sWASM=1")
        set(_o3 "-O3")
        set(_raylib "-sUSE_GLFW=3")
        set(_sdl2_sdl2 "-sUSE_SDL=2")
        set(_sdl2_image "-sUSE_SDL_IMAGE=2")
        set(_sdl2_ttf "-sUSE_SDL_TTF=2")
        # SDL_NET has been deprecated in newer Emscripten versions, removing it
        # set(_sdl2_net "-sUSE_SDL_NET=2")  
        set(_sdl2_mixer "-sUSE_SDL_MIXER=2")

        # not used yet
        # set(_gl_egpaddress "-s GL_ENABLE_GET_PROC_ADDRESS=1")
        # set(_assertions "-s ASSERTIONS=1")
        # set(_asyncify "-s ASYNCIFY")
        # set(_memory_growth "-s ALLOW_MEMORY_GROWTH=1")

        if(reqPthreads EQUAL 1)
            set(_pthread "-sUSE_PTHREADS=1 -pthread")
            set(_pthread_pool_size "-sPTHREAD_POOL_SIZE=4")
        else()
            set(_pthread "")
            set(_pthread_pool_size "")
        endif()

        # default assets direction is share/${target}/assets
        if(NOT DEFINED customPrePath OR customPrePath STREQUAL "")
            set(customPrePath "--preload-file ../../../../assets@share/${target}/assets")
        endif()

        # custom assets path
        if(target MATCHES "LibTester")
            set(customHtmlPath
                "--shell-file ${CMAKE_CURRENT_SOURCE_DIR}/../../assets/ems-mini.html")
        else()
            set(customHtmlPath
                "--shell-file ${CMAKE_CURRENT_SOURCE_DIR}/../assets/ems-mini.html")
        endif()

        # manually set flags is the best way
        set_target_properties(
            ${target}
            PROPERTIES
                COMPILE_FLAGS
                "${_o3} ${_pthread} ${_sdl2_sdl2} ${_sdl2_image} ${_sdl2_ttf} ${_sdl2_mixer} "
        )
        set_target_properties(
            ${target}
            PROPERTIES
                LINK_FLAGS
                "${_wasm} ${_pthread} ${_pthread_pool_size} ${_sdl2_sdl2} ${_sdl2_image} ${_sdl2_ttf} ${_sdl2_mixer} ${customPrePath} ${customHtmlPath}"
        )

    endif()

    # Checks if OSX and links appropriate frameworks (Only required on MacOS)
    if(APPLE)
        target_link_libraries(${target} PRIVATE "-framework IOKit")
        target_link_libraries(${target} PRIVATE "-framework Cocoa")
        target_link_libraries(${target} PRIVATE "-framework OpenGL")
    endif()

endfunction()
