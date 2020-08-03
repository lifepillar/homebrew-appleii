cask "clock-signal" do
  version "2020-08-02"
  sha256 "6154ec1a4d3b97a8987a07a2df4aa490cd76bb375e0cb11571cd9bdd9861f928"

  url "https://github.com/TomHarte/CLK/releases/download/#{version}/Clock.Signal.macOS.#{version}.zip"
  appcast "https://github.com/TomHarte/CLK/releases.atom"
  name "Clock Signal"
  homepage "https://github.com/TomHarte/CLK"

  app "Clock Signal.app"
end
