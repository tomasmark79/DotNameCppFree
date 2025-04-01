#ifndef __DOTNAMELIB_H__
#define __DOTNAMELIB_H__

// MIT License
// Copyright (c) 2024-2025 Tomáš Mark

#include <filesystem>
#include <string>

// Public API

namespace dotname {

  class DotNameLib {
  public:
    DotNameLib (const std::filesystem::path &assetsPath);
    DotNameLib (const std::string &assetsPath);
    ~DotNameLib ();

  private:
    std::filesystem::path assetsPath_;

    const std::filesystem::path getAssetsPath () const { return assetsPath_; }
    void setAssetsPath (const std::filesystem::path &assetsPath) { assetsPath_ = assetsPath; }
  };

} // namespace library

#endif // __DOTNAMELIB_H__
