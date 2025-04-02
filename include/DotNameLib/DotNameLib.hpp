#ifndef __DOTNAMELIB_H__
#define __DOTNAMELIB_H__

#include <DotNameLib/version.h>
#include <filesystem>
#include <string>

// Public API

namespace dotname {

  class DotNameLib {

    const std::string libName = std::string ("DotNameLib v.") + DOTNAMELIB_VERSION;
    std::filesystem::path assetsPath_;

  public:
    DotNameLib ();
    DotNameLib (const std::filesystem::path& assetsPath);
    ~DotNameLib ();

    const std::filesystem::path getAssetsPath () const {
      return assetsPath_;
    }
    void setAssetsPath (const std::filesystem::path& assetsPath) {
      assetsPath_ = assetsPath;
    }
  };

} // namespace dotname

#endif // __DOTNAMELIB_H__