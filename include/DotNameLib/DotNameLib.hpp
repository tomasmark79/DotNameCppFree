#ifndef __DOTNAMELIB_H__
#define __DOTNAMELIB_H__

// MIT License
// Copyright (c) 2024-2025 Tomáš Mark

#include <string>

// Public API

namespace library {

  class DotNameLib {
  public:
    DotNameLib (const std::string &assetsPath);
    ~DotNameLib ();

  private:
    std::string assetsPath_;

    const std::string getAssetsPath () const { return assetsPath_; }
    void setAssetsPath (const std::string &assetsPath) { assetsPath_ = assetsPath; }
  };

} // namespace library

#endif // __DOTNAMELIB_H__
