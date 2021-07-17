cask "clock-signal" do
  version "2021-07-16"
  sha256 "98a6a33445500a22d746ed15f37f3c65ed52f1215f7b300977b4689ccb064ef2"

  url "https://github.com/TomHarte/CLK/releases/download/#{version}/Clock.Signal.macOS.#{version}.zip"
  appcast "https://github.com/TomHarte/CLK/releases.atom"
  name "Clock Signal"
  desc "Latency-hating emulator of 8- and 16-bit platforms"
  homepage "https://github.com/TomHarte/CLK"

  app "Clock Signal.app"
end
