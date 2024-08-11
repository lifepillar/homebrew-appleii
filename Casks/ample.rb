cask "ample" do
  version "0.268,60"
  sha256 "110a9a7f47d6a826ab05df76916b8916bc0e8dd4d0a7bf56009733f6a5270e50"

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
