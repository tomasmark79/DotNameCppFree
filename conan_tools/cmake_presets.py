"""
CMake presets management utilities.
"""
import os
import json


class CMakePresetsManager:
    """Manages CMake presets updates and customizations"""
    
    def __init__(self, conan_instance):
        """Initialize with Conan instance for access to settings and output"""
        self.conan = conan_instance
    
    def update_presets(self, preset_file="CMakePresets.json"):
        """
        Dynamic change of names in CMakePresets.json to avoid name conflicts
        
        This method generates unique preset names based on current Conan settings
        to prevent conflicts when using multiple build configurations.
        
        Args:
            preset_file: Path to the CMakePresets.json file
        """
        if not os.path.exists(preset_file):
            return
            
        try:
            # Read existing presets
            with open(preset_file, "r", encoding="utf-8") as f:
                data = json.load(f)
                
            # Generate unique preset name based on current settings
            preset_name = self._generate_preset_name()
            
            # Update all preset types with the new name
            self._update_all_presets(data, preset_name)
                        
            # Write updated presets back to file
            with open(preset_file, "w", encoding="utf-8") as f:
                json.dump(data, f, indent=4)
                
            self.conan.output.info(f"Updated CMake presets with name: {preset_name}")
                
        except (json.JSONDecodeError, IOError) as e:
            self.conan.output.warn(f"Failed to update CMake presets: {e}")
    
    def _generate_preset_name(self):
        """Generate preset name based on Conan settings"""
        # Create descriptive name: buildtype-os-arch-compiler-version
        return (f"{str(self.conan.settings.build_type).lower()}-"
               f"{str(self.conan.settings.os).lower()}-"
               f"{self.conan.settings.arch}-"
               f"{str(self.conan.settings.compiler)}-"
               f"{self.conan.settings.compiler.version}")
    
    def _update_all_presets(self, data, preset_name):
        """Update all preset types with the new name"""
        # Process each preset type (configure, build, test)
        for preset_type in ["configurePresets", "buildPresets", "testPresets"]:
            for preset in data.get(preset_type, []):
                # Update name and display name
                preset["name"] = preset_name
                if "displayName" in preset:
                    preset["displayName"] = preset_name
                # Update reference to configure preset for build/test presets
                if "configurePreset" in preset:
                    preset["configurePreset"] = preset_name
