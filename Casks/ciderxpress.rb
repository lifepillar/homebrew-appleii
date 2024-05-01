cask "ciderxpress" do
  version "1.0"
  sha256 :no_check

  url "http://www.apple2works.com/marklim/ciderxpress.zip"
  name "CiderXPress"
  desc "Utility for creating and working with Apple II disk images"
  homepage "http://www.apple2works.com/"

  app "CiderXPress.app"

  zap trash: "~/Library/Application Support/CiderXPress"
end
