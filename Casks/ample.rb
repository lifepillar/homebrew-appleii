cask "ample" do
  version "0.256,46"
  sha256 "44479959a1447aad100b7ca7a1f57c0c4162542504bfa8c5f352e9e067ce0cac"

  url "https://github.com/ksherlock/ample/releases/download/r#{version.csv.second}/Ample-#{version.csv.second}.zip"
  name "Ample"
  desc "Apple Emulator Frontend for MAME"
  homepage "https://github.com/ksherlock/ample"

  livecheck do
    url "https://ample.ksherlock.com/updates/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: ">= :high_sierra"

  app "Ample.app"

  zap trash: [
    "~/Library/Application Support/Ample",
    "~/Library/Caches/com.ksherlock.ample",
    "~/Library/Preferences/com.ksherlock.ample.plist",
  ]
end
