cask 'clock-signal' do
  version '2018-06-24'
  sha256 '2bf60cd841e7755466652a2abc5e47d13028979bff539656b182e578b57575c5'

  # url "https://github.com/TomHarte/CLK/releases/download/#{version}/Clock.Signal.macOS.#{version}.zip"
  # Release 2018-06-24 has a different pattern for the URL:
  url "https://github.com/TomHarte/CLK/releases/download/untagged-83a648386d4da3db578a/Clock.Signal.macOS.#{version}.zip"
  appcast 'https://github.com/TomHarte/CLK/releases.atom'
  name 'Clock Signal'
  homepage 'https://github.com/TomHarte/CLK'

  app 'Clock Signal.app'
end
