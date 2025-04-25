// MIT License
// Copyright (c) 2024-2025 Tomáš Mark

#include <DotNameLib/DotNameLib.hpp>
#include <Assets/AssetContext.hpp>
#include <Logger/Logger.hpp>
#include <Utils/Utils.hpp>

namespace dotname {

  DotNameLib::DotNameLib () {
    LOG_D_STREAM << libName_ << " constructed ..." << std::endl;
    AssetContext::clearAssetsPath ();
  }

  DotNameLib::DotNameLib (const std::filesystem::path& assetsPath) : DotNameLib () {
    if (!assetsPath.empty ()) {
      AssetContext::setAssetsPath (assetsPath);
      LOG_D_STREAM << "Assets path given to the library\n"
                   << "╰➤ " << AssetContext::getAssetsPath () << std::endl;
      auto logo = std::ifstream (AssetContext::getAssetsPath () / "logo.png");
    }
  }

  DotNameLib::~DotNameLib () {
    LOG_D_STREAM << libName_ << " ... destructed" << std::endl;
  }

} // namespace dotname