cask "ample" do
  version "0.265,57"
  sha256 "533e9da1c5033c3a5c50912f292cecce28b3d8269f6b2c052c6d098ea4fa3d9a"

  url "https://github.com/ksherlock/ample/releases/download/r#{version.csv.second}/Ample-#{version.csv.second}.zip"
  name "Ample"
  desc "Apple Emulator Frontend for MAME"
  homepage "https://github.com/ksherlock/ample"

  livecheck do
    url "https://ample.ksherlock.com/updates/appcast.xml"
    strategy :sparkle do |item|
      "#{item.short_version.delete_suffix("-u2")},#{item.version}"
    end
  end

  auto_updates true
  depends_on macos: ">= :high_sierra"

  app "Ample.app"

  zap trash: [
    "~/Library/Application Support/Ample",
    "~/Library/Caches/com.ksherlock.ample",
    "~/Library/Preferences/com.ksherlock.ample.plist",
    "~/Library/WebKit/com.ksherlock.ample",
  ]
end
