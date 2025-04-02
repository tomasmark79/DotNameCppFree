// MIT License
// Copyright (c) 2024-2025 Tomáš Mark

#include <DotNameLib/DotNameLib.hpp>
#include <Logger/Logger.hpp>
#include <Utils/Utils.hpp>

namespace dotname {

  DotNameLib::DotNameLib () {
    LOG_D << libName << " ...constructed" << std::endl;
    if (!assetsPath_.empty ()) {
      LOG_D << "Assets path: " << assetsPath_ << std::endl;
    } else {
      LOG_D << "Assets path is empty" << std::endl;
    }
  }
  DotNameLib::DotNameLib (const std::filesystem::path& assetsPath)
      : DotNameLib () {
    assetsPath_ = assetsPath;
  }
  DotNameLib::~DotNameLib () {
    LOG_D_DESTRUCTOR(DotNameLib) << libName << " ...destructed" << std::endl;
  }

} // namespace dotname