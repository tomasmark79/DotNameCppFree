# DO NOT use Conan cmake_layout(self) HERE!
# This template uses custom layout to define build output structure.
import os
import json
from conan import ConanFile
from conan.tools.cmake import CMakeToolchain, CMakeDeps
from conan.tools.files import copy
from conan.tools.system import package_manager

# Template Configuration Notes:
# ----------------------------------------------------------
# 1. Change 'name' to match your project
# 2. Update requirements() with your actual dependencies  
# 3. Uncomment system_requirements() if you need system packages
# 4. Consider adding validation for critical settings
# 5. This template avoids cmake_layout() for custom build structure
# ----------------------------------------------------------

# Optional: Import utility classes if available
try:
    from conan_tools import CMakePresetsManager, CMakePatches
    UTILITIES_AVAILABLE = True
except ImportError:
    UTILITIES_AVAILABLE = False

class ProjectTemplateRecipe(ConanFile):
    """
    Conan recipe template for C++ projects.
    
    Features:
    - Custom build layout (no cmake_layout)
    - CMake presets integration
    - Cross-platform support
                    
            except (IOError, OSError) as e:
                self.conan.output.warn(f"Could not patch {cmake_file}: {e}")
        
        return patched_count

    - Optional utility functions for common fixes
    """
    name = "DotNameLib"
    version = "1.0.0"
    description = "Template library for C++ projects"
    topics = ("cpp", "template", "cmake")
    url = "https://github.com/youruser/yourproject"
    license = "MIT"
    
    exports_sources = "patches/*", "include/*", "src/*", "CMakeLists.txt"
    settings = "os", "compiler", "build_type", "arch"
    generators = "CMakeDeps"
    
    options = {"fPIC": [True, False]}
    default_options = {"fPIC": True}

    def imports(self):
        """Import licenses from dependencies"""
        self.copy("license*", dst="licenses", folder=True, ignore_case=True)

    def generate(self):
        """Generate CMake files and apply customizations"""
        # Generate CMake toolchain
        tc = CMakeToolchain(self)
        tc.variables["CMAKE_BUILD_TYPE"] = str(self.settings.build_type)
        # BUILD_SHARED_LIBS is controlled by CMake configuration
        tc.generate()

        # Apply utility functions if available
        if UTILITIES_AVAILABLE:
            self._apply_cmake_utilities()
        else:
            self.output.info("Utility functions not available - skipping custom fixes")
            
        # Copy additional files (example for ImGui bindings)
        self._copy_additional_files()
        
    def _apply_cmake_utilities(self):
        """Apply utility functions for CMake customization"""
        presets_manager = CMakePresetsManager(self)
        presets_manager.update_presets()
        
        cmake_patches = CMakePatches(self)
        cmake_patches.remove_stdcpp_from_system_libs()
        
    def _copy_additional_files(self):
        """Copy additional files from dependencies (customize as needed)"""
        # Example: Copy ImGui bindings
        # if "imgui" in self.deps_cpp_info.deps:
        #     copy(self, "*opengl3*", 
        #          os.path.join(self.dependencies["imgui"].package_folder, "res", "bindings"), 
        #          os.path.join(self.source_folder, "src/bindings"))
        #     copy(self, "*sdl2*", 
        #          os.path.join(self.dependencies["imgui"].package_folder, "res", "bindings"), 
        #          os.path.join(self.source_folder, "src/bindings"))
        pass
        
    def configure(self):
        """Configure options and settings"""
        # Force static libraries for all dependencies
        self.options["*"].shared = False
       
        # Platform-specific configurations (examples)
        if self.settings.os == "Windows" and self.settings.compiler == "gcc":
            # Example: Configure freetype for MinGW
            # self.options["freetype"].with_png = False
            # self.options["freetype"].with_brotli = False
            # self.options["freetype"].with_zlib = False
            # self.options["freetype"].with_bzip2 = False
            pass

    def requirements(self):
        """Define project dependencies"""
        # Core dependencies - customize for your project
        self.requires("fmt/[~11.2]")                    # Formatting library
        self.requires("nlohmann_json/[~3.12]")          # JSON library
        
        # Testing framework (uncomment if needed)
        # self.requires("gtest/1.16.0")                 # Google Test
        
        # Additional common dependencies (uncomment as needed)
        # self.requires("spdlog/[~1.12]")               # Logging library
        # self.requires("zlib/[~1.3]")                  # Compression library
        # self.requires("yaml-cpp/0.8.0")               # YAML parsing
        # self.requires("boost/[~1.82]")                # Boost libraries
        
        # GUI/Graphics libraries
        # self.requires("imgui/1.92.0")                 # Dear ImGui
        # self.requires("glm/1.0.1")                    # Math library
        
        # Platform-specific dependencies
        if self.settings.os != "Emscripten":
            # SDL dependencies (uncomment if needed)
            # self.requires("sdl/2.32.2", override=True)   # Latest stable SDL
            # self.requires("sdl_image/2.8.2")
            # self.requires("sdl_ttf/2.24.0") 
            # self.requires("sdl_mixer/2.8.0")
            # self.requires("sdl_net/2.2.0")
            
            # Windows MinGW specific
            if self.settings.os == "Windows" and self.settings.compiler == "gcc":
                # self.requires("glew/2.2.0")
                pass

        # ARM-specific requirements
        if self.settings.arch == "armv8":
            # Specific versions to avoid build errors
            # self.requires("libunwind/1.7.0", override=True)  # 1.8.0 has __asm__ errors
            # self.requires("libffi/3.4.8", override=True)     # Foreign Function Interface
            pass

    def build_requirements(self):
        """Define build-time dependencies (optional)"""
        # Build tools (uncomment if needed)
        # self.tool_requires("cmake/[>=3.15]")          # Minimum CMake version
        # self.tool_requires("ninja/[>=1.10]")          # Ninja build system
        pass

    def system_requirements(self):
        """Install system packages (optional)"""
        # System package manager integration
        # apt = package_manager.Apt(self)
        # apt.install(["libsdl2-dev", "libgl1-mesa-dev"])
        
        # dnf = package_manager.Dnf(self)  
        # dnf.install(["SDL2-devel", "mesa-libGL-devel"])
        
        # pacman = package_manager.PacMan(self)
        # pacman.install(["sdl2", "mesa"])
        pass
        
    def validate(self):
        """Validate configuration (optional)"""
        # Add validation logic here
        # Example: Check for incompatible settings
        # if self.settings.os == "Windows" and self.settings.compiler.libcxx == "libstdc++11":
        #     raise ConanInvalidConfiguration("libstdc++11 not supported on Windows")
        pass