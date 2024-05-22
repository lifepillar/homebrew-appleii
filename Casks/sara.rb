cask "sara" do
  version "0.5.1"
  sha256 "0822aa281849cf306d5bc02ea4e811563de2469687ac99bce0d0b9a929d4cfbe"

  url "http://www.blackcatsystems.com/download/SaraOSX.zip"
  name "Sara"
  desc "Sara Apple /// Emulator"
  homepage "http://www.blackcatsystems.com/software/sara.html"

  app "SaraOSX/Sara.app"

  zap trash: [
    "~/Library/Preferences/com.blackcatsystems.Sara.plist",
    "~/Library/Preferences/Sara Prefs",
    "~/Library/Saved Application State/com.blackcatsystems.Sara.savedState",
  ]
end
