cask "microm8-gui" do
  version "1.1"
  sha256 :no_check

  url "https://github.com/paleotronic/microm8-gui/releases/download/v1.1/microM8-gui-macos-x64.zip",
      verified: "github.com/paleotronic/microm8-gui/"
  name "microM8-gui"
  desc "Apple II emulator"
  homepage "https://paleotronic.com/software/microm8/"

  app "microM8-gui.app"

  zap trash: [
    "~/Library/Preferences/com.paleotronic.microM8.plist",
    "~/Library/Saved Application State/com.paleotronic.microM8.savedState",
    "~/microM8",
  ]
end
