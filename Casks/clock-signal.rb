cask "clock-signal" do
  version "2022-08-22"
  sha256 "d69584920f503888e6756adf3acbb4a39e7a88cae5043d585eea2fbb4a936b91"

  url "https://github.com/TomHarte/CLK/releases/download/#{version}/Clock.Signal.macOS.#{version}.zip"
  # appcast "https://github.com/TomHarte/CLK/releases.atom"
  name "Clock Signal"
  desc "Latency-hating emulator of 8- and 16-bit platforms"
  homepage "https://github.com/TomHarte/CLK"

  app "Clock Signal.app"
end
