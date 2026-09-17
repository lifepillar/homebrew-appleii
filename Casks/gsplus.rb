cask "gsplus" do
  version "1.38.0"
  sha256 "d73608c11b650b8993e5427ad044bfb4b1f00c1a57f62bb54ca3b8401b341a3d"

  url "https://github.com/digarok/gsplus/releases/download/v#{version}/GSplus-#{version}-Darwin.dmg"
  name "GSplus"
  desc "Apple IIGS emulator based on KEGS and GSPort"
  homepage "https://apple2.gs/plus/"

  livecheck do
    url "https://github.com/digarok/gsplus"
  end

  app "GSplus.app"

  caveats <<~EOS
    Because of macOS security measures, you may have to remove the
    quarantine attribute using the following command:

        xattr -d com.apple.quarantine #{appdir}/GSplus.app
  EOS
end
