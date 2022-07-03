cask "clock-signal" do
  version "2022-07-01"
  sha256 "cd2d354074f56ff24736db5fbbf2e2d666977a5ae278bc010293e1c15ace83f0"

  url "https://github.com/TomHarte/CLK/releases/download/#{version}/Clock.Signal.macOS.#{version}.zip"
  # appcast "https://github.com/TomHarte/CLK/releases.atom"
  name "Clock Signal"
  desc "Latency-hating emulator of 8- and 16-bit platforms"
  homepage "https://github.com/TomHarte/CLK"

  app "Clock Signal.app"
end
