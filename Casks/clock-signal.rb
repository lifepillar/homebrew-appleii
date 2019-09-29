cask "clock-signal" do
  version "2019-09-28"
  sha256 "85274e1398741c78d049d66515d28729ff885d83dfe41286bc351d87381b7d8f"

  url "https://github.com/TomHarte/CLK/releases/download/#{version}/Clock.Signal.macOS.#{version}.zip"
  appcast "https://github.com/TomHarte/CLK/releases.atom"
  name "Clock Signal"
  homepage "https://github.com/TomHarte/CLK"

  app "Clock Signal.app"
end
