cask "clock-signal" do
  version "2019-08-04"
  sha256 "e88e6f26a4d5e45200847205baa84c713137e0c15b759916db3f6cbb0f5bacd8"

  url "https://github.com/TomHarte/CLK/releases/download/#{version}/Clock.Signal.macOS.#{version}.zip"
  appcast "https://github.com/TomHarte/CLK/releases.atom"
  name "Clock Signal"
  homepage "https://github.com/TomHarte/CLK"

  app "Clock Signal.app"
end
