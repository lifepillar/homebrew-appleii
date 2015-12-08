cask :v1 => 'apple2ix' do
  version '0.9'
  sha256 '328637f021583bb303e8d77fec9b511c845ff2df0da14ae073bd0dbaa6c5aa84'

  url "http://deadc0de.org/Apple2Mac/Apple2Mac-0.9.dmg"
  name 'Apple //ix'
  homepage 'http://deadc0de.org/apple2ix/'
  license :gpl

  app "Apple2Mac.app"

end

