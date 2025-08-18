cmake_minimum_required(VERSION 3.21 FATAL_ERROR)

# DotNameCpp Root project orchestrator
project(
    DotNameCpp
    VERSION 0.0.1
    LANGUAGES C CXX
    DESCRIPTION "Cross-platform C++ template"
    HOMEPAGE_URL "https://github.com/tomasmark79/DotNameCpp")

# Build options
option(BUILD_LIBRARY "Build library" OFF)
option(BUILD_STANDALONE "Build standalone" OFF)

# Default: build both if nothing specified
if(NOT BUILD_LIBRARY AND NOT BUILD_STANDALONE)
    set(BUILD_LIBRARY ON)
    set(BUILD_STANDALONE ON)
endif()

# Include common settings
include(cmake/project-common.cmake)

# Library is needed by standalone, so include if either is requested
if(BUILD_LIBRARY OR BUILD_STANDALONE)
    include(cmake/project-library.cmake)
endif()

if(BUILD_STANDALONE)
    include(cmake/project-standalone.cmake)
endif()
