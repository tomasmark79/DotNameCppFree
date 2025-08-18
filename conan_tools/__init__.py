"""
Conan tools package for DotName project utilities.
"""

from .cmake_presets import CMakePresetsManager
from .cmake_patches import CMakePatches

__all__ = ['CMakePresetsManager', 'CMakePatches']
