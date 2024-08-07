cask "quickviewdhgr" do
  version "0.85"
  sha256 :no_check

  url "http://www.apple2works.com/marklim/quickviewdhgr.zip"
  name "QuickViewDHGR"
  desc "Utility for viewing Apple II graphics files"
  homepage "http://www.apple2works.com/"

  app "QuickViewDHGR.app"

  zap trash: [
    "~/Library/Preferences/com.incrementalInnovation.QuickViewDHGR.plist",
    "~/Library/Saved Application State/com.incrementalInnovation.QuickViewDHGR.savedState",
  ]
end
