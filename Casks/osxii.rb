cask "osxii" do
  version "0.9"
  sha256 "9e0a92f5df117d3dd9b001e827fa4485bd6753190465b755fec430ef99857796"

  url "https://www.zophar.net/fileuploads/2/12325fpoak/OSXII_v09.dmg.gz"
  name "OSXII"
  desc "Apple ][ emulator"
  homepage "https://www.zophar.net/macintosh/apple2/osxii.html"

  depends_on macos: "<= :mojave"

  # Copy the whole folder
  app "OSXII 0.9 Folder"
  artifact "README.rtfd", target: "#{appdir}/OSXII 0.9 Folder/README.rtfd"

  caveats <<~EOS
    Read Roms.rtfd in "OSXII 0.9 Folder/Roms" directory.
    Place Apple.ROM and Disk.ROM in "Roms" directory.
    Place disk image files in "Disks" directory.
  EOS
end
