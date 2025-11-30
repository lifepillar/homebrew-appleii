cask "catakig" do
  version "2.00b4"
  sha256 "aeb2c3e796d082efffe82d96720843f6b98150286b3f163fd0f8a9dc7dd3f229"

  url "https://downloads.sourceforge.net/catakig/catakig-2/Catakig-2.0/Catakig-#{version}.dmg"
  name "Catakig"
  desc "Apple II emulator"
  homepage "https://catakig.sourceforge.net/"

  # Copy the whole folder
  app "Catakig"
  artifact "License.html", target: "#{appdir}/Catakig/License.html"
  artifact "Read-Me.txt", target: "#{appdir}/Catakig/Read-Me.txt"
  artifact "User-Guide.pdf", target: "#{appdir}/Catakig/User-Guide.pdf"
  artifact "Version-History.txt", target: "#{appdir}/Catakig/Version-History.txt"

  zap trash: [
    "~/Library/Preferences/net.sourceforge.catakig.plist",
    "~/Library/Saved Application State/net.sourceforge.catakig.savedState",
  ]

  caveats "ROM files must be put in #{appdir}/Catakig/ROMs."
end
