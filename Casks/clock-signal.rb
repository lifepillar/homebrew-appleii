cask "clock-signal" do
  version "2022-04-17"
  sha256 "a2fd00f1e9d6fea8aa5401182c88016afcea31773f862894196f97ed3af7a11a"

  url "https://github.com/TomHarte/CLK/releases/download/#{version}/Clock.Signal.macOS.#{version}.zip"
  # appcast "https://github.com/TomHarte/CLK/releases.atom"
  name "Clock Signal"
  desc "Latency-hating emulator of 8- and 16-bit platforms"
  homepage "https://github.com/TomHarte/CLK"

  app "Clock Signal.app"
end
