# MIT License Copyright (c) 2024-2025 Tomáš Mark

# !!! -lstdc++ mus not be used in the final link command
# build/standalone/default/debug/CMakeFiles/index2.dir/link.txt

# ==============================================================================
# Static Runtime Configuration (SIMPLIFIED)
# ==============================================================================

# Define option with default value (safe to call multiple times)
if(NOT DEFINED USE_STATIC_RUNTIME)
    option(USE_STATIC_RUNTIME "Link against static runtime libraries" OFF)
endif()

# ==============================================================================
# Apply static runtime to target (does everything needed)
# ==============================================================================
function(apply_static_runtime TARGET_NAME)
    if(USE_STATIC_RUNTIME)
        message(STATUS "Applying static runtime to: ${TARGET_NAME}")

        if(MSVC)
            # MSVC runtime library property
            set_property(TARGET ${TARGET_NAME} PROPERTY MSVC_RUNTIME_LIBRARY
                                                        "MultiThreaded$<$<CONFIG:Debug>:Debug>")
        else()
            if(WIN32)
                # MinGW - full static linking
                target_link_options(${TARGET_NAME} PRIVATE -static)
            else()
                # Linux/macOS - static C++ runtime only
                target_link_options(${TARGET_NAME} PRIVATE -static-libgcc -static-libstdc++
                                    -Wl,--as-needed)
            endif()
        endif()

        # For executables, prefer static libraries
        get_target_property(TARGET_TYPE ${TARGET_NAME} TYPE)
        if(TARGET_TYPE STREQUAL "EXECUTABLE")
            set_target_properties(${TARGET_NAME} PROPERTIES LINK_SEARCH_START_STATIC ON
                                                            LINK_SEARCH_END_STATIC ON)
        endif()
    endif()
endfunction()
