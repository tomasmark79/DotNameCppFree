// MIT License
// Copyright (c) 2024-2025 Tomáš Mark

#include <DotNameLib/DotNameLib.hpp>
#include <DotNameLib/version.h>
#include <Logger/Logger.hpp>
#include <Utils/Utils.hpp>

namespace library {

DotNameLib::DotNameLib(const std::string &assetsPath)
    : m_assetsPath(assetsPath) {
  LOG_IMPORTANT("DotNameLib v." + std::string(DOTNAMELIB_VERSION) +
                " constructed.");
  LOG_DEBUG("Assets Path: " + this->m_assetsPath);
}

DotNameLib::~DotNameLib() { LOG_DEBUG("DotNameLib deconstructed."); }

} // namespace library