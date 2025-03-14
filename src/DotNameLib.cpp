// MIT License
// Copyright (c) 2024-2025 Tomáš Mark

#include <DotNameLib/DotNameLib.hpp>
#include <DotNameLib/version.h>
#include <Logger/Logger.hpp>
#include <Utils/Utils.hpp>

namespace library {

DotNameLib::DotNameLib(const std::string &assetsPath) {
  LOG.important("DotNameLib v." + std::string(DOTNAMELIB_VERSION) + " constructed.");
  LOG.debug("Assets Path: " + assetsPath);
}

DotNameLib::~DotNameLib() { LOG.debug("DotNameLib deconstructed."); }

} // namespace library