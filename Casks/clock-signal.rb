cask "clock-signal" do
  version "2019-03-03"
  sha256 "6900de73533181c55eefe3940fb0c1ec28e2a006bec9e2408156e63d69ea1847"

  url "https://github.com/TomHarte/CLK/releases/download/#{version}/Clock.Signal.macOS.#{version}.zip"
  appcast "https://github.com/TomHarte/CLK/releases.atom"
  name "Clock Signal"
  homepage "https://github.com/TomHarte/CLK"

  app "Clock Signal.app"
end
