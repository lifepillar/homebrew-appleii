cask "sweet16" do
  version "3.0.3"
  sha256 "eed4544f0f461490e0849f33a2a582ad33ceeb0719a38f442cd871e47af3410b"

  sweet16 = "Sweet16_#{version}"
  url "https://www.sheppyware.net/downloads/downloads-mac/files/#{sweet16}.zip"
  name "Sweet16"
  desc "Capable Apple IIgs emulator"
  homepage "https://www.sheppyware.net/software-mac/sweet16/"

  livecheck do
    url :homepage
    regex(%r{href=.*?/Sweet16[._-]v?(\d+(?:\.\d+)+)\.zip}i)
  end

  depends_on macos: "<= :mojave"

  # Copy the whole folder
  app sweet16

  zap trash: [
    "~/Library/Application Support/Sweet16",
    "~/Library/Preferences/com.fesystems.Sweet16.plist",
    "~/Library/Saved Application State/com.fesystems.Sweet16.savedState",
  ]
end
