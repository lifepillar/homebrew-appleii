cask "activegs" do
  version "3.7.1019"
  sha256 "af871c3e2b32c71eb7e2a8f7c0e69472a9844c05bdea3d73d2d6c2416ac5ae61"

  url "http://activegs.freetoolsassociation.com/ActiveGS.zip"
  name "ActiveGS"
  desc "Apple IIGS emulator"
  homepage "http://activegs.freetoolsassociation.com/"

  depends_on macos: "<= :mojave"

  app "ActiveGS.app"

  zap trash: [
    "~/ActiveGSLocalData",
    "~/Library/Saved Application State/com.yourcompany.ActiveGS.savedState",
  ]
end
