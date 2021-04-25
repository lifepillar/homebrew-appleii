cask 'openemulator' do
  version '1.0.5-20190205'
  sha256 '5379d4810949e9ddd7a8efc3e3e42efae8372f8618ece6fd07755410b1cdc5d9'

  url 'https://archive.org/download/OpenEmulatorSnapshots/OpenEmulator-20190205.zip'
  name 'OpenEmulator'
  desc 'Accurate, portable emulator of legacy computer systems'
  homepage 'https://archive.org/details/OpenEmulatorSnapshots'

  app 'OpenEmulator.app'
end
