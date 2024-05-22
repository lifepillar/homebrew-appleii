cask "lz4compressorx" do
  version "0.8"
  sha256 :no_check

  url "http://www.apple2works.com/marklim/lz4compressorx.zip"
  name "LZ4CompressorX"
  desc "Utility for general file compression"
  homepage "http://www.apple2works.com/"

  app "LZ4CompressorX.app"

  zap trash: [
    "~/Library/Application Support/LZ4CompressorX",
    "~/Library/Saved Application State/com.yourcompany.LZ4CompressorX.savedState",
  ]
end
