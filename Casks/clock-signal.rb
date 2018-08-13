cask 'clock-signal' do
  version '2018-08-05'
  sha256 '31557511f75dfd51379e4b04d40fe6f21ec585ad4f80538490fd5c8997e6dec5'

  url "https://github.com/TomHarte/CLK/releases/download/#{version}/Clock.Signal.macOS.#{version}.zip"
  appcast 'https://github.com/TomHarte/CLK/releases.atom'
  name 'Clock Signal'
  homepage 'https://github.com/TomHarte/CLK'

  app 'Clock Signal.app'
end
