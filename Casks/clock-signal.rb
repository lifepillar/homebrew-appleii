cask "clock-signal" do
  version "2022-07-08"
  sha256 "c4dedee6c111ad29d142c7f4f39e742a9220ce9d632a03e4956a9a433d26bdf4"

  url "https://github.com/TomHarte/CLK/releases/download/#{version}/Clock.Signal.macOS.#{version}.zip"
  # appcast "https://github.com/TomHarte/CLK/releases.atom"
  name "Clock Signal"
  desc "Latency-hating emulator of 8- and 16-bit platforms"
  homepage "https://github.com/TomHarte/CLK"

  app "Clock Signal.app"
end
