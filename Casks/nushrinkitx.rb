cask "nushrinkitx" do
  version "1.1"
  sha256 :no_check

  url "http://www.apple2works.com/marklim/nushrinkitx.zip"
  name "NuShrinkItX"
  desc "Utility for creating and working with Apple II archive files (e.g., .shk)"
  homepage "http://www.apple2works.com/"

  app "NuShrinkItX.app"

  zap trash: [
    "~/Library/Application Support/NuShrinkItX",
    "~/Library/Preferences/com.incrementalinnovation.NuShrinkItX.plist",
    "~/Library/Saved Application State/com.incrementalinnovation.NuShrinkItX.savedState",
  ]
end
