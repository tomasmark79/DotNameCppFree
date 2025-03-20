#ifndef __DOTNAMELIB_H__
#define __DOTNAMELIB_H__

// MIT License
// Copyright (c) 2024-2025 Tomáš Mark

#include <string>
// Public API

namespace library
{

  class DotNameLib
  {
  public:
    DotNameLib (const std::string &assetsPath);
    ~DotNameLib ();

    // alternatively, you can use a getter function
    const std::string getAssetsPath () const { return m_assetsPath; }

  private:
    std::string m_assetsPath;
  };

} // namespace library

#endif // __DOTNAMELIB_H__
