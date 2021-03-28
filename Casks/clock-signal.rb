cask "clock-signal" do
  version "2021-03-25"
  sha256 "6284c794ff9b2e9467c9068d685f9e7091d76425b0a62130697d579f0b096bea"

  url "https://github.com/TomHarte/CLK/releases/download/#{version}/Clock.Signal.macOS.#{version}.zip"
  appcast "https://github.com/TomHarte/CLK/releases.atom"
  name "Clock Signal"
  homepage "https://github.com/TomHarte/CLK"

  app "Clock Signal.app"
end
