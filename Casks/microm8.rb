cask "microm8" do
  version "1.0.0"
  sha256 :no_check

  url "http://paleotronic.com/download/microm8-mac.zip"
  name "microM8"
  desc "Apple II emulator"
  homepage "https://paleotronic.com/software/microm8/"

  app "microM8.app"

  zap trash: [
    "~/Library/Preferences/com.paleotronic.microM8.plist",
    "~/Library/Saved Application State/com.paleotronic.microM8.savedState",
    "~/microM8",
  ]
end
