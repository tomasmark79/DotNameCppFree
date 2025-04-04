// MIT License
// Copyright (c) 2024-2025 Tomáš Mark

#include <DotNameLib/DotNameLib.hpp>
#include <Logger/Logger.hpp>
#include <Utils/Utils.hpp>

namespace dotname {

  DotNameLib::DotNameLib () {
    LOG_D_STREAM << libName_ << " ...constructed" << std::endl;
  }
  DotNameLib::DotNameLib (const std::filesystem::path& assetsPath) : DotNameLib () {
    assetsPath_ = assetsPath;
    if (!assetsPath_.empty ()) {
      LOG_D_STREAM << "Assets path: " << assetsPath_ << std::endl;
    } else {
      LOG_D_STREAM << "Assets path is empty" << std::endl;
    }
  }
  DotNameLib::~DotNameLib () {
    LOG_D_STREAM << libName_ << " ...destructed" << std::endl;
  }

} // namespace dotname