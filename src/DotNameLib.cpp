// MIT License
// Copyright (c) 2024-2025 Tomáš Mark

#include <DotNameLib/DotNameLib.hpp>
#include <DotNameLib/version.h>
#include <Logger/Logger.hpp>
#include <Utils/Utils.hpp>

namespace library {

  DotNameLib::DotNameLib (const std::string &assetsPath) : assetsPath_ (assetsPath) {
    LOG_INFO ("DotNameLib v." + std::string (DOTNAMELIB_VERSION) + " constructed.");
    LOG_DEBUG ("Assets Path: " + this->assetsPath_);
  }

  DotNameLib::~DotNameLib () { LOG_INFO ("DotNameLib deconstructed."); }

} // namespace library