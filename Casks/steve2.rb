cask "steve2" do
  version "0.85-beta.1"
  sha256 "cdb4cb9f4d937a0211be78b6819130391d9b4a9f623be28dd1aaef91df197f42"

  url "https://github.com/trudnai/Steve2/releases/download/v#{version}/Steve2.pkg"
  name "Steve ]["
  desc "Speedy Apple ][ emulator"
  homepage "https://github.com/trudnai/Steve2"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+[.\w-]*)$/i)
  end

  pkg "Steve2.pkg"

  uninstall pkgutil: "com.trudnai.pkg.Steve2"

  zap trash: [
    "~/Library/Application Scripts/com.trudnai.steveii",
    "~/Library/Containers/com.trudnai.steveii",
  ]
end
