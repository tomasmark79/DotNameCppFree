<img src="assets/logo.png" alt="DotNameCppFree Logo" width="20%">

[![Linux](https://github.com/tomasmark79/DotNameCppFree/actions/workflows/linux.yml/badge.svg)](https://github.com/tomasmark79/DotNameCppFree/actions/workflows/linux.yml)
[![MacOS](https://github.com/tomasmark79/DotNameCppFree/actions/workflows/macos.yml/badge.svg)](https://github.com/tomasmark79/DotNameCppFree/actions/workflows/macos.yml)
[![Windows](https://github.com/tomasmark79/DotNameCppFree/actions/workflows/windows.yml/badge.svg)](https://github.com/tomasmark79/DotNameCppFree/actions/workflows/windows.yml)  

# DotName C++ Template

# Index

[Overview](#overview)  
[🚀 Key Features in **Free** Template ](#free--key-features)  
[🛸 Key Features in **Pro** Template](#pro--key-features)  
[**Get Pro**](#get-pro)  
[Using Github Codespace](#using-github-codespace)  
[References Used](#references-used)  

[Get & Prepare Template - classic way](#by-classic-way)  
[Get & Prepare Template - by curl](#by-curl)
[Get & Prepare Template - by wget](#by-wget)

[CMake and Conan 2](#cmake-and-conan-2)  
[Building using commands](#building-using-commands)  
[Template Structure](#template-structure)  
[Standalone Source](#standalone-source)  
[Library Source](#library-source)  
[VSCode WorkFlow Tuning - Keybindings](#keybindings)  
[VSCode WorkFlow Tuning - Automatic Tasks](#automatic-tasks)  
[CMake Options](#cmake-options)  
[Automatic Installers](#automatic-installers)
[Template Maintenance - Renamer](#solution-renamer)  
[Template Maintenance - Upgrader](#solution-upgrader)  
[Create Lightweight Clone](#create-lightweight-clone)  
[Cross-Compilation by Conan profiles](#cross-compilation-by-conan-profiles)  
[**FAQ**](#faq)  
[Thanks](#thanks)  

## Overview

DotName C++ Template is a comprehensive, modern C++ project template designed for cross-platform development in Visual Studio Code. The template provides a robust foundation for both standalone executables and libraries, incorporating industry best practices and modern build tools.

In the Free 🚀 Edition Template, the framework provides comprehensive, essential C++ source code and configuration settings to ensure a successful project build.

In the Pro 🛸 Edition Template, you gain significantly expanded development features, advanced automation capabilities, and enhanced overall usability for a more comfortable and efficient development experience.

[👆🏻](#index)

## Free 🚀 Key Features

- Works in **Linux**, **MacOS**, **Windows**
- Modern projects design **Standalone** & **Library**
  - With integrated wrappers [**CPM.cmake**](https://github.com/cpm-cmake/CPM.cmake), [**CPM.license**](https://github.com/cpm-cmake/CPMLicenses.cmake)
  - With integrated basic [**cxxopt**](https://github.com/jarro2783/cxxopts/tree/v3.2.1) ([cxxoptwiki](https://github.com/jarro2783/cxxopts/wiki))
- **Conan 2** ready conanfile.py
- Predefined GitHub [Actions](https://docs.github.com/en/actions) workflows for continuous integration
- Provided basic commands for **installing**, **configuring**, **building**, and **installing** the project via *CLI*.

[👆🏻](#index)

## Pro 🛸 Key Features

- Initializer (Installers) scripts (Debians, Fedoras, Windows)
- Keybindings definitions for implemented [VSCode Tasks](https://code.visualstudio.com/docs/editor/tasks)
- Integrated VSCode WorkFlow via **SolutionController.py**
- Wrapped automatic CMake **Native Build** support with Conan profiles
- Wrapped automatic CMake **Cross Build** support with Conan profiles
- Integrated Template Renamer by **SolutionRenamer.py**
- Integrated Template Upgrader by **SolutionUpgrader.py**
- Integrated Solution.log
- Integrated **Native C++ debugging** in VSCode by Microsoft [C++ extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools)
  - Advanced feature to debug [**CMake configurations**](https://devblogs.microsoft.com/cppblog/introducing-cmake-debugger-in-vs-code-debug-your-cmake-scripts-using-open-source-cmake-debugger/)
- Compatible with [**SSH**](https://code.visualstudio.com/docs/remote/ssh), [**WSL**](https://code.visualstudio.com/docs/remote/wsl) remote development

[👆🏻](#index)

## Get Pro

Contribute [💶](https://paypal.me/TomasMark) to support my further development and contact me by [email](mailto:tomas@digitalspace.name).  
Afterward I will send you full Pro version of the Template 🙂.  
Thanks in advance.

[👆🏻](#index)

## Using Github Codespace

  Github Codespace is suitable for simple use cases that require command-line control of the entire solution workflow. (In Pro 🛸 is existing way to use advanced features)

  Open the template directly in a GitHub Codespace and start working immediately in the web-based VSCode. Simply run "pip install conan" in the terminal to install Conan 2 and then use the "build.sh" script for basic command-line compilation.

[👆🏻](#index)

## References Used

Tools
- [git](https://git-scm.com)
- [curl](https://curl.se) (optional)
- [make](https://www.gnu.org/software/make/) [ninja](https://ninja-build.org)
- [cmake](https://cmake.org/download/)
- [ccache](https://ccache.dev/download.html)
- [vscode](https://code.visualstudio.com/download) with C++ [extension](https://marketplace.visualstudio.com/vscode)
- [pyenv](https://github.com/pyenv/pyenv) (optional) (.python-version)
  - [python 3](https://www.python.org)
    - [pip](https://pypi.org/project/pip/) - [PipHub](https://pypi.org)
      - [clang-tidy](https://clang.llvm.org/extra/clang-tidy/)
      - [clang-format](https://clang.llvm.org/docs/ClangFormat.html) >= 19.1.0
      - [clanf-format configurator](https://clang-format-configurator.site)
      - [clang-format style options](https://releases.llvm.org/19.1.0/tools/clang/docs/ClangFormatStyleOptions.html)
      - [cmake-format](https://cmake-format.readthedocs.io/en/latest/)
    - [conan 2](https://conan.io/center) - [ConanHub](https://conan.io/center)
- [vcpkg](https://vcpkg.io/en/) (not implemented yet)
- [doxygen](https://www.doxygen.nl) (not implemented yet)
- [gcovr](https://gcovr.com/en/stable/) (not implemented yet)

Compilers
- [mingw](https://www.mingw-w64.org)
- [llvm](https://llvm.org)
- [clang](https://clang.llvm.org)
- [gcc](https://gcc.gnu.org)
- [msvc](https://visualstudio.microsoft.com/vs/features/cplusplus/)
- [intel C++ compiler](https://software.intel.com/content/www/us/en/develop/tools/oneapi/components/dpc-compiler.html)

Crosstools
- [crosstool-ng](https://crosstool-ng.github.io)

[👆🏻](#index)

## Get & Prepare Template

#### by classic way

```bash
git clone https://github.com/tomasmark79/DotNameCppFree
cd DotNameCppFree
rm -rf .git
git init -b main
code .

# lightweight clone generation
.init/initializers/MakeFreeClone.sh init
```

#### by curl

```bash
curl -sSL digitalspace.name/cpp.sh | bash
```

#### by wget

```bash
wget -qO- digitalspace.name/cpp.sh | bash
```

[👆🏻](#index)

## CMake and Conan 2

For smooth operation of the template, tools such as CMake and Conan 2 are required—ideally the latest versions. How you install them is entirely up to you.

To create a new profile, use the following command. More details can be found in the [Conan 2 Documentation](https://docs.conan.io/2/).

```bash
conan profile detect --force
```

[👆🏻](#index)

## Building using commands

  Using such long commands is unappealing - they make development a tedious and slow 🦥 process. This template was primarily created for use with 🎢 VSCode, where a workflow using tasks triggered by keyboard 🎯 shortcuts was developed. However, in some scenarios, this manual process might come in handy.

#### Preparing External Dependencies for Your Project

```bash
conan install "." --output-folder="./build/standalone/default/debug" --deployer=full_deploy --build=missing --profile default --settings build_type=Debug
```

#### Configuration

```bash
source "./build/standalone/default/debug/conanbuild.sh" && cmake -S "./standalone" -B "./build/standalone/default/debug" -DCMAKE_TOOLCHAIN_FILE="conan_toolchain.cmake" -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX="./build/installation/default/debug"
```

#### Build target

```bash
source "./build/standalone/default/debug/conanbuild.sh" && cmake --build "./build/standalone/default/debug"  -j 16
```

#### Install target

```bash
source "./build/standalone/default/debug/conanbuild.sh" && cmake --build "./build/standalone/default/debug" --target install -j 16
```

[👆🏻](#index)

## Template Structure

```txt
├── include/
```
- public header files (.hpp) accessible from others

```txt
├── src/
```

- source files (.cpp) and header files (.hpp) that are not intended for public use

```txt
├── standalone/
```
- standalone part of project

```txt
├── assets/
```

All content included in assets folder is accessible via file path by the macro ASSET_PATH. The path to the assets folder is passed to the library through the constructor. ASSET_PATH is generated by CMake.

[👆🏻](#index)

## Standalone Source

#### [**cxxopt**](https://github.com/jarro2783/cxxopts/tree/v3.2.1) enables argument management

  - `-o` omit library
    - loading using just standalone project
  - `-l` log to file
    - implemented logger support log to file as well
  - `-h` show usage

## Library Source

The library is connected to the main Standalone project using the CMake CPM.cmake wrapper in Standalone/CMakeLists.txt

```cmake
CPMAddPackage(NAME DotNameLib SOURCE_DIR ${CMAKE_CURRENT_LIST_DIR}/..)
```

[👆🏻](#index)

## VSCode WorkFlow Tuning

### Keybindings

requiring copy content of keybindings.json to system part of configuration

- `F8` or `Shift+F8` jumps to the next or previous error  
- `Shift+F7`: TASK MENU (standalone, library, both)  
- `F7`: 🔨 Quick build Standalone  
- `F5`: 🪲 Quick debug Standalone  
- `Ctrl+Alt+R`: just Launch Standalone binary  
- `Ctrl+Alt+L`: 🔍 clang-tidy
- `Ctrl+Alt+F`: 📐 clang-format  
- `Ctrl+Alt+M`: 📏 cmake-format 

### Automatic Tasks

By `Shift+F7` invoked **TASK MENU** includes the following automation commands:  

- 🚀 Zero to Build means 🧹 🗡️ 🔧 🔨
- 🦸 Zero to Hero means  🧹 🗡️ 🔧 🔨 📌 🗜️
- 🧹 Clean build directories  
- 🗡️ Dependency installation with Conan 2  
- 🔧 CMake configuration  
- 🪲 CMake configuration with CMake 🦉 debugger  
- 🔨 Build (Re-Build F7)  
- 📜 License collection with CPM for CPM  
- 📌 Install artefacts  
- 🗜️ Release tarballs  
- 🛸 Run CPack  
- ⚔️ Conan create library recipe
- 📊 Conan dependencies in graph.html  
- 🔍 CLang-tidy  
- 📐📏 CLang & CMake formatting  

[👆🏻](#index)

## CMake Options

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

[👆🏻](#index)

### Automatic Installers  

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

included `.clang-format` with these prefered settings

```txt
BasedOnStyle: GNU
BreakBeforeBraces: Allman
ColumnLimit: 79
SortIncludes: Never
BreakAfterReturnType: Automatic
ConstructorInitializerIndentWidth: 2
ContinuationIndentWidth: 2
IndentWidth: 2
NamespaceIndentation: All
```
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

## Cross-Compilation by Conan profiles

Architectures for which you want to use the Conan tool profile can be entered in the field below. They will then appear in the list of architectures in the VSCode menu.

snippet from task.json
```json
{
    "id": "buildArch",
    "type": "pickString",
    "description": "Select target architecture",
    "options": [
        "default", 
        "x86_64-clang-linux-gnu",
        "x86_64-w64-mingw32",
        "aarch64-rpi4-linux-gnu"
    ],
    "default": "default"
}
```

[👆🏻](#index)

## FAQ

**Question**: What scenarios is this template suited for?  
**Answer**: This solution is suitable for a wide range of projects of all sizes. This template was not originally created as a public project but as something I used for my own iterative development of small applications. Over time, I discovered that the benefit of such a template is enormous, provided that it maintains the ability to be flexible and configurable even in more complex projects. For this reason, the template is designed so that it can be adapted to various needs throughout the development cycle. Ultimately, this means that I spent a considerable amount of time seeking a balance between optimization, clarity, and the potential for future code flexibility.

**Question**: What is the recommended procedure for working with the project template?  
**Answer**: I usually start by cloning a fresh copy into my local repository. Then I rename the library and the standalone components as needed and perform the first successful build of the project. Next, I pause at the dependency definitions in the conanfile.py to configure the required packages to be integrated into my project. After that, I move on to both CMakeLists.txt files, where I set additional parameters—such as linking the dependencies provided by Conan and specifying whether they should be private or public. I might also enable static linking in the CMake options before diving into development. I really like using keyboard shortcuts, so I hardly ever need to work with terminal commands. Finally, I build tarballs and upload them to GitHub as binary releases. If needed, I can, for example, build with aarch64 to port my program to devices like the Raspberry Pi with an ARM processor.

[👆🏻](#index)

## Thanks

**To everyone** who supported me in creating this template.  
Thank you very much!  

[👆🏻](#index)

## License

MIT License  
Copyright (c) 2024-2025 Tomáš Mark

[👆🏻](#index)