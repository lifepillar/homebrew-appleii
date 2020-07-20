cask 'buckshot' do
  version '0.5'
  sha256 '16babb4446509717e469fdd793c5feb3c4d361e5241bb7a425b378932588df15'

  # github.com/digarok/buckshot was verified as official when first introduced to the cask
  url "https://github.com/digarok/buckshot/releases/download/v#{version}/buckshot.dmg"
  appcast 'https://github.com/digarok/releases.atom'
  name 'buckshot'
  homepage 'https://apple2.gs/buckshot/'

  app 'buckshot.app'
end
