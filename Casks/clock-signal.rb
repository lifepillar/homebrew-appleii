cask "clock-signal" do
  version "2021-06-13"
  sha256 "61e636c5e7152be495d45fc4d3e4b446af1b2663915ee5cf84213ef119d725d0"

  url "https://github.com/TomHarte/CLK/releases/download/#{version}/Clock.Signal.macOS.#{version}.zip"
  appcast "https://github.com/TomHarte/CLK/releases.atom"
  name "Clock Signal"
  desc "Latency-hating emulator of 8- and 16-bit platforms"
  homepage "https://github.com/TomHarte/CLK"

  app "Clock Signal.app"
end
