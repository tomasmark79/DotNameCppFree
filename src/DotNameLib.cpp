#include <DotNameLib/DotNameLib.hpp>
#include <Logger/Logger.hpp>
#include <Utils/Utils.hpp>

namespace dotname {

  DotNameLib::DotNameLib () {
    LOG_D_MSG (libName + " constructed ...");
  }
  DotNameLib::DotNameLib (const std::filesystem::path& assetsPath) : assetsPath_ (assetsPath) {
    LOG_D_MSG (libName + " constructed with assets path ...");
  }
  DotNameLib::~DotNameLib () {
    LOG_D_SAFE_MSG (DotNameLib, libName + " destructed ...");
  }

} // namespace dotname