cask "clock-signal" do
  version "2020-09-16"
  sha256 "be8869311db2a6670e9d63f9d740a81543fed327eafc3f27b3df206abc3bb85c"

  url "https://github.com/TomHarte/CLK/releases/download/#{version}/Clock.Signal.macOS.#{version}.zip"
  appcast "https://github.com/TomHarte/CLK/releases.atom"
  name "Clock Signal"
  homepage "https://github.com/TomHarte/CLK"

  app "Clock Signal.app"
end
