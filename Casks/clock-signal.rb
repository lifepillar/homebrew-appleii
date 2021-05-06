cask "clock-signal" do
  version "2021-05-05"
  sha256 "c840545552d47fe390a94c6f0685f7975c128194e59fcccbcdcdcdcd86b8994e"

  url "https://github.com/TomHarte/CLK/releases/download/#{version}/Clock.Signal.macOS.#{version}.zip"
  appcast "https://github.com/TomHarte/CLK/releases.atom"
  name "Clock Signal"
  desc "Latency-hating emulator of 8- and 16-bit platforms"
  homepage "https://github.com/TomHarte/CLK"

  app "Clock Signal.app"
end
