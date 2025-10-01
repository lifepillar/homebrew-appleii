cask "ample" do
  version "0.281,73"
  sha256 "1f2a856f1e9aa9a3eb5c7d5a1d3464d40206cb777d494e7145e1886a03511bd1"

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
