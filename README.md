<img src="assets/DotNameLogoV2.svg" alt="DotNameCppFree Logo" width="100%">

# DotNameCppFree

A comprehensive C++ template for building cross-platform applications with everything you need to start projects fast and cleanly.

[![Linux](https://github.com/tomasmark79/DotNameCppFree/actions/workflows/linux.yml/badge.svg)](https://github.com/tomasmark79/DotNameCppFree/actions/workflows/linux.yml)
[![MacOS](https://github.com/tomasmark79/DotNameCppFree/actions/workflows/macos.yml/badge.svg)](https://github.com/tomasmark79/DotNameCppFree/actions/workflows/macos.yml)
[![Windows](https://github.com/tomasmark79/DotNameCppFree/actions/workflows/windows.yml/badge.svg)](https://github.com/tomasmark79/DotNameCppFree/actions/workflows/windows.yml)

---
test
## 📋 Table of Contents

- [🚀 Overview](#-overview)
- [📦 Template Editions](#-template-editions)
- [⚡ Quick Start](#-quick-start)
- [🛠️ Dependencies & Tools](#️-dependencies--tools)
- [🧰 Helper Classes](#-helper-classes)
- [🏗️ Build System](#️-build-system)
- [📚 Library Reusability](#-library-reusability)
- [💻 VSCode Integration](#-vscode-integration)
- [🌍 Cross-Platform Support](#-cross-platform-support)
- [🔧 Maintenance Tools](#-maintenance-tools)
- [📤 Sharing & Distribution](#-sharing--distribution)
- [💎 Theory & Philosophy](#-theory--philosophy)
- [📄 License](#-license)

---

## 🚀 Overview

**DotNameCppFree** is more than just a project template—it's a complete development solution that manages configuration, compilation, debugging, and deployment with advanced tooling and carefully designed setup. It's my personal playground for C++ development.

### ✨ Key Features

- **🔄 Cross-platform development** for Linux, macOS, and Windows
- **📦 Standalone & Library** structure support
- **🌐 Emscripten** compatibility for HTML5/WebAssembly deployment
- **📦 Conan 2** integration for dependency management
- **🎯 VSCode** deep integration with custom tasks and shortcuts
- **🔧 Cross-compilation** ready with toolchain support
- **🧪 Google Tests** integration
- **🚀 GitHub Actions** CI/CD pipelines

---

## 📦 Template Editions

### 🆓 Free Edition

Available in all public repositories on GitHub. Contains complete application/library source code but lacks interactive development tools.

**📋 Includes:**
- Cross-platform development support (Linux, macOS, Windows)
- Standalone & Library project structure
- Conan 2 integration with ready-to-use `conanfile.py`
- Emscripten configuration for HTML5/WebAssembly
- CPM.cmake and CPM.license integration
- cxxopts command-line parsing
- Helper classes and utilities
- GitHub Actions workflows
- Command-line build support

### 🛸 Private Edition for Contributors

Extends the free edition with:
- **🎛️ VSCode extension** and interactive components
- **🔧 Advanced development tools** and automation
- **📋 Comprehensive task system**
- **🐛 Enhanced debugging capabilities**

### 🤝 Become a Contributor

Support development via [PayPal 💶](https://paypal.me/TomasMark) or GitHub sponsorship to access the full version. Contact [tomas@digitalspace.name](mailto:tomas@digitalspace.name) after contributing.

---

## ⚡ Quick Start

### 📥 Clone the Repository

```bash
# HTTPS
git clone https://github.com/tomasmark79/DotNameCppFree.git ./

# SSH
git clone git@github.com:tomasmark79/DotNameCppFree.git ./
```

### ☁️ GitHub Codespaces

Open directly in GitHub Codespaces for immediate web-based development:

```bash
./build.sh
```

### 🔨 Basic Build Process

**1. Install dependencies with Conan:**
```bash
conan install "." --output-folder="./build/standalone/default/debug" --deployer=full_deploy --build=missing --profile default --settings build_type=Debug
```

**2. Configure and build:**
```bash
source "./build/standalone/default/debug/conanbuild.sh"
cmake -S "./standalone" -B "./build/standalone/default/debug" -DCMAKE_TOOLCHAIN_FILE="conan_toolchain.cmake" -DCMAKE_BUILD_TYPE=Debug
cmake --build "./build/standalone/default/debug" -j $(nproc)
```

---

## 🛠️ Dependencies & Tools

### 🔧 Core Tools

| Tool | Purpose | Version | Documentation |
|------|---------|---------|---------------|
| [Git](https://git-scm.com) | Version control | 2.x+ | [Official Docs](https://git-scm.com/docs) |
| [Conan 2](https://conan.io/center) | Package management | 2.x | [Hub](https://conan.io/center) |
| [CMake](https://cmake.org/download/) | Build system | 3.31+ | [Docs 3.31.X](https://cmake.org/cmake/help/v3.31/) |
| [Ninja](https://ninja-build.org) | Build tool | Latest | [Manual](https://ninja-build.org/manual.html) |
| [ccache](https://ccache.dev/download.html) | Compilation cache | 4.x+ | [Documentation](https://ccache.dev/documentation.html) |
| [VSCode](https://code.visualstudio.com/download) | IDE | Latest | [C++ Extension](https://marketplace.visualstudio.com/vscode) |

### 🛠️ Development Tools

| Tool | Purpose | Documentation |
|------|---------|---------------|
| [Emscripten](https://emscripten.org/) | WebAssembly compilation | [Docs](https://emscripten.org/docs/) |
| [Doxygen](https://www.doxygen.nl) | Documentation generation | [Manual](https://www.doxygen.nl/manual/) |
| [clang-tidy](https://clang.llvm.org/extra/clang-tidy/) | Static analysis | [Guide](https://clang.llvm.org/extra/clang-tidy/) |
| [clang-format](https://clang.llvm.org/docs/ClangFormat.html) | Code formatting | [Style Guide](https://clang.llvm.org/docs/ClangFormat.html) |
| [cmake-format](https://cmake-format.readthedocs.io/en/latest/) | CMake formatting | [ReadTheDocs](https://cmake-format.readthedocs.io/en/latest/) |

### 💻 Supported Compilers

- **GCC** - GNU Compiler Collection
- **Clang** - LLVM Compiler
- **MSVC** - Microsoft Visual C++
- **MinGW** - Windows GCC port
- **Intel C++** - Intel's optimizing compiler

### 🐍 Python Environment

The template uses Python 3 with these packages:
- **pip** - Package installer
- **pyenv** - Python version management
- Various formatting and analysis tools

---

## 🧰 Helper Classes

### 📁 AssetContext Class

Provides proper access to the **assets** folder through CMake configuration. Generates `#define UTILS_ASSET_PATH ""` pointing to the current assets directory, ensuring accessibility across debug and production environments. It works in Linux, macOS, and Windows.

### 🌐 CustomStrings Namespace

Works with external **customstrings.json** for internationalization support. Simple parsing implementation with example usage in `DotNameUtils::JsonUtils::getCustomStringSign()`.

### 📝 Logger Class

Comprehensive logging solution supporting:
- **iostream** streams
- **fmt** library integration
- **Constructor-based** calls
- Configurable header fields (Name, Time, Caller, Level)
- Output to `cout` or `cerr` based on log level

### 🧪 Google Tests Integration

- Tests located in `/tests` directory
- Default **LibTester.cpp** provided
- Controlled by `ENABLE_GTESTS` CMake option (ON by default)
- Output path: `./build/standalone/default/debug/tests`
- VSCode integration for running tests

---

## 🏗️ Build System

### 📦 Conan 2 Dependency Manager

> All required work is done by DotNameCppFree automated tasks in VSCode

#### 💻 Useful Commands for CLI

**Create profile:**
```bash
conan profile detect --force
```

**Install dependencies:**
```bash
conan install "." --output-folder="./build/standalone/default/debug" --deployer=full_deploy --build=missing --profile default --settings build_type=Debug
```

### ⚙️ CMake Options

```cmake
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
```

### 🎛️ CMake Presets 

> Automatic build process with Conan creates unique preset names for each individual build

`cmake --list-presets` output:

```txt
  "debug-linux-x86_64-gcc-15"      - debug-linux-x86_64-gcc-15
  "debug-emscripten-wasm-clang-20" - debug-emscripten-wasm-clang-20
  "debug-windows-x86_64-gcc-14"    - debug-windows-x86_64-gcc-14
  "release-windows-x86_64-gcc-14"  - release-windows-x86_64-gcc-14
  "release-linux-armv8-gcc-12"     - release-linux-armv8-gcc-12
```

---

## 📚 Library Reusability
When developing a library, it's important to make it easy to use in various projects. This template project provides several methods for integrating the library into other projects:

### 📦 CPM.cmake Integration

```cmake
CPMAddPackage(
    NAME DotNameCppFree
    GITHUB_REPOSITORY tomasmark79/DotNameCppFreeFree
    GIT_TAG main)

# Copy assets if needed
file(COPY ${DotNameCppFree_SOURCE_DIR}/assets DESTINATION ${CMAKE_CURRENT_SOURCE_DIR})

target_link_libraries(
    ${LIBRARY_NAME}
    PUBLIC dotname::DotNameCppFree)
```

### 🔗 FetchContent Integration

```cmake
include(FetchContent)
FetchContent_Declare(
    DotNameCppFree
    GIT_REPOSITORY https://github.com/tomasmark79/DotNameCppFreeFree.git
    GIT_TAG main)
FetchContent_MakeAvailable(DotNameCppFree)
```

### 📂 Subdirectory Integration

```cmake
add_subdirectory(path/to/DotNameCppFreeFree)
```

---

## 💻 VSCode Integration

### 🧠 Intellisense Configuration

Optimized settings in **c_cpp_settings.json** prevent CPU overload during database building. Configurable paths for CPM and Conan packages.

### ⌨️ Keyboard Shortcuts

| Shortcut | Action |
|----------|--------|
| **F5** | Quick debug Standalone |
| **F7** | Quick build Standalone |
| **Shift+F7** | Building tasks menu |
| **Ctrl+F7** | Another menu |
| **Ctrl+Alt+F** | clang-format |
| **Ctrl+Alt+L** | clang-tidy linting |
| **Ctrl+Alt+M** | cmake-format |
| **Ctrl+Alt+P** | Build all CMake presets |
| **Ctrl+Alt+R** | Launch Standalone binary |
| **Ctrl+Alt+E** | Launch Emscripten build |

### 📋 Task Categories

**🔨 Building Tasks (Shift+F7):**
- 🚀 Zero to Build (Clean → Install → Configure → Build)
- 🦸 Zero to Hero (Full workflow with install & package)
- 🧹 Clean selected folder
- 🗡️ Conan install
- 🔧 CMake configure
- 🪲 CMake configure with CMake 🦉 debugger  
- 🔨 Build
- 🧪 Launch tests
- 🧪 Launch LibTester
- 📜 Collect Licenses cpm  
- 📌 Install artefacts  
- 🗜️ Release tarballs  
- 🛸 Run CPack  
- 🔍 clang-tidy linting

**🛠️ Other Tasks (Ctrl+F7):**
- 📖 Doxygen Documentation generation
- 🔨 Build All CMakeUserPresets.json
- 📐 Clang format
- 📏 Cmake format
- ⚔️ Create conan library recipe
- 📊 Create conan graph.html

---

## 🌍 Cross-Platform Support

### 🔄 Cross-Compilation

1. **Create Conan profile** for target platform
2. **Add profile** to `task.json` configuration
3. **Build** using the profile through VSCode tasks

**My current `task.json` configuration:**
```json
{
    /* ARCH ITEMS */
    "id": "buildArch",
    "type": "pickString",
    "description": "Select target architecture",
    "options": [
        "default",
        "emscripten",
        "x86_64-w64-mingw32",
        "rpi4_glibc2.17_gcc10.5",
        "rpi4_glibc2.36_gcc12.4",
        "clang19"
    ],
    "default": "default"
},
   
```

### 🌐 Emscripten Support

Managed by `tmplt-emscripten.cmake` module with:
- Framework integration (raylib, SDL2)
- File system preloading: `--preload-file ../../../../assets@share/${target}/assets`
- WebAssembly optimization options

---

## 🔧 Maintenance Tools

### 💾 Automatic Tools Installers

**🐧 Fedora**
```bash
curl -sSL https://raw.githubusercontent.com/tomasmark79/DotNameCppFree/main/.init/initializers/MinimalFedoraDev.sh | bash
```

**🐧 Ubuntu/Debian**
```bash
curl -sSL https://raw.githubusercontent.com/tomasmark79/DotNameCppFree/main/.init/initializers/MinimalDebianDev.sh | bash
```

**🪟 Windows (PowerShell):**
```powershell
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/tomasmark79/DotNameCppFree/main/.init/initializers/MinimalWinDev.ps1' -OutFile 'MinimalWinDev.ps1'; Set-ExecutionPolicy Bypass -Scope Process -Force; .\MinimalWinDev.ps1"
```

### 🛠️ Template Maintenance

- **SolutionRenamer.py** - Rename targets, strings, and classes.  
This will rename all occurrences of the project name in the source code, including CMake files, source files, and documentation.
- **SolutionUpgrader.py** - Update selected files from remote repository with backup.  
For update file from remote repository comment out char `#` in the script.
- **SolutionController.py** - Core of solution processes.  
This script manages the entire solution, including building, testing, and packaging.

- **SolutionController.log** - Log file for all solution processes.

---

## 📤 Sharing & Distribution

### 🆓 Free Clone Creation

For owners of the full DotNameCppFree template who want to share their projects, a simple script is available to create a "Free" clone of the project. This clone includes all necessary files and configurations, but excludes interactive development tools.

**🚀 Start automatic sync:**
```bash
.init/initializers/MakeFreeClone.sh init
```

**🛑 Stop automatic sync:**
```bash
rm .git/hooks/pre-push
rm .git/hooks/post-commit
```

This creates a "Free" suffixed repository (e.g., "MyProject" → "MyProjectFree") with automatic synchronization during commits and pushes to the private repo.

---

### 🔮 Future Vision

Ongoing reverse updates from sub-projects created using this solution.

---

## 🙏 Thanks

**To everyone** who supported the creation of this template. Thank you very much!

---

## 📄 License

MIT License  
Copyright (c) 2024-2025 Tomáš Mark

## ⚠️ Disclaimer

This template is provided "as is," without any guarantees regarding its functionality.

---

[🔝 Back to top](#DotNameCppFree)