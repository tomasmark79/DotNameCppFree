<img src="assets/logo.png" alt="DotNameCppFree Logo" width="20%">

The D🌀tNameCpp is my own C++ template for building cross-platform applications. It includes almost everything I typically need to kick off a project fast and cleanly.

[![Linux](https://github.com/tomasmark79/DotNameCppFree/actions/workflows/linux.yml/badge.svg)](https://github.com/tomasmark79/DotNameCppFree/actions/workflows/linux.yml)
[![MacOS](https://github.com/tomasmark79/DotNameCppFree/actions/workflows/macos.yml/badge.svg)](https://github.com/tomasmark79/DotNameCppFree/actions/workflows/macos.yml)
[![Windows](https://github.com/tomasmark79/DotNameCppFree/actions/workflows/windows.yml/badge.svg)](https://github.com/tomasmark79/DotNameCppFree/actions/workflows/windows.yml)  

## Index

**Template Editions**  
╰➤[🚀 Free edition](#-free-edition) - lacks process tools and additional project extensions  
╰➤[🛸 Private edition for](#-private-edition-for-contributors) - [***Contributors***](#contributors---sponsors)

**Ready to go**  
╰➤[Used 3rd parties](#used-3rd-parties)  
╰➤[Not-Used 3rd parties](#not-used-3rd-parties)  
╰➤[⭐ **Clone to local development**](#clone-to-local-development) ⭐   
╰➤[Using Github Codespace](#using-github-codespace)  

**Helper Classes**  
╰➤[AssetContext Class](#assetcontext-class)  
╰➤[CustomStrings NameSpace](#customstrings-namespace)  
╰➤[Logger Class](#logger-class)  
╰➤[Google Tests integration](#google-tests-integration)  

**Dependencies, Configuration and Building**  
╰➤[Conan 2](#conan-2)  
╰➤[CMake](#cmake)  
╰➤[CMake Options](#cmake-options)  
╰➤[Manual Template Build](#manual-template-build)  
╰➤[Manual Template Build by CMake Presets](#manual-template-build-by-cmake-presets)  
╰➤[Cross-Compilation](#cross-compilation)  

**Library Reusability**  
╰➤[Library Reusability](#library-reusability)  
╰➤[linking by CPM.cmake](#linking-by-cpmcmake)  
╰➤[linking by CMake FetchContent](#linking-by-cmake-fetchcontent)  
╰➤[linking by CMake add_subdirectory](#linking-by-cmake-add_subdirectory)  

**VSCode Integration**  

╰➤[VSCode Intellisense configuration](#vscode-intellisense-configuration)  
╰➤[VSCode Tasks and Keybindings](#vscode-tasks-and-keybindings)  
╰➤[Recomended VSCode Extensions I am using](#recomended-vscode-extensions-i-am-using)  

**Maintenance**  
╰➤[Installers](#installers)  
╰➤[Renamer](#renamer)  
╰➤[Upgrader](#upgrader)  
╰➤[Activities log](#activities-log)  

**Sharing the Template or Your Own Project**  
╰➤[How To](#how-to)  
╰➤[Start Automatic Sync Free Clone of Clone](#start-automatic-sync-free-clone-of-clone)  
╰➤[Stop Automatic Sync Free Clone of Clone](#stop-automatic-sync-free-clone-of-clone)  

**Greetings**  
╰➤[Thanks](#thanks)  

[👆🏻](#index)
---

## **Template Editions**  

### 🚀 Free Edition

The free edition of the project template is available in all my public repositories on GitHub. The free edition contains essentially the complete application or library source code, but lacks the actual tools for working with the code. It essentially lacks the exposed interactive components that are only available in the private version and are used in conjunction with the VSCode editor. D🌀tNameCpp is therefore not just a project template, as it might appear at first glance, but rather my comprehensive development solution. Through a sophisticated approach and thoughtful configuration setup, it also handles processes for configuration, compilation, debugging, and other code development tasks.

> Free Edition contain

- Develop on **Linux**, **MacOS**, and **Windows**
- Template utilizes a **Standalone** & **Library** structure
- Integrates [**Conan 2**](https://conan.io/center) with a ready-to-use `conanfile.py`
- [**Emscripten**](https://emscripten.org/index.html#) compatible configuration for run code on **html5**/**wasm**
- Includes [CPM.cmake](https://github.com/cpm-cmake/CPM.cmake) and [CPM.license](https://github.com/cpm-cmake/CPMLicenses.cmake)
- Integrates [**cxxopts**](https://github.com/jarro2783/cxxopts/tree/v3.2.1) ([cxxopts wiki](https://github.com/jarro2783/cxxopts/wiki))
- Provides Helper Classes
- Includes predefined GitHub [Actions](https://docs.github.com/en/actions)
- Supports command-line-based builds

### 🛸 Private Edition for Contributors

- Provides everything else - as an extension for VSCode and more

### Contributors - Sponsors  

Please consider contributing via [PayPal 💶](https://paypal.me/TomasMark) or by sponsoring me directly on GitHub to support future development. Once you have made your contribution, kindly contact me at [tomas@digitalspace.name](mailto:tomas@digitalspace.name) so that I can grant you access to the full version of the D🌀tNameCpp repository.

Thank you in advance.

[👆🏻](#index)
---

## Ready to go

### Used 3rd parties

- [git](https://git-scm.com)
- [conan 2](https://conan.io/center) - [hub](https://conan.io/center)
- [emscripten](https://emscripten.org/) - [doc](https://emscripten.org/docs/index.html)
- [make](https://www.gnu.org/software/make/)
- [ninja](https://ninja-build.org)
- [cmake](https://cmake.org/download/) - [doc 3.31.X](https://cmake.org/cmake/help/v3.31/)
- [ccache](https://ccache.dev/download.html)
- [vscode](https://code.visualstudio.com/download) with C++ [extension](https://marketplace.visualstudio.com/vscode)
- [pyenv](https://github.com/pyenv/pyenv)
  - [python 3](https://www.python.org)
    - [pip](https://pypi.org/project/pip/) - [hub](https://pypi.org)
      - [clang-tidy](https://clang.llvm.org/extra/clang-tidy/)
      - [clang-format](https://clang.llvm.org/docs/ClangFormat.html) >= 19.1.0
      - [clanf-format configurator](https://clang-format-configurator.site)
      - [clang-format style options](https://releases.llvm.org/19.1.0/tools/clang/docs/ClangFormatStyleOptions.html)
      - [cmake-format](https://cmake-format.readthedocs.io/en/latest/)
- [doxygen](https://www.doxygen.nl)

#### Compilers

- [mingw](https://www.mingw-w64.org)
- [llvm](https://llvm.org)
- [clang](https://clang.llvm.org)
- [gcc](https://gcc.gnu.org)
- [msvc](https://visualstudio.microsoft.com/vs/features/cplusplus/)
- [intel C++ compiler](https://software.intel.com/content/www/us/en/develop/tools/oneapi/components/dpc-compiler.html)

#### Crosstools

- [crosstool-ng](https://crosstool-ng.github.io)

### Not-Used 3rd parties
- [vcpkg](https://vcpkg.io/en/)
- [gcovr](https://gcovr.com/en/stable/)

### Clone to local development

```bash
git clone https://github.com/tomasmark79/DotNameCppFree.git ./
git clone git@github.com:tomasmark79/DotNameCppFree.git ./
```

### Using Github Codespace

  Open directly in a GitHub Codespace and start working immediately in the web-based VSCode.

  First time before build, install dependencies in the Web Based environment.
  
  ```bash
  pip install conan ccache
  ```
  and or 

  ```bash
  ./build_default_debug.sh
  ```

[👆🏻](#index)
---

## Helper Classes

### AssetContext Class

To ensure proper access to the **assets** folder, the solution relies on the CMake configurator. During project configuration, it generates and sets the preprocessor definition **#define UTILS_ASSET_PATH ""** to point to the current **assets** folder. Behind the scenes, certain adjustments are made to guarantee that the folder remains accessible, regardless of whether the project is being debugged or deployed to a production Linux environment. Minor modifications might be required for other platforms, but perhaps not. In the Standalone section, **constexpr std::string_view utilsAssetPath** is finalized and passed to the library via a constructor, where the **AssetContext** class awaits this string. The **AssetContext** class later enables access to the **assets** folder path from anywhere within the library part project.

### CustomStrings NameSpace

The template works with an external **customstrings.json** file, which can contain declared text strings and their foreign language variants. For simplicity, a simple parsing implementation is defined, and the example in **DotNameUtils::JsonUtils::getCustomStringSign ()** method shows how to work with accessing the content.

### Logger Class

The Logger ensures output to the console. It supports **iostream** streams, **fmt**, and constructor-based calls. The output is sent to **cout** or **cerr**, depending on the set level. To finalize the log entry, the string must be terminated with **std::endl**. The Name, Time, Caller, and Level fields in the header can each be disabled individually by calling *LOG.showHeaderTime(false, ...)*, etc. Refer to the Logger class declaration for a detailed understanding of the intended behavior.

### Google Tests integration

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
- `ENABLE_EMSCRIPTEN_PTHREAD` : Enable pthread for emscripten.

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

Example of my own **task.json** on my fedora system:
```json
{
            /* ARCH ITEMS */
            "id": "buildArch",
            "type": "pickString",
            "description": "Select target architecture",
            "options": [
                "default",
                "default-gcc",
                "default-clang",
                "emscripten",
                "x86_64-w64-mingw32",
                "rpi4_glibc2.17_gcc10.5",
                "rpi4_glibc2.36_gcc12.4",
                "rpi4_glibc2.41_gcc14.2",
                "fedora_glibc2.17_gcc10.5",
                "fedora_glibc2.36_gcc12.4",
                "fedora_glibc2.41_gcc14.2"
            ],
            "default": "default"
        }
```

>💡 Building with **Emscripten** is managed by the CMake module `tmplt-emscripten.cmake`. The module includes additional switches to user handle the activation of necessary linkages, such as for the raylib or SDL2 framework, etc. To connect the file system in the Emscripten environment, the following argument is used: `--preload-file ../../../../assets@share/${target}/assets`. Path may be changed by argument passed to emscripten function.
   
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

## VSCode Intellisense configuration

Intellisense in VSCode is supported through the C++ extension by creators and is one of the most resource-intensive tasks happening in the background during development, aside from compiling. Proper configuration is crucial to prevent prolonged CPU core overload caused by endless database building for Intellisense features.

The template already includes the best default settings in the **c_cpp_settings.json** file.

> 💡 If you want to direct Intellisense to sources provided by CPM and/or Conan, adjust the settings and uncomment the required paths.

> 💡 Be aware that If your Conan cache contains a large number of packages, the Intellisense database may take up to 30 minutes to build.

```json
            "includePath": [
                "${workspaceFolder}/**",
                "/home/tomas/.cache/CPM/cxxopts/**",
                "/home/tomas/.cache/CPM/fmt*/**",
                "/home/tomas/.conan2/p/b/imgui*/**",
                "/home/tomas/.conan2/p/glm*/**",
                "/home/tomas/.conan2/p/nlohm*/**"
            ],
```

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
- 📐 clang-format : **Ctrl+Alt+F** *(.clang-format)*
- 📏 cmake-format : **Ctrl+Alt+M** *(.cmake-format)*  
- ⚔️ Conan create library recipe  
- 📊 Conan dependencies in graph.html  
- 📖 Doxygen documentation  


**Other shortcuts**  
- Launch Standalone Emscripten (emrun Target.html) : **Ctrl+Alt+E**
- **F8** or **Shift+F8** jumps to the next or previous error  

## Recomended VSCode Extensions I am using

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

[👆🏻](#index)
---

## Maintenance

### Installers  

Linux installer scripts are using for some tools [setup-cpp](https://github.com/aminya/setup-cpp):

```bash
curl -sSL https://raw.githubusercontent.com/tomasmark79/DotNameCppFree/main/.init/initializers/DebianBasedInstaller.sh | bash
curl -sSL https://raw.githubusercontent.com/tomasmark79/DotNameCppFree/main/.init/initializers/FedoraInstaller.sh | bash
```

Windows OS installers are using Powershell (no pyenv, no setup-cpp):

```powershell
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/tomasmark79/DotNameCppFree/main/.init/initializers/WindowsInstaller.ps1' -OutFile 'WindowsInstaller.ps1'; Set-ExecutionPolicy Bypass -Scope Process -Force; .\WindowsInstaller.ps1"
```

## Template Maintenance

### Renamer

Renaming the Standalone and Library targets, including all necessary strings and classes, is handled by the Python script **SolutionRenamer.py**.

### Upgrader

Updating individual files from the remote repository with the option to back up updated components is handled by the Python script **SolutionUpgrader.py**.

### Activities log

Workflow activities related to the project did by workflow are logged in the file **Solution.log**.

[👆🏻](#index)
---

## Sharing the Template or Your Own Project

### How To
For contributors, we offer the option to share your own source code project in a lightweight form. This means without the additional features included in the private edition of the template. I created this option to share source code with the world while keeping the contributors' edition private. The private edition of the template should be earned by those interested. Therefore, if you wish to share the private edition, please do so only within a limited circle. Thank you.

So how does it work? It's simple.

When you clone the full private template, it includes git script hooks that allow you to call special commands to create a clone of the clone with the suffix **"Free"**. For example, a repository named **"MyProject"** will become **"MyProjectFree"** and will be automatically kept up to date. This is managed using the commands listed below.

#### Start Automatic Sync Free Clone of Clone

1. Run `MakeFreeClone.sh init` to set up git hooks.

```bash
.init/initializers/MakeFreeClone.sh init
```

2. Hooks will automatically sync local and remote free repositories during **commit** and **push** operations.

3. Commits will update **README.md** to add "Free" to relevant strings.

4. Customize exclusions with **--exclude='fileOrFolderEtc** in the **.init/initializers/MakeFreeClone.sh**.

> Since May 29, 2025, individual commit messages are also copied to the free repositories.

#### Stop Automatic Sync Free Clone of Clone

We delete the hooks in particular template.

```bash
rm .git/hooks/pre-push
rm .git/hooks/post-commit
```

[👆🏻](#index)
---

## A Deeper Dive into the Theory of This Project 💎✨

**Why use this instead of the official CMake extensions for VSCode?**  
That's a great question! While the official extensions are useful, they often fall short when it comes to more complex tasks like cross-compiling. For example, building an application for an **x86** architecture while targeting **ARM64** requires more than just basic configuration. You need to provide a toolchain, a minimal system file tree (sysroot), and integrate everything into a cohesive workflow. This solution simplifies that process by handling the integration for you. 😎 - All you need to do is supply the toolchain and sysroot, and this template is ready to build applications for other platforms with minimal effort.  

**What additional value does this project bring?**  
There’s quite a lot. Perhaps the biggest advantage is freedom. By leveraging the VSCode editor and its integration capabilities, such as extensions and tasks, this solution transforms into a fully-fledged development IDE with its own graphical user interface. Thanks to the sophisticated connection between VSCode tasks and Python scripts, I was able to build my own comprehensive development center. It’s true—everything is ready and functional. Of course, there’s always room for improvement, but essentially, this is a complete solution for modern software development at minimal cost.  

**What Does the Future Hold?**  
The future is always uncertain; however, the plan is to gradually expand this solution. If anyone wishes to get involved, their help will be more than welcome.  

emscripten support - ✔️ already added

## Thanks

**To everyone** who supported me in creating this template.  

🩵🩵🩵 Thank you very much! 🩵🩵🩵

## License

MIT License  
Copyright (c) 2024-2025 Tomáš Mark

## Disclaimer

This template is provided "as is," without any guarantees regarding its functionality.

[👆🏻](#index)
---