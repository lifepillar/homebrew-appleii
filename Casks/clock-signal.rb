cask "clock-signal" do
  version "2020-01-06"
  sha256 "985aebe6d4b8be1730551f8643669e6a21ffd7910f39db11c4821ea03cb07eae"

  url "https://github.com/TomHarte/CLK/releases/download/#{version}/Clock.Signal.macOS.#{version}.zip"
  appcast "https://github.com/TomHarte/CLK/releases.atom"
  name "Clock Signal"
  homepage "https://github.com/TomHarte/CLK"

  app "Clock Signal.app"
end
