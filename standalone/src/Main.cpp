// MIT License
// Copyright (c) 2024-2025 Tomáš Mark

#include "DotNameLib/DotNameLib.hpp"
#include "Logger/Logger.hpp"
#include "Utils/Utils.hpp"

#include <cxxopts.hpp>
#include <filesystem>
#include <fstream>
#include <iostream>
#include <memory>
#include <string>
#include <vector>

namespace Config {
  constexpr char standaloneName[] = "DotNameStandalone";
  const std::filesystem::path executablePath = Utils::FSManager::getExecutePath ();
  constexpr std::string_view utilsAssetPath = UTILS_ASSET_PATH;
  constexpr std::string_view utilsFirstAssetFile = UTILS_FIRST_ASSET_FILE;
  const std::filesystem::path assetsPath = executablePath / utilsAssetPath;
  const std::filesystem::path assetsPathFirstFile = assetsPath / utilsFirstAssetFile;
}

void processFile (const std::filesystem::path &filePath) {
  try {
    LOG_D << "File content: " << Utils::FSManager::read (filePath) << std::endl;
  } catch (const std::exception &e) {
    LOG_E << "Exception while processing file: " << e.what () << " [File: " << filePath << "]"
          << std::endl;
  } catch (...) {
    LOG_E << "Unknown error occurred while processing file: " << filePath << std::endl;
  }
}

int processArguments (int argc, const char *argv[]) {
  try {
    auto options = std::make_unique<cxxopts::Options> (argv[0], Config::standaloneName);
    options->positional_help ("[optional args]").show_positional_help ();
    options->set_width (70);
    options->set_tab_expansion ();
    options->add_options () ("h,help", "Show help");
    options->add_options () ("o,omit", "Omit library loading",
                             cxxopts::value<bool> ()->default_value ("false"));
    options->add_options () ("l,log2file", "Log to file",
                             cxxopts::value<bool> ()->default_value ("false"));
    const auto result = options->parse (argc, argv);

    if (result.count ("help")) {
      LOG_I << options->help ({ "", "Group" }) << std::endl;
      return 0;
    }

    if (result["log2file"].as<bool> ()) {
      LOG.enableFileLogging (std::string (Config::standaloneName) + ".log");
      LOG_I << "Logging to file enabled [-l]" << std::endl;
    }

    if (!result.count ("omit")) {
      // Load the library
      std::unique_ptr<library::DotNameLib> lib
          = std::make_unique<library::DotNameLib> (Config::assetsPath);
    } else {
      LOG_W << "Loading library omitted [-o]" << std::endl;
    }

    if (!result.unmatched ().empty ()) {
      for (const auto &arg : result.unmatched ()) {
        LOG_W << "Unrecognized option: " << arg << std::endl;
      }
      LOG_I << options->help () << std::endl;
      return 1;
    }

  } catch (const cxxopts::exceptions::exception &e) {
    LOG_E << "error parsing options: " << e.what () << std::endl;
    return 1;
  }
  return 0;
}

int main (int argc, const char *argv[]) {

  LOG_I << Config::standaloneName << " / C++ = " << __cplusplus << std::endl;
  LOG_D << "executablePath = " << Config::executablePath << std::endl;

  int result = processArguments (argc, argv);
  if (result != 0) {
    return result;
  }

  processFile (Config::assetsPathFirstFile); // test open asset template

  return 0;
}