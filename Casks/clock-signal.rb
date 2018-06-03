cask 'clock-signal' do
  version '2018-06-03'
  sha256 'a433ca8e2b21c6e9bfe279f7f1f7f2528a03a7fc0041ba933af1e65504d11fee'

  url "https://github.com/TomHarte/CLK/releases/download/#{version}/Clock.Signal.macOS.#{version}.zip"
  appcast 'https://github.com/TomHarte/CLK/releases.atom',
    checkpoint: '282213d813edf554d050a34516f86aa6e1880a82b68ba39e5bff532140b18f09'
  name 'Clock Signal'
  homepage 'https://github.com/TomHarte/CLK'

  app 'Clock Signal.app'
end
