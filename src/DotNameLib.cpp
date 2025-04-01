// MIT License
// Copyright (c) 2024-2025 Tomáš Mark

#include <DotNameLib/DotNameLib.hpp>
#include <DotNameLib/version.h>
#include <Logger/Logger.hpp>
#include <Utils/Utils.hpp>

namespace library {

  DotNameLib::DotNameLib (const std::filesystem::path &assetsPath) : assetsPath_ (assetsPath) {
    LOG_INFO ("DotNameLib v." + std::string (DOTNAMELIB_VERSION) + " constructed.");
    LOG_DEBUG ("Assets Path: " + assetsPath_.string ());
  }
  DotNameLib::DotNameLib (const std::string &assetsPath)
      : DotNameLib (std::filesystem::path (assetsPath)) { // Delegate to Main constructor
  }
  DotNameLib::~DotNameLib () { LOG_INFO ("DotNameLib deconstructed."); }

} // namespace library