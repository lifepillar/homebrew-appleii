cask "clock-signal" do
  version "2021-07-03"
  sha256 "5d1cc25347ff8f34c533ab1026626a728d37292b92df173810e2a5968558e446"

  url "https://github.com/TomHarte/CLK/releases/download/#{version}/Clock.Signal.macOS.#{version}.zip"
  appcast "https://github.com/TomHarte/CLK/releases.atom"
  name "Clock Signal"
  desc "Latency-hating emulator of 8- and 16-bit platforms"
  homepage "https://github.com/TomHarte/CLK"

  app "Clock Signal.app"
end
