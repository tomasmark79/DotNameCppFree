// MIT License
// Copyright (c) 2024-2025 Tomáš Mark

#include <DotNameLib/DotNameLib.hpp>
#include <Assets/AssetContext.hpp>
#include <Logger/Logger.hpp>
#include <Utils/Utils.hpp>

#if defined(PLATFORM_WEB)
  #include <emscripten/emscripten.h>
#endif

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
      try {
        using namespace DotNameUtils::JsonUtils;
        auto customStrings = loadFromFile (AssetContext::getAssetsPath () / "customstrings.json");
        auto authorEn = getLocalizedString (customStrings, "Author", "en");
        auto authorCs = getLocalizedString (customStrings, "Author", "cs");
        auto email = getUrl (customStrings, "Email");
        auto phone = getTel (customStrings, "Phone");
        auto website = getUrl (customStrings, "Website");

        if (email)
          LOG_I_STREAM << "Email: " << *email << std::endl;
        if (phone)
          LOG_I_STREAM << "Phone: " << *phone << std::endl;
        if (website)
          LOG_I_STREAM << "Website: " << *website << std::endl;

      } catch (const std::exception& e) {
        LOG_E_STREAM << "Failed to load custom strings: " << e.what () << std::endl;
        throw std::runtime_error ("Failed to load custom strings: " + std::string (e.what ()));
      }
    }
  }

  DotNameLib::~DotNameLib () {
    LOG_D_STREAM << libName_ << " ... destructed" << std::endl;
  }

} // namespace dotname