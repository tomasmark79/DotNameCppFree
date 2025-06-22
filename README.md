<img src="assets/logo.png" alt="DotNameCppFree Logo" width="20%">

# DotNameCppFree

A comprehensive C++ template for building cross-platform applications with everything you need to start projects fast and cleanly.

[![Linux](https://github.com/tomasmark79/DotNameCppFree/actions/workflows/linux.yml/badge.svg)](https://github.com/tomasmark79/DotNameCppFree/actions/workflows/linux.yml)
[![MacOS](https://github.com/tomasmark79/DotNameCppFree/actions/workflows/macos.yml/badge.svg)](https://github.com/tomasmark79/DotNameCppFree/actions/workflows/macos.yml)
[![Windows](https://github.com/tomasmark79/DotNameCppFree/actions/workflows/windows.yml/badge.svg)](https://github.com/tomasmark79/DotNameCppFree/actions/workflows/windows.yml)

---

## 📋 Table of Contents

- [Overview](#-overview)
- [Template Editions](#-template-editions)
- [Quick Start](#-quick-start)
- [Dependencies & Tools](#-dependencies--tools)
- [Helper Classes](#-helper-classes)
- [Build System](#%EF%B8%8F-build-system)
- [Library Reusability](#-library-reusability)
- [VSCode Integration](#-vscode-integration)
- [Cross-Platform Support](#-cross-platform-support)
- [Maintenance Tools](#-maintenance-tools)
- [Sharing & Distribution](#-sharing--distribution)
- [Theory & Philosophy](#-theory--philosophy)
- [License](#-license)

---

## 🚀 Overview

D🌀tNameCpp is not just a project template — it's a comprehensive development solution that handles configuration, compilation, debugging, and deployment through sophisticated tooling and thoughtful configuration setup.

### Key Features

- **Cross-platform development** for Linux, macOS, and Windows
- **Standalone & Library** structure support
- **Emscripten** compatibility for HTML5/WebAssembly deployment
- **Conan 2** integration for dependency management
- **VSCode** deep integration with custom tasks and shortcuts
- **Cross-compilation** ready with toolchain support
- **Google Tests** integration
- **GitHub Actions** CI/CD pipelines

---

## 📦 Template Editions

### 🚀 Free Edition

Available in all public repositories on GitHub. Contains complete application/library source code but lacks interactive development tools.

**Includes:**
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
- VSCode extension and interactive components
- Advanced development tools and automation
- Comprehensive task system
- Enhanced debugging capabilities

### 🤝 Become a Contributor

Support development via [PayPal 💶](https://paypal.me/TomasMark) or GitHub sponsorship to access the full version. Contact [tomas@digitalspace.name](mailto:tomas@digitalspace.name) after contributing.

---

## ⚡ Quick Start

### Clone the Repository

```bash
# HTTPS
git clone https://github.com/tomasmark79/DotNameCppFree.git ./

# SSH
git clone git@github.com:tomasmark79/DotNameCppFree.git ./
```

### GitHub Codespaces

Open directly in GitHub Codespaces for immediate web-based development:

```bash
# Install dependencies
pip install conan ccache

# Or use the build script
./build_default_debug.sh
```

### Basic Build Process

1. **Install dependencies with Conan:**
   ```bash
   conan install "." --output-folder="./build/standalone/default/debug" --deployer=full_deploy --build=missing --profile default --settings build_type=Debug
   ```

2. **Configure and build:**
   ```bash
   source "./build/standalone/default/debug/conanbuild.sh"
   cmake -S "./standalone" -B "./build/standalone/default/debug" -DCMAKE_TOOLCHAIN_FILE="conan_toolchain.cmake" -DCMAKE_BUILD_TYPE=Debug
   cmake --build "./build/standalone/default/debug" -j 4
   ```

---

## 🛠️ Dependencies & Tools

### Core Tools

| Tool | Purpose | Documentation |
|------|---------|---------------|
| [Git](https://git-scm.com) | Version control | - |
| [Conan 2](https://conan.io/center) | Package management | [Hub](https://conan.io/center) |
| [CMake](https://cmake.org/download/) | Build system | [Docs 3.31.X](https://cmake.org/cmake/help/v3.31/) |
| [Ninja](https://ninja-build.org) | Build tool | - |
| [ccache](https://ccache.dev/download.html) | Compilation cache | - |
| [VSCode](https://code.visualstudio.com/download) | IDE | [C++ Extension](https://marketplace.visualstudio.com/vscode) |

### Development Tools

| Tool | Purpose |
|------|---------|
| [Emscripten](https://emscripten.org/) | WebAssembly compilation |
| [Doxygen](https://www.doxygen.nl) | Documentation generation |
| [clang-tidy](https://clang.llvm.org/extra/clang-tidy/) | Static analysis |
| [clang-format](https://clang.llvm.org/docs/ClangFormat.html) | Code formatting |
| [cmake-format](https://cmake-format.readthedocs.io/en/latest/) | CMake formatting |

### Supported Compilers

- **GCC** - GNU Compiler Collection
- **Clang** - LLVM Compiler
- **MSVC** - Microsoft Visual C++
- **MinGW** - Windows GCC port
- **Intel C++** - Intel's optimizing compiler

### Python Environment

The template uses Python 3 with these packages:
- **pip** - Package installer
- **pyenv** - Python version management
- Various formatting and analysis tools

---

## 🧰 Helper Classes

### AssetContext Class

Provides proper access to the **assets** folder through CMake configuration. Generates `#define UTILS_ASSET_PATH ""` pointing to the current assets directory, ensuring accessibility across debug and production environments.

### CustomStrings Namespace

Works with external **customstrings.json** for internationalization support. Simple parsing implementation with example usage in `DotNameUtils::JsonUtils::getCustomStringSign()`.

### Logger Class

Comprehensive logging solution supporting:
- **iostream** streams
- **fmt** library integration
- **Constructor-based** calls
- Configurable header fields (Name, Time, Caller, Level)
- Output to `cout` or `cerr` based on log level

### Google Tests Integration

- Tests located in `/tests` directory
- Default **LibTester.cpp** provided
- Controlled by `ENABLE_GTESTS` CMake option (ON by default)
- Output path: `./build/standalone/default/debug/tests`
- VSCode integration for running tests

---

## ⚙️ Build System

### Conan 2 Configuration

Create default profile:
```bash
conan profile detect --force
```

Install dependencies:
```bash
conan install "." --output-folder="./build/standalone/default/debug" --deployer=full_deploy --build=missing --profile default --settings build_type=Debug
```

### CMake Options

| Option | Description | Default |
|--------|-------------|---------|
| `BUILD_SHARED_LIBS` | Build shared libraries | OFF |
| `USE_STATIC_RUNTIME` | Use static runtime library | OFF |
| `SANITIZE_ADDRESS` | Enable address sanitizer | OFF |
| `SANITIZE_UNDEFINED` | Enable undefined behavior sanitizer | OFF |
| `SANITIZE_THREAD` | Enable thread sanitizer | OFF |
| `SANITIZE_MEMORY` | Enable memory sanitizer | OFF |
| `ENABLE_HARDENING` | Enable security hardening | OFF |
| `ENABLE_IPO` | Enable interprocedural optimization | OFF |
| `ENABLE_CCACHE` | Enable ccache | OFF |
| `ENABLE_GTESTS` | Enable Google Tests | ON |
| `ENABLE_EMSCRIPTEN_PTHREAD` | Enable pthread for Emscripten | OFF |

### CMake Presets

List available presets:
```bash
cmake --list-presets
```

Build with preset:
```bash
cmake --build --preset <preset_name>
```

---

## 📚 Library Reusability

The template creates a reusable library that can be integrated into other projects using multiple methods:

### CPM.cmake Integration

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

### FetchContent Integration

```cmake
include(FetchContent)
FetchContent_Declare(
    DotNameCppFree
    GIT_REPOSITORY https://github.com/tomasmark79/DotNameCppFreeFree.git
    GIT_TAG main)
FetchContent_MakeAvailable(DotNameCppFree)
```

### Subdirectory Integration

```cmake
add_subdirectory(path/to/DotNameCppFreeFree)
```

---

## 💻 VSCode Integration

### Intellisense Configuration

Optimized settings in **c_cpp_settings.json** prevent CPU overload during database building. Configurable paths for CPM and Conan packages.

### Keyboard Shortcuts

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

### Task Categories

**Building Tasks (Shift+F7):**
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

**Other Tasks (Ctrl+F7):**
- 📖 Doxygen Documentation generation
- 🔨 Build All CMakeUserPresets.json
- 📐 Clang format
- 📏 Cmake format
- ⚔️ Create conan library recipe
- 📊 Create conan graph.html

### Recommended Extensions

Essential VSCode extensions for optimal development experience:

```url
https://marketplace.visualstudio.com/items?itemName=chekweitan.compare-view
https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools
https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools-extension-pack
https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools-themes
https://marketplace.visualstudio.com/items?itemName=FleeXo.cpp-class-creator
https://marketplace.visualstudio.com/items?itemName=amiralizadeh9480.cpp-helper
https://marketplace.visualstudio.com/items?itemName=twxs.cmake
https://marketplace.visualstudio.com/items?itemName=ms-vscode.cmake-tools
https://marketplace.visualstudio.com/items?itemName=cheshirekow.cmake-format
https://marketplace.visualstudio.com/items?itemName=Guyutongxue.cpp-reference
https://marketplace.visualstudio.com/items?itemName=tamasfe.even-better-toml
https://marketplace.visualstudio.com/items?itemName=github.vscode-github-actions
https://marketplace.visualstudio.com/items?itemName=GitHub.copilot
https://marketplace.visualstudio.com/items?itemName=GitHub.copilot-chat
https://marketplace.visualstudio.com/items?itemName=ms-python.python
https://marketplace.visualstudio.com/items?itemName=natqe.reload
https://marketplace.visualstudio.com/items?itemName=foxundermoon.shell-format
https://marketplace.visualstudio.com/items?itemName=jeff-hykin.better-cpp-syntax
```

---

## 🌍 Cross-Platform Support

### Cross-Compilation

1. **Create Conan profile** for target platform
2. **Add profile** to `task.json` configuration
3. **Build** using the profile through VSCode tasks

Example `task.json` configuration:
```json
{
    "id": "buildArch",
    "type": "pickString",
    "description": "Select target architecture",
    "options": [
        "default",
        "emscripten",
        "x86_64-w64-mingw32",
        "rpi4_glibc2.17_gcc10.5"
    ]
}
```

### Emscripten Support

Managed by `tmplt-emscripten.cmake` module with:
- Framework integration (raylib, SDL2)
- File system preloading: `--preload-file ../../../../assets@share/${target}/assets`
- WebAssembly optimization options

---

## 🔧 Maintenance Tools

### System Installers

**Linux (using setup-cpp):**
```bash
# Debian-based
curl -sSL https://raw.githubusercontent.com/tomasmark79/DotNameCppFree/main/.init/initializers/DebianBasedInstaller.sh | bash

# Fedora
curl -sSL https://raw.githubusercontent.com/tomasmark79/DotNameCppFree/main/.init/initializers/FedoraInstaller.sh | bash
```

**Windows (PowerShell):**
```powershell
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/tomasmark79/DotNameCppFree/main/.init/initializers/WindowsInstaller.ps1' -OutFile 'WindowsInstaller.ps1'; Set-ExecutionPolicy Bypass -Scope Process -Force; .\WindowsInstaller.ps1"
```

### Template Maintenance

- **SolutionRenamer.py** - Rename targets, strings, and classes
- **SolutionUpgrader.py** - Update selected files from remote repository with backup
- **SolutionController.py** - core of solution processes
- **Solution.log** - Workflow activity logging

---

## 📤 Sharing & Distribution

### Free Clone Creation

For contributors wanting to share source code while keeping private features:

**Start automatic sync:**
```bash
.init/initializers/MakeFreeClone.sh init
```

**Stop automatic sync:**
```bash
rm .git/hooks/pre-push
rm .git/hooks/post-commit
```

This creates a "Free" suffixed repository (e.g., "MyProject" → "MyProjectFree") with automatic synchronization during commits and pushes to the private repo.

---

## 💎 Theory & Philosophy

### Why This Instead of Official CMake Extensions?

While official VSCode CMake extensions are useful, they fall short for complex scenarios like cross-compilation. Building for **x86** while targeting **ARM64** requires toolchains, sysroots, and sophisticated integration—this template handles that complexity.

### Additional Value

- **Freedom through Integration** - Transforms VSCode into a full IDE and cross tool
- **Comprehensive Workflow** - Python scripts + VSCode tasks = complete development center
- **Minimal Cost Solution** - Professional development environment without expensive tools
- **Ready and Functional** - Everything works out of the box

### Future Vision

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