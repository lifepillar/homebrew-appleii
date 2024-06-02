cask "ample" do
  version "0.266,58"
  sha256 "831465353954a02df6da51991013d455f8d7b6a7e2e3dd053990b6ee344f2144"

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
