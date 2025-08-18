"""
CMake file patching utilities.
"""
import re
from pathlib import Path


class CMakePatches:
    """Handles various CMake file patches and fixes"""
    
    def __init__(self, conan_instance):
        self.conan = conan_instance
    
    def remove_stdcpp_from_system_libs(self):
        """
        Remove stdc++ from SYSTEM_LIBS in generated Conan CMake files
        
        This fixes linking issues that can occur when stdc++ is automatically
        added to system libraries by Conan generators.
        """
        generators_path = Path(getattr(self.conan, 'generators_folder', None) or ".")
        
        cmake_files = self._find_cmake_data_files(generators_path)
        
        if not cmake_files:
            self.conan.output.info("No CMake data files found to patch")
            return
            
        patched_count = self._patch_files(cmake_files)
        
        if patched_count > 0:
            self.conan.output.info(f"Successfully patched {patched_count} CMake files")
    
    def _find_cmake_data_files(self, generators_path):
        """Find all *-data.cmake files"""
        cmake_files = list(generators_path.glob("*-data.cmake"))
        cmake_files.extend(generators_path.glob("*-*-*-data.cmake"))
        return list(set(cmake_files))  # Remove duplicates
    
    def _patch_files(self, cmake_files):
        """Patch the found CMake files to remove stdc++"""
        # Compile regex pattern once for better performance
        # This pattern matches SYSTEM_LIBS variables and removes stdc++ from them
        system_libs_pattern = re.compile(
            r'(set\([^_]*_SYSTEM_LIBS(?:_[A-Z]+)?\s+[^)]*?)'
            r'stdc\+\+([^)]*\))', 
            re.MULTILINE
        )
        
        patched_count = 0
        for cmake_file in cmake_files:
            try:
                content = cmake_file.read_text(encoding='utf-8')
                
                # Replace all occurrences of stdc++ in SYSTEM_LIBS
                modified_content = system_libs_pattern.sub(r'\1\2', content)
                
                if modified_content != content:
                    cmake_file.write_text(modified_content, encoding='utf-8')
                    self.conan.output.info(f"Patched {cmake_file.name} - removed stdc++ from SYSTEM_LIBS")
                    patched_count += 1
                    
            except (IOError, OSError) as e:
                self.conan.output.warn(f"Could not patch {cmake_file}: {e}")
        
        return patched_count
