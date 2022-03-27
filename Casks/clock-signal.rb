cask "clock-signal" do
  version "2022-03-26"
  sha256 "b460f8de31fee6c9bcfb35b0064efe46cacaa6de5e08e0f15787d3ac6875577a"

  url "https://github.com/TomHarte/CLK/releases/download/#{version}/Clock.Signal.macOS.#{version}.zip"
  appcast "https://github.com/TomHarte/CLK/releases.atom"
  name "Clock Signal"
  desc "Latency-hating emulator of 8- and 16-bit platforms"
  homepage "https://github.com/TomHarte/CLK"

  app "Clock Signal.app"
end
