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

constexpr char standaloneName[] = "DotNameStandalone";

const std::filesystem::path executablePath = Utils::FSManager::getExecutePath ();
const std::filesystem::path assetsPath
    = executablePath / static_cast<std::string> (UTILS_ASSET_PATH);
const std::filesystem::path assetsPathFirstFile
    = assetsPath / static_cast<std::string> (UTILS_FIRST_ASSET_FILE);

void processFile (const std::filesystem::path &filePath) {
  try {
    if (std::ifstream file (filePath); file.is_open ()) {
      LOG_D << "File content: " << Utils::FSManager::read (filePath) << std::endl;
    } else {
      LOG_E << "Failed to open file: " << filePath << std::endl;
    }
  } catch (const std::exception &e) {
    LOG_E << "Exception while processing file: " << e.what () << std::endl;
  }
}

int processArguments (int argc, const char *argv[]) {
  try {
    auto options = std::make_unique<cxxopts::Options> (argv[0], standaloneName);
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
      LOG.enableFileLogging (std::string (standaloneName) + ".log");
      LOG_I << "Logging to file enabled [-l]" << std::endl;
    }

    options->allow_unrecognised_options ();
    if (!result.count ("omit")) {
      std::unique_ptr<library::DotNameLib> lib = std::make_unique<library::DotNameLib> (assetsPath);
    } else {
      LOG_W << "Loading library omitted [-o]" << std::endl;
    }

    if (!result.unmatched ().empty ()) {
      for (const auto &arg : result.unmatched ()) {
        LOG_W << "Unrecognized option: " << arg << std::endl;
      }
    }

  } catch (const cxxopts::exceptions::exception &e) {
    LOG_C << "error parsing options: " << e.what ();
    return 1;
  }
  return 0;
}

int main (int argc, const char *argv[]) {

  LOG_I << standaloneName << " / C++ = " << __cplusplus << std::endl;
  LOG_D << "executablePath = " << executablePath << std::endl;

  processFile (assetsPathFirstFile);
  processArguments (argc, argv);

  return 0;
}