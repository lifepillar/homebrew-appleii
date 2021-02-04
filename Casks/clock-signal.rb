cask "clock-signal" do
  version "2021-02-02"
  sha256 "3e4b323900b6a28817c59a949082fc853e212c6281488009661e2a82e9bd40f9"

  url "https://github.com/TomHarte/CLK/releases/download/#{version}/Clock.Signal.macOS.#{version}.zip"
  appcast "https://github.com/TomHarte/CLK/releases.atom"
  name "Clock Signal"
  homepage "https://github.com/TomHarte/CLK"

  app "Clock Signal.app"
end
