#include "AssetContext.hpp"

namespace {
  std::filesystem::path assetsPath_;
}

namespace AssetContext {
  void setAssetsPath (const std::filesystem::path& path) {
    assetsPath_ = path;
  }

  const std::filesystem::path& getAssetsPath () {
    return assetsPath_;
  }
}