cask 'openemulator' do
  version '1.0.3'
  sha256 '20d624e90a25de490459eb4d2125f32af6ea8b2ccec87d8061ccd86c8d669dd1'

  # storage.googleapis.com was verified as official when first introduced to the cask
  url 'https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/openemulator/OpenEmulator-1.0.3.dmg'
  name 'OpenEmulator'
  name 'Accurate, portable emulator of legacy computer systems'
  homepage 'https://code.google.com/p/openemulator/'

  license :gpl

  app 'OpenEmulator.app'
end
