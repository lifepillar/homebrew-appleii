cask "sara" do
  version "0.5.1"
  sha256 "0822aa281849cf306d5bc02ea4e811563de2469687ac99bce0d0b9a929d4cfbe"

  url "https://www.blackcatsystems.com/download/SaraOSX.zip"
  name "Sara"
  desc "Apple /// emulator"
  homepage "https://www.blackcatsystems.com/software/sara.html"

  depends_on macos: "<= :mojave"

  # Copy the whole folder
  app "SaraOSX"

  zap trash: [
    "~/Library/Preferences/com.blackcatsystems.Sara.plist",
    "~/Library/Preferences/Sara Prefs",
    "~/Library/Saved Application State/com.blackcatsystems.Sara.savedState",
  ]
end
