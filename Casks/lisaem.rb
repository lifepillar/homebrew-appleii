cask 'lisaem' do
  version '1.2.7-RC3a_2020.08.24'
  sha256 "98123604b3cc4b7d55a0551a9c3d24e0631fe0f1a1acb57a83185e98ae413fd7"

  url "https://lisaem.sunder.net/downloads/LisaEm_#{version}-macosx.dmg"
  appcast 'https://lisaem.sunder.net/downloads.html'
  name 'LisaEm'
  desc 'The first fully functional Lisa Emulator™'
  homepage 'https://lisaem.sunder.net/'

  lisaem_folder = '/Applications/LisaEm'

  app 'LisaEm.app', target: "#{lisaem_folder}/LisaEm.app"

  zap trash: [
               '~/Library/Caches/net.sunder.lisaem',
               '~/Library/Preferences/LisaEm Preferences',
               '~/Library/Preferences/lisaem.conf',
               '~/Library/Preferences/net.sunder.lisaem.plist',
               '~/Library/Saved Application State/net.sunder.lisaem.savedState',
             ]
end
