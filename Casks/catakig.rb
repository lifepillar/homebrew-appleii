cask 'catakig' do
  version '2.00b4'
  sha256 '66be080bfb72b1489a528f6c4e67fbdc14c134a8a6056f1fe5a369cd97364612'

  url 'http://www.zophar.net/fileuploads/2/12323nkscx/Catakig-2.00b4.dmg.zip'
  name 'Catakig'
  desc 'Apple II emulator'
  homepage 'http://www.zophar.net/macintosh/apple2/catakig.html'

  app 'Catakig'

  caveats do
    <<~EOS
    ROMs files must be put in /Applications/Catakig/ROMs.
    EOS
  end
end
