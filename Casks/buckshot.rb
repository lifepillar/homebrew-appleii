cask "buckshot" do
  version "0.8.0"
  sha256 "b25be134cef7aafbf5b5eb6118ce258e57ae20368fb8be39a701d029f5fceee1"

  # github.com/digarok/buckshot was verified as official when first introduced to the cask
  url "https://github.com/digarok/buckshot/releases/download/v#{version}/buckshot.dmg",
      verified: "github.com/digarok/buckshot/"
  name "buckshot"
  desc "Apple II Image Converter Tool"
  homepage "https://apple2.gs/buckshot/"

  app "buckshot.app"

  zap trash: [
    "~/Library/Preferences/com.dagenbrock.buckshot.plist",
    "~/Library/Saved Application State/com.dagenbrock.buckshot.savedState",
  ]

  caveats <<-EOS
    As buckshot is not notarized with Apple, you should execute
    the following command before the first launch:

      xattr -d com.apple.quarantine /Applications/buckshot.app
  EOS
end
