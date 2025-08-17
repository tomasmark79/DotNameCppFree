# MIT License Copyright (c) 2024-2025 Tomáš Mark

# ==============================================================================
# Common project settings and options
# ==============================================================================

# CMake policies
cmake_policy(SET CMP0048 NEW)
cmake_policy(SET CMP0076 NEW)
cmake_policy(SET CMP0091 NEW)

# Compiler diagnostics
if(CMAKE_CXX_COMPILER_ID MATCHES "Clang|GNU")
    add_compile_options(-fdiagnostics-color=always)
endif()

# ==============================================================================
# Common build options
# ==============================================================================
option(ENABLE_CCACHE "Use ccache compiler cache" ON)
option(BUILD_SHARED_LIBS "Build shared (.so) libraries" OFF)
option(USE_STATIC_RUNTIME "Link C++ runtime statically" OFF)
option(SANITIZE_ADDRESS "Enable address sanitizer" OFF)
option(SANITIZE_UNDEFINED "Enable undefined behavior sanitizer" OFF)
option(SANITIZE_THREAD "Enable thread sanitizer" OFF)
option(SANITIZE_MEMORY "Enable memory sanitizer" OFF)
option(ENABLE_HARDENING "Enable security hardening" OFF)
option(ENABLE_IPO "Enable link-time optimization" OFF)
option(ENABLE_GTESTS "Build and run unit tests" ON)

# ==============================================================================
# ccache setup
# ==============================================================================
if(ENABLE_CCACHE)
    find_program(CCACHE_PROGRAM ccache)
    if(CCACHE_PROGRAM)
        set(CMAKE_C_COMPILER_LAUNCHER ${CCACHE_PROGRAM})
        set(CMAKE_CXX_COMPILER_LAUNCHER ${CCACHE_PROGRAM})
    endif()
endif()

# ==============================================================================
# Common includes
# ==============================================================================
include(GNUInstallDirs)
include(${CMAKE_CURRENT_LIST_DIR}/tmplt-runtime.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/tmplt-sanitizer.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/tmplt-hardening.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/tmplt-ipo.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/tmplt-debug.cmake)

# ==============================================================================
# Build system configuration
# ==============================================================================
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# ==============================================================================
# Cross-compilation indicator (global)
# ==============================================================================
set(DOTNAME_CROSSCOMPILING OFF)
if(CMAKE_SYSTEM_NAME STREQUAL "Emscripten")
    set(DOTNAME_CROSSCOMPILING ON)
elseif(CMAKE_CROSSCOMPILING)
    set(DOTNAME_CROSSCOMPILING ON)
elseif(NOT CMAKE_HOST_SYSTEM_NAME STREQUAL CMAKE_SYSTEM_NAME)
    set(DOTNAME_CROSSCOMPILING ON)
endif()
set(DOTNAME_CROSSCOMPILING
    "${DOTNAME_CROSSCOMPILING}"
    CACHE BOOL "Building with cross-compilation")

# Provide preprocessor define
if(DOTNAME_CROSSCOMPILING)
    add_compile_definitions(DOTNAME_CROSSCOMPILING=1)
else()
    add_compile_definitions(DOTNAME_CROSSCOMPILING=0)
endif()

# ==============================================================================
# Common dependency management
# ==============================================================================
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/modules")
list(APPEND CMAKE_PREFIX_PATH ${CMAKE_BINARY_DIR})

# CPM.cmake setup
include(${CMAKE_CURRENT_LIST_DIR}/CPM.cmake)

# ==============================================================================
# Helper function for applying common target settings
# ==============================================================================
function(apply_common_target_settings TARGET_NAME)
    apply_ipo(${TARGET_NAME})
    apply_hardening(${TARGET_NAME})
    apply_sanitizers(${TARGET_NAME})
    apply_static_runtime(${TARGET_NAME})
    apply_debug_info_control(${TARGET_NAME})
endfunction()

# ==============================================================================
# Helper function for creating source file lists
# ==============================================================================
function(gather_sources OUTPUT_VAR SOURCE_DIR)
    file(
        GLOB_RECURSE
        sources
        CONFIGURE_DEPENDS
        ${SOURCE_DIR}/*.h
        ${SOURCE_DIR}/*.hpp
        ${SOURCE_DIR}/*.hh
        ${SOURCE_DIR}/*.hxx
        ${SOURCE_DIR}/*.c
        ${SOURCE_DIR}/*.cpp
        ${SOURCE_DIR}/*.cc
        ${SOURCE_DIR}/*.cxx)
    set(${OUTPUT_VAR} ${sources} PARENT_SCOPE)
endfunction()
