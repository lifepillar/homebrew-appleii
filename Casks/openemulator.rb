cask 'openemulator' do
  version '1.0.3.1-20170318'
  sha256 'e9e8b107b271868cedeb140e32adc3a05f166fb0ea357714c53ab83aa824d160'

  url 'https://archive.org/download/OpenEmulatorSnapshots/OpenEmulator-20170318.zip'
  name 'OpenEmulator'
  name 'Accurate, portable emulator of legacy computer systems'
  homepage 'https://archive.org/details/OpenEmulatorSnapshots'

  license :gpl

  app 'OpenEmulator.app'
end
