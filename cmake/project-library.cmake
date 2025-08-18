# MIT License Copyright (c) 2024-2025 Tomáš Mark

# ==============================================================================
# LIBRARY-SPECIFIC CONFIGURATION
# ==============================================================================

# Load common settings
include(${CMAKE_CURRENT_LIST_DIR}/project-common.cmake)

# ==============================================================================
# Library attributes
# ==============================================================================
set(LIBRARY_NAME DotNameLib)
set(LIBRARY_NAMESPACE dotname)

project(
    ${LIBRARY_NAME}
    VERSION 0.0.1
    LANGUAGES C CXX
    DESCRIPTION "template Copyright (c) 2024 TomasMark [at] digitalspace.name"
    HOMEPAGE_URL "https://github.com/tomasmark79/DotNameCpp")

# ==============================================================================
# Build guards
# ==============================================================================
if(PROJECT_SOURCE_DIR STREQUAL PROJECT_BINARY_DIR)
    message(
        WARNING
            "In-source builds. Please make a new directory (called a Build directory) and run CMake from there."
    )
endif()

# ==============================================================================
# Library installation attributes
# ==============================================================================
set(INSTALL_INCLUDE_DIR include/${LIBRARY_NAME})
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/include/${LIBRARY_NAME}/
        DESTINATION ${INSTALL_INCLUDE_DIR})

# ==============================================================================
# Library dependencies
# ==============================================================================
# Try to find dependencies via find_package (Conan/system), fallback to CPM

# Try fmt via find_package first (for Conan users)
find_package(fmt QUIET)
if(NOT fmt_FOUND)
    # Fallback to CPM for standalone usage
    CPMAddPackage(
        NAME fmt
        GITHUB_REPOSITORY fmtlib/fmt
        VERSION 11.2.0)
endif()

# Try nlohmann_json via find_package first (for Conan users)
find_package(nlohmann_json QUIET)
if(NOT nlohmann_json_FOUND)
    # Fallback to CPM for standalone usage
    CPMAddPackage(
        NAME nlohmann_json
        GITHUB_REPOSITORY nlohmann/json
        VERSION 3.12.0)
endif()

# CPM packages specific to library
CPMAddPackage("gh:TheLartians/PackageProject.cmake@1.12.0")
CPMAddPackage("gh:cpm-cmake/CPMLicenses.cmake@0.0.7")
cpm_licenses_create_disclaimer_target(
    write-licenses-${LIBRARY_NAME} "${CMAKE_CURRENT_BINARY_DIR}/${LIBRARY_NAME}_third_party.txt"
    "${CPM_PACKAGES}")

# ==============================================================================
# Library source files
# ==============================================================================
gather_sources(headers ${CMAKE_CURRENT_SOURCE_DIR}/include)
gather_sources(sources ${CMAKE_CURRENT_SOURCE_DIR}/src)

# ==============================================================================
# Create library target
# ==============================================================================
add_library(${LIBRARY_NAME})
target_sources(${LIBRARY_NAME} PRIVATE ${headers} ${sources})

# Apply common target settings
apply_common_target_settings(${LIBRARY_NAME})

# ==============================================================================
# Library-specific configuration
# ==============================================================================
# Emscripten handler
include(${CMAKE_CURRENT_LIST_DIR}/tmplt-emscripten.cmake)
emscripten(${LIBRARY_NAME} 0 1 "")

# Headers
target_include_directories(
    ${LIBRARY_NAME}
    PUBLIC $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>
    PUBLIC $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/src>
    PUBLIC $<INSTALL_INTERFACE:${INSTALL_INCLUDE_DIR}>)

# Compile options
target_compile_options(
    ${LIBRARY_NAME}
    PUBLIC "$<$<COMPILE_LANG_AND_ID:CXX,MSVC>:/permissive-;/W4>"
    PUBLIC
        "$<$<AND:$<NOT:$<COMPILE_LANG_AND_ID:CXX,MSVC>>,$<NOT:$<PLATFORM_ID:Darwin>>,$<NOT:$<CXX_COMPILER_ID:Clang>>>:-Wall;-Wextra;-Wpedantic;-MMD;-MP>"
    PUBLIC
        "$<$<AND:$<NOT:$<COMPILE_LANG_AND_ID:CXX,MSVC>>,$<PLATFORM_ID:Darwin>>:-Wall;-Wextra;-Wpedantic>"
)

# C++ standard
target_compile_features(${LIBRARY_NAME} PUBLIC cxx_std_17)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Linking
target_link_libraries(
    ${LIBRARY_NAME}
    PUBLIC fmt::fmt
    PUBLIC nlohmann_json::nlohmann_json)

# ==============================================================================
# Package configuration
# ==============================================================================
packageProject(
    NAME ${LIBRARY_NAME}
    VERSION ${PROJECT_VERSION}
    BINARY_DIR ${PROJECT_BINARY_DIR}
    INCLUDE_DIR "/include"
    INCLUDE_DESTINATION "include"
    INCLUDE_HEADER_PATTERN "*.h;*.hpp;*.hh;*.hxx"
    DEPENDENCIES "fmt#11.1.0;nlohmann_json#3.12.0;CPMLicenses.cmake@0.0.7"
    VERSION_HEADER "${LIBRARY_NAME}/version.h"
    EXPORT_HEADER "${LIBRARY_NAME}/export.h"
    NAMESPACE ${LIBRARY_NAMESPACE}
    COMPATIBILITY AnyNewerVersion
    DISABLE_VERSION_SUFFIX YES
    ARCH_INDEPENDENT NO
    CPACK YES
    RUNTIME_DESTINATION ${CMAKE_INSTALL_BINDIR})

# Workaround: Ensure .dll files go to bin/ on Windows, not bin/LibraryName/
if(WIN32 AND BUILD_SHARED_LIBS)
    install(TARGETS ${LIBRARY_NAME} 
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        COMPONENT Runtime)
    
    # Remove duplicate DLL created by packageProject
    install(CODE "
        file(REMOVE_RECURSE \"\${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_BINDIR}/${LIBRARY_NAME}\")
        message(STATUS \"Removed duplicate DLL directory: ${CMAKE_INSTALL_BINDIR}/${LIBRARY_NAME}\")
    ")
endif()
