cask "sciibinx" do
  version "1.02"
  sha256 :no_check

  url "http://www.apple2works.com/marklim/sciibinx.zip"
  name "SCIIBinX"
  desc "Utility for extracting an Apple II file from a BINSCII file or email segment"
  homepage "http://www.apple2works.com/"

  app "SCIIBinX.app"

  zap trash: [
    "~/Library/Application Support/SCIIBinX",
    "~/Library/Preferences/com.incrementalinnovation.SCIIBinX.plist",
    "~/Library/Saved Application State/com.incrementalinnovation.SCIIBinX.savedState",
  ]
end
