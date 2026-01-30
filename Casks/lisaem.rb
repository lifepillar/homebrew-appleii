cask "lisaem" do
  version "2.0.0,2026.01.25"
  sha256 "0e0fee7b3d078c807648c9499840fb15d7e888ac505334a519dee5794454aaca"

  url "https://github.com/arcanebyte/lisaem/releases/download/#{version.csv.first}/LisaEm-#{version.csv.first}-#{version.csv.second}-MacOS-15.7_arm64.pkg"
  name "LisaEm"
  desc "Apple Lisa emulator"
  homepage "https://github.com/arcanebyte/lisaem"

  livecheck do
    url :url
    regex(/LisaEm[._-]v?(\d+(?:\.\d+)+[.\w-]*)-MacOS[._-][.0-9]*[._-]arm64\.pkg/i)
  end

  pkg "LisaEm-#{version.csv.first}-#{version.csv.second}-MacOS-15.7_arm64.pkg"

  uninstall pkgutil: [
    "net.sunder.lisaem",
  ]

  zap trash: [
    "~/Library/Caches/net.sunder.lisaem",
    "~/Library/Preferences/lisaem-arm64-15.03-wx3 Preferences.2",
    "~/Library/Preferences/lisaem-arm64-15.07-wx3 Preferences.2",
    "~/Library/Preferences/lisaem.conf",
    "~/Library/Preferences/net.sunder.lisaem.plist",
    "~/Library/Saved Application State/net.sunder.lisaem.savedState",
  ]
end
