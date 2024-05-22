cask "compressiix" do
  version "0.7"
  sha256 :no_check

  url "http://www.apple2works.com/marklim/compressiix.zip"
  name "CompressIIX"
  desc "Utility for compressing ordinary Apple II graphics files"
  homepage "http://www.apple2works.com/"

  app "CompressIIX.app"

  zap trash: [
    "~/Library/Application Support/CompressIIX",
    "~/Library/Saved Application State/com.yourcompany.CompressIIX.savedState",
  ]
end
