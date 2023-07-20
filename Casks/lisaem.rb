cask "lisaem" do
  version "1.2.7-RC4_2022.04.01"
  sha256 "5b6b8026f57f6ac39986b11d4481f864ab8feb27412fadfae93eb377f4420c02"

  url "https://lisaem.sunder.net/downloads/LisaEm_#{version}-macosx.dmg"
  name "LisaEm"
  desc "The first fully functional Lisa Emulator™"
  homepage "https://lisaem.sunder.net/"

  livecheck do
    url "https://lisaem.sunder.net/downloads.html"
    regex(/href=.*?LisaEm[._-]v?(\d+(?:\.\d+)+[.\w-]*)-macosx.dmg/i)
  end

  app "LisaEm #{version}.app", target: "LisaEm/LisaEm.app"

  zap trash: [
               '~/Library/Caches/net.sunder.lisaem',
               '~/Library/Preferences/LisaEm Preferences',
               '~/Library/Preferences/lisaem.conf',
               '~/Library/Preferences/net.sunder.lisaem.plist',
               '~/Library/Saved Application State/net.sunder.lisaem.savedState',
             ]
end
