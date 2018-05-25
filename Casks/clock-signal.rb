cask 'clock-signal' do
  version '2018-05-24'
  sha256 '205d65b51549b42721e9c8b048cf2489b6b9f6dfcad2d9ae86d707731e28cbfd'

  url "https://github.com/TomHarte/CLK/releases/download/#{version}/Clock.Signal.macOS.#{version}.zip"
  appcast 'https://github.com/TomHarte/CLK/releases.atom',
    checkpoint: '2e2905f96690fce006a4dfb2058758144cbe50228517d945b5b6f6a7b47e1f84'
  name 'Clock Signal'
  homepage 'https://github.com/TomHarte/CLK'

  app 'Clock Signal.app'
end
