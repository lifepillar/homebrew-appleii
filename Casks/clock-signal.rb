cask 'clock-signal' do
  version '2018-05-15'
  sha256 'faa9e12f7f2fe440fa8644a7fd11df8db33f1d4365361e59499c22170e580282'

  url "https://github.com/TomHarte/CLK/releases/download/#{version}/Clock.Signal.macOS.#{version}.zip"
  appcast 'https://github.com/TomHarte/CLK/releases.atom',
    checkpoint: '2e2905f96690fce006a4dfb2058758144cbe50228517d945b5b6f6a7b47e1f84'
  name 'Clock Signal'
  homepage 'https://github.com/TomHarte/CLK'

  app 'Clock Signal.app'
end
