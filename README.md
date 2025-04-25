<img src="assets/logo.png" alt="DotNameCppFree Logo" width="20%">


The D🌀tName C++ Template is a modern and versatile foundation for cross-platform ***C++*** development. It creates a starting point from zero to hero for C++ developers who need to quickly build a robust application.  

[![Linux](https://github.com/tomasmark79/DotNameCppFree/actions/workflows/linux.yml/badge.svg)](https://github.com/tomasmark79/DotNameCppFree/actions/workflows/linux.yml)
[![MacOS](https://github.com/tomasmark79/DotNameCppFree/actions/workflows/macos.yml/badge.svg)](https://github.com/tomasmark79/DotNameCppFree/actions/workflows/macos.yml)
[![Windows](https://github.com/tomasmark79/DotNameCppFree/actions/workflows/windows.yml/badge.svg)](https://github.com/tomasmark79/DotNameCppFree/actions/workflows/windows.yml)  

## Index

**Template Editions**  
╰➤[🚀 Free edition](#-key-features-free-for-all)  
╰➤[🛸 Private edition for](#-key-features-in-private-edition) - [***Contributors***](#contributors---sponsors)

**Ready to go**  
╰➤[Used 3rd parties](#used-3rd-parties)  
╰➤[**Clone to local development**](#clone-to-local-development)  
╰➤[Github Codespace to dev on the Web](#using-github-codespace)  

**Helper Classes**  
╰➤[AssetContext Class](#assetcontext-class)  
╰➤[Logger Class](#logger-class)  
╰➤[Google Tests integration](#google-tests-integration)  
╰➤[Reusability library part in another projects](#reusability-in-another-projects)  

**Dependencies, Configuration and Building**  
╰➤[Conan 2](#conan-2)  
╰➤[CMake](#cmake)  
╰➤[CMake Options](#cmake-options)  
╰➤[Manual Template Build](#manual-template-build)  
╰➤[Manual Template Build by CMake Presets](#manual-template-build-by-cmake-presets)  
╰➤[Cross-Compilation](#cross-compilation)  

**Library Reusability**  
╰➤[Library Reusability](#reusability)  
╰➤[linking by CPM.cmake](#linking-by-cpmcmake)  
╰➤[linking by CMake FetchContent](#linking-by-cmake-fetchcontent)  
╰➤[linking by CMake add_subdirectory](#linking-by-cmake-add_subdirectory)  

**VSCode Integration**  
╰➤[VSCode Tasks and Keybindings](#vscode-tasks-and-keybindings)  
╰➤[VSCode Recomended Extensions](#vscode-recomended-extensions)  

**Maintenance**  
╰➤[Environment Installers](#environment-installers)  
╰➤[Renamer](#solution-renamer)  
╰➤[Upgrader](#solution-upgrader)  

**Sharing template or your project**  
╰➤[Create Lightweight Clone](#create-lightweight-clone)  

**Missing features**  
╰➤[ToDo](#todo)  

**Greetings**  
╰➤[Thanks](#thanks)  

[👆🏻](#index)
---

## **Template Editions**  

### 🚀 Free Edition

- Develop on **Linux**, **MacOS**, and **Windows**
- Template utilizes a **Standalone** & **Library** structure
- Integrates **Conan 2** with a ready-to-use `conanfile.py`
- Includes [**CPM.cmake**](https://github.com/cpm-cmake/CPM.cmake) and [**CPM.license**](https://github.com/cpm-cmake/CPMLicenses.cmake)
- Integrates [**cxxopts**](https://github.com/jarro2783/cxxopts/tree/v3.2.1) ([cxxopts wiki](https://github.com/jarro2783/cxxopts/wiki))
- Provides Helper Classes
- Includes predefined GitHub [Actions](https://docs.github.com/en/actions)
- Supports command-line-based builds

### 🛸 Private Edition for Contributors

- Provides everything else  

### Contributors - Sponsors  

Please consider contributing via [PayPal 💶](https://paypal.me/TomasMark) or by sponsoring me directly on GitHub to support future development. Once you have made your contribution, kindly contact me at [tomas@digitalspace.name](mailto:tomas@digitalspace.name) so that I can grant you access to the full version of the DotNameCppFree template project.

Thank you in advance.

[👆🏻](#index)
---

## Ready to go

### Used 3rd parties

| Symbol | Description                     |
|--------|---------------------------------|
| `r`    | Required for free edition       |
| `r+`   | Required for private edition    |
| `o`    | Optional                        |
| `f`    | Future plans                    |

- `o` [git](https://git-scm.com)
- `o` [conan 2](https://conan.io/center) - [ConanHub](https://conan.io/center)
- `o` [make](https://www.gnu.org/software/make/)
- `o` [ninja](https://ninja-build.org)
- `r` [cmake](https://cmake.org/download/)
- `r+` [ccache](https://ccache.dev/download.html)
- `r+` [vscode](https://code.visualstudio.com/download) with C++ [extension](https://marketplace.visualstudio.com/vscode)
- `r+` [pyenv](https://github.com/pyenv/pyenv)
  - `r+` [python 3](https://www.python.org)
    - `r+` [pip](https://pypi.org/project/pip/) - [PipHub](https://pypi.org)
      - `r+` [clang-tidy](https://clang.llvm.org/extra/clang-tidy/)
      - `r+` [clang-format](https://clang.llvm.org/docs/ClangFormat.html) >= 19.1.0
      - `r+` [clanf-format configurator](https://clang-format-configurator.site)
      - `r+` [clang-format style options](https://releases.llvm.org/19.1.0/tools/clang/docs/ClangFormatStyleOptions.html)
      - `r+` [cmake-format](https://cmake-format.readthedocs.io/en/latest/)
- `f` [vcpkg](https://vcpkg.io/en/)
- `f` [doxygen](https://www.doxygen.nl)
- `f` [gcovr](https://gcovr.com/en/stable/)

#### Compilers

- `o` [mingw](https://www.mingw-w64.org)
- `o` [llvm](https://llvm.org)
- `o` [clang](https://clang.llvm.org)
- `o` [gcc](https://gcc.gnu.org)
- `o` [msvc](https://visualstudio.microsoft.com/vs/features/cplusplus/)
- `o` [intel C++ compiler](https://software.intel.com/content/www/us/en/develop/tools/oneapi/components/dpc-compiler.html)

#### Crosstools

- `r+` [crosstool-ng](https://crosstool-ng.github.io)

### Clone to local development

```bash
git clone https://github.com/tomasmark79/DotNameCppFree.git ./
git clone git@github.com:tomasmark79/DotNameCppFree.git ./
```

### Using Github Codespace

  Open the free edition template directly in a GitHub Codespace and start working immediately in the web-based VSCode. Simply run "pip install conan" in the terminal to install Conan 2 and then use the "build_default_debug.sh" script for basic command-line compilation or your own commands to specify build needs. 🤓

[👆🏻](#index)
---

## Helper Classes

### AssetContext 🖇️ Class
To ensure proper access to the **assets** folder, the solution relies on the CMake configurator. During project configuration, it generates and sets the preprocessor definition **#define UTILS_ASSET_PATH ""** to point to the current **assets** folder. Behind the scenes, certain adjustments are made to guarantee that the folder remains accessible, regardless of whether the project is being debugged or deployed to a production Linux environment. Minor modifications might be required for other platforms, but perhaps not. In the Standalone section, **constexpr std::string_view utilsAssetPath** is finalized and passed to the library via a constructor, where the **AssetContext** class awaits this string. The **AssetContext** class later enables access to the **assets** folder path from anywhere within the library part project.

### Logger 📝 Class

The Logger ensures output to the console. It supports **iostream** streams, **fmt**, and constructor-based calls. The output is sent to **cout** or **cerr**, depending on the set level. To finalize the log entry, the string must be terminated with **std::endl**. The Name, Time, Caller, and Level fields in the header can each be disabled individually by calling *LOG.showHeaderTime(false, ...)*, etc. Refer to the Logger class declaration for a detailed understanding of the intended behavior.

### Google 🧪 Tests integration

Inside the standalone folder, there is a **/tests** directory where C++ gtests can be created. A default **LibTester.cpp** file is already provided. Tests can be enabled or disabled using the CMake option **ENABLE_GTESTS**, which is set to ON by default. The output path for tests is configured as a relative path to **./build/standalone/default/debug/tests**. Contributors can use the VSCode task menu to invoke either the **ctest** command or directly execute the **./LibTester** binary.

[👆🏻](#index)
---

## Dependencies, Configuration and Building

### Conan 2

Conan 2 ensures semi-automatic and very convenient dependency management for our build system. In traditional desktop development, we often rely on dependencies provided by the system we are developing on. However, for cross-platform development, it is necessary to have dependencies available for the target architecture, which may differ from the one we are developing on. This is called cross-compilation. Conan 2 helps us with both native and cross-compilation. Conan 2 is an application written in Python. It has its own ecosystem with a remote hub offering many dependencies that it can deliver to us. To use Conan 2, we need a **Python runtime** and a **basic configuration** that creates a new default profile **default**, which will contain the configuration for the default compiler on the system. This profile will also be used as the default in **VSCode tasks**.

To create a new Conan 2 profile on your system, use the following command:

```bash
conan profile detect --force
```

install dependencies to your project:

```bash
conan install "." --output-folder="./build/standalone/default/debug" --deployer=full_deploy --build=missing --profile default --settings build_type=Debug
```

>💡 More details can be found in the [Conan 2 Documentation](https://docs.conan.io/2/).

### CMake

The template relies entirely on the CMake tool.

#### CMake Options

You need advanced knowledge to use these options. 

- `BUILD_SHARED_LIBS`: Build shared libraries instead of static ones.
- `USE_STATIC_RUNTIME`: Use the static runtime library.
- `SANITIZE_ADDRESS`: Enable address sanitizer.
- `SANITIZE_UNDEFINED`: Enable undefined behavior sanitizer.
- `SANITIZE_THREAD`: Enable thread sanitizer.
- `SANITIZE_MEMORY`: Enable memory sanitizer.
- `ENABLE_HARDENING`: Enable hardening options for increased security.
- `ENABLE_IPO`: Enable interprocedural optimization.
- `ENABLE_CCACHE`: Enable ccache for faster recompilation.
- `ENABLE_GTESTS`: Google tests.

#### Manual Template Build

If Conan 2 provides the dependencies, we activate access to its packages using the `source` command:

```bash
source "./build/standalone/default/debug/conanbuild.sh"
```

And here is the actual configuration, building, and optional installation command:

```bash
cmake -S "./standalone" -B "./build/standalone/default/debug" -DCMAKE_TOOLCHAIN_FILE="conan_toolchain.cmake" -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX="./build/installation/default/debug"
cmake --build "./build/standalone/default/debug"  -j 4
cmake --build "./build/standalone/default/debug" --target install -j 4
```

#### Manual Template Build by CMake Presets

If the template is used in the contributor version with Conan 2, an automatically generated file **CMakeUserPresets.json** is created. This file contains the history of previous builds, and it is possible to invoke these builds again.

```bash
cmake --list-presets  
```
example output:

```bash
Available configure presets:  

  "conan-debug-x86_64-fa690d22"          - 'conan-debug' config (x86_64-fa690d22)
  "conan-release-x86_64-a7ca6aaa"        - 'conan-release' config (x86_64-a7ca6aaa)
  "conan-minsizerel-x86_64-b9d7b0af"     - 'conan-minsizerel' config (x86_64-b9d7b0af)
  "conan-relwithdebinfo-x86_64-6d462a88" - 'conan-relwithdebinfo' config (x86_64-6d462a88)
  "conan-debug-armv8-8b031f0f"           - 'conan-debug' config (armv8-8b031f0f)
```

select preset from the list above and call build:

```bash
cmake --build --preset <preset_name>
```

> 💡 The Private edition includes task item 🔨 Build All CMakeUserPresets.json: **Ctrl+Alt+P** to build all presets on all systems.  

> 💡 **conanfile.py** ensures the injection of a uuid into the name value of each CMakePreset.json to prevent the generation of presets with duplicate names.  

## Cross-Compilation

To enable cross-compilation, we first need an existing Conan 2 profile configured with the toolchain used for cross-compilation. Setting up such a profile is beyond the scope of this document, but you can find all the necessary details in the Conan 2 documentation.

Once we have an existing Conan 2 profile for our target platform, the name of this profile can be added to our template in the **task.json** file. This ensures that the profile will appear in the menu when building our template. And that's all that is needed to make this solution work with cross-compilation. The rest depends on the Conan 2 profile.

Example of my own **task.json** on my system:
```json
{
"default",
"default-clang",
"x86_64-w64-mingw32",
"rpi4_glibc2.17_gcc10.5",
"rpi4_glibc2.36_gcc12.4",
"rpi4_glibc2.41_gcc14.2",
"fedora_glibc2.17_gcc10.5",
"fedora_glibc2.36_gcc12.4",
"fedora_glibc2.41_gcc14.2"
}
```
   
[👆🏻](#index)
---

### Library Reusability

The advantage of this template lies in the fact that it essentially creates a library. This library can be used anywhere else. You can easily reuse the library from the first project in a second, third, or any other project.

#### linking by CPM.cmake

```cmake
CPMAddPackage(
    NAME DotNameCppFree
    GITHUB_REPOSITORY tomasmark79/DotNameCppFreeFree
    GIT_TAG main)

# Remote library source code may require files
# within ./assets folder, then you have to copy
# all of them to your work dir ./assets folder.
file(COPY ${DotNameCppFree_SOURCE_DIR}/assets DESTINATION ${CMAKE_CURRENT_SOURCE_DIR})

target_link_libraries(
    ${LIBRARY_NAME}
    PUBLIC dotname::DotNameCppFree
    )
```

#### linking by CMake FetchContent

```cmake
include(FetchContent)
FetchContent_Declare(
    DotNameCppFree
    GIT_REPOSITORY https://github.com/tomasmark79/DotNameCppFreeFree.git
    GIT_TAG main
)
FetchContent_MakeAvailable(DotNameCppFree)
file(COPY...
target_link_libraries(...
```

#### linking by CMake add_subdirectory

```cmake
add_subdirectory(path/to/DotNameCppFreeFree)
file(COPY...
target_link_libraries(...
```

[👆🏻](#index)
---

## VSCode Tasks and Keybindings

> 💡 For the keyboard shortcuts to work, the contents of keybindings.json attached in template must be copied into the system configuration.

**Building Tasks** dependent on build type invoked by **Shift+F7** or **Ctrl+Shift+C**  

- 🚀 Zero to Build 🧹 🗡️ 🔧 🔨  
- 🦸 Zero to Hero 🧹 🗡️ 🔧 🔨 📌 🗜️  
- 🧹 Clean selected folder  
- 🗡️ Conan install  
- 🔧 CMake configure  
- 🪲 CMake configure with CMake 🦉 debugger  
- 🔨 Build  
- 🧪 Launch CTest
- 🧪 Launch LibTester
- 📜 Collect Licenses cpm  
- 📌 Install artefacts  
- 🗜️ Release tarballs  
- 🛸 Run CPack  
- 🔍 clang-tidy linting : **Ctrl+Alt+L**  
- 🔨 Quick build Standalone : **F7**  
- 🪲 Quick debug Standalone : **F5**  

**Other Tasks** independent on build type invoked by **Ctrl+F7** or **Ctrl+Shift+V**   

- 🔨 Build All CMakeUserPresets.json : **Ctrl+Alt+P**  
- 🚀 Launch Standalone binary : **Ctrl+Alt+R**  
- 📐 clang-format : **Ctrl+Alt+F**  
- 📏 cmake-format : **Ctrl+Alt+M**  
- ⚔️ Conan create library recipe  
- 📊 Conan dependencies in graph.html  

**Other shortcuts**  

- **F8** or **Shift+F8** jumps to the next or previous error  

## VSCode Recomended Extensions

```url
ms-vscode.cpptools
ms-vscode.cpptools-extension-pack
ms-vscode.cpptools-themes
FleeXo.cpp-class-creator
amiralizadeh9480.cpp-helper
twxs.cmake
ms-vscode.cmake-tools
cheshirekow.cmake-format
Guyutongxue.cpp-reference
tamasfe.even-better-toml
github.vscode-github-actions
GitHub.copilot
GitHub.copilot-chat
ms-python.python
natqe.reload
foxundermoon.shell-format
jeff-hykin.better-cpp-syntax
```

[👆🏻](#index)
---


[👆🏻](#index)

## Environment Installers  

Linux installer scripts are using [setup-cpp](https://github.com/aminya/setup-cpp).

#### Bash script for Debian  

```bash
curl -sSL https://raw.githubusercontent.com/tomasmark79/DotNameCppFree/main/.init/initializers/DebianBasedInstaller.sh | bash
```

#### Bash script for Fedora  

```bash
curl -sSL https://raw.githubusercontent.com/tomasmark79/DotNameCppFree/main/.init/initializers/FedoraInstaller.sh | bash
```

#### Powershell script for Windows (without pyenv)

```powershell
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/tomasmark79/DotNameCppFree/main/.init/initializers/WindowsInstaller.ps1' -OutFile 'WindowsInstaller.ps1'; Set-ExecutionPolicy Bypass -Scope Process -Force; .\WindowsInstaller.ps1"
```

[👆🏻](#index)

## Template Maintenance

### Solution Renamer

Renaming the executable and library, including all necessary strings and classes, is handled by the Python script **SolutionRenamer.py**.

### Solution Upgrader

Updating individual files from the remote repository with the option to back up updated components is handled by the Python script **SolutionUpgrader.py**.

### Log using history

Workflow activities related to the project did by workflow are logged in the file **Solution.log**.

[👆🏻](#index)

## Formatting C like code

included `.clang-format` with prefered settings

[👆🏻](#index)

## Formatting CMake like code

included `.cmake-format`

[👆🏻](#index)

## Create Lightweight Clone
 
If you are reading this text on a public GitHub repository, it is most likely that this repository was created by the **MakeFreeClone.sh** script located in the **.init/initializers** folder. The script generates a lightweight clone of your main project with the suffix **Free**. For example, **"MyProject"** will become **"MyProjectFree"** and will be automatically kept up to date.

**To Start**

1. Run `MakeFreeClone.sh init` to set up git hooks.

    ```bash
    .init/initializers/MakeFreeClone.sh init
    ```
2. Hooks will sync local and remote free repositories during commit and push.

3. Commits will update `README.md` to add "Free" to relevant strings.

4. Customize exclusions with `--exclude='fileOrFolderEtc'` in the script.

**To stop** maintaining the lightweight clone, we delete the hooks in particular template.

```bash
rm .git/hooks/pre-push
rm .git/hooks/post-commit
```
[👆🏻](#index)


```

[👆🏻](#index)

## ToDo

> Understanding the entire solution might be beyond the capabilities of some individuals. Therefore, I would like to eventually create a detailed guide on the behavior of the entire solution to help newcomers more easily get involved in C++ development.

>Possibility to debug CMake configuration even when the CMakeLists.txt file is broken.  

[👆🏻](#index)

## Few words 💎✨

**Why does this exist when there are official CMake extensions for VSCode?**  
Great question. While official extensions are helpful, creating and building an application for architecture **X86** targeting, for example, **Arch64**, requires more than just the basics. You need to provide a toolchain, a minimal system file tree (sysroot), and integrate everything into a functional whole. That’s precisely what this solution does. 😎 - Essentially, all you need to do is supply the toolchain and sysroot, and this solution is ready to produce applications for other platforms.

**What scenarios is this template suitable for?**  
This solution is suitable for a wide range of projects of varying sizes. Thanks to its versatility, it can be used either as a standalone application or for creating modules and libraries for other applications. The solution is designed to adapt to different needs throughout the development cycle. Significant attention and effort have been devoted to finding a balance between optimization, clarity, and the potential for future code flexibility.

**What makes this solution unique?**  
This project combines several modern and unique features. First, the design of the project as a standalone application/library allows the project you are working on to later be used as a component in another project. This, of course, assumes that the main functionality of the application is properly implemented in the library part, while the standalone part can be used, for example, as a starting point for testing the library or simply as a launcher with minimal dependencies on the library. Second, the uniqueness of this solution lies in the fact that the Private version effectively transforms into a professional development IDE thanks to extended tasks in VSCode, making development highly enjoyable.

**Why are CPM.cmake, CPMLicenses, and PackageProject used in this solution?**  
Conan sometimes reacts more slowly to the development of certain projects, while CPM.cmake allows for conveniently using the latest iterations directly from GitHub. Many modern CMake projects use CPM.cmake for dependency management due to its flexibility and efficiency.

**What is the future direction of this solution?**  
While this solution could be endlessly improved, such efforts require significant time and dedication. Therefore, its future development will depend solely on my personal needs. Alternatively, it may evolve based on contributions from others who wish to collaborate on the project, request updates, or report bugs that need fixing.

**What is still missing from this solution?**  
At this moment, I am not certain that anything specific is missing.

## Thanks

**To everyone** who supported me in creating this template.  
Thank you very much!  

[👆🏻](#index)

## License

MIT License  
Copyright (c) 2024-2025 Tomáš Mark

This template is provided "as is," without any guarantees regarding its functionality.

[👆🏻](#index)