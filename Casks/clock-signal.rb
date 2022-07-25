cask "clock-signal" do
  version "2022-07-23"
  sha256 "a4ca89f4d6df943714ff9e8e6a1f0f81c89ea8901b3125c210d7a1de9bb577b9"

  url "https://github.com/TomHarte/CLK/releases/download/#{version}/Clock.Signal.macOS.#{version}.zip"
  # appcast "https://github.com/TomHarte/CLK/releases.atom"
  name "Clock Signal"
  desc "Latency-hating emulator of 8- and 16-bit platforms"
  homepage "https://github.com/TomHarte/CLK"

  app "Clock Signal.app"
end
