cmake_minimum_required(VERSION 3.21 FATAL_ERROR)

# Root project
project(DotNameCpp 
    VERSION 0.0.1
    LANGUAGES C CXX
    DESCRIPTION "Cross-platform C++ template"
    HOMEPAGE_URL "https://github.com/tomasmark79/DotNameCpp")

option(BUILD_LIBRARY "Build library" ON)
option(BUILD_STANDALONE "Build standalone" ON)

# Always include library for its targets (needed by standalone)
include(cmake/project-library.cmake)

if(BUILD_STANDALONE) 
    include(cmake/project-standalone.cmake)
endif()