cask "quickviewshr" do
  version "1.15"
  sha256 :no_check

  url "http://www.apple2works.com/marklim/quickviewshr.zip"
  name "QuickViewSHR"
  desc "Utility for viewing Apple IIGS SuperHires graphics (packed and unpacked) files"
  homepage "http://www.apple2works.com/"

  app "QuickViewSHR.app"

  zap trash: [
    "~/Library/Preferences/com.incrementalinnovation.QuickViewSHR.plist",
    "~/Library/Saved Application State/com.incrementalinnovation.QuickViewSHR.savedState",
  ]
end
