cask 'openemulator' do
  version '1.0.3.1-20170517'
  sha256 '53afa43a485834b1326983f9f02f613206086c22fa5ba10a1951e51ca04c0e3e'

  url 'https://archive.org/download/OpenEmulatorSnapshots/OpenEmulator-20170517.zip'
  name 'OpenEmulator'
  name 'Accurate, portable emulator of legacy computer systems'
  homepage 'https://archive.org/details/OpenEmulatorSnapshots'

  license :gpl

  app 'OpenEmulator.app'
end
