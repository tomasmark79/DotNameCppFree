// MIT License
// Copyright (c) 2024-2025 Tomáš Mark

#ifndef __DOTNAMELIB_HPP
#define __DOTNAMELIB_HPP

#include <DotNameLib/version.h>
#include <filesystem>
#include <string>

// Public API

namespace dotname {

  class DotNameLib {

    const std::string libName_ = std::string ("DotNameLib v.") + DOTNAMELIB_VERSION;

  public:
    DotNameLib ();
    DotNameLib (const std::filesystem::path& assetsPath);
    ~DotNameLib ();
  };

} // namespace dotname

#endif // __DOTNAMELIB_HPP