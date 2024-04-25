cask "sweet16" do
  version "3.0.3"
  sha256 "eed4544f0f461490e0849f33a2a582ad33ceeb0719a38f442cd871e47af3410b"

  sweet16 = "Sweet16_3.0.3"
  url "http://www.sheppyware.net/downloads/downloads-mac/files/#{sweet16}.zip"
  name "Sweet16"
  desc "The most capable Apple IIGS emulator for OS X"
  homepage "http://www.sheppyware.net/software-mac/sweet16/"

  app "#{sweet16}/Sweet16.app"
end
