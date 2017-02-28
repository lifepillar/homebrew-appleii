cask 'gsport' do
  version '0.31'
  sha256 '00d5df71ff0ee6932ece28b248e100fdb378d05d958374223c15962b2529b913'

  url 'http://downloads.sourceforge.net/sourceforge/gsport/gsport_0.31.dmg'
  name 'GSPort'
  name 'Portable Apple IIGS emulator'
  homepage 'http://gsport.sourceforge.net'

  license :gpl

  app 'GSPort/GSPort.app'

  caveats do
    "A ROM file should be put in #{staged_path}/GSport."
  end
end
