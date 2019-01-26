cask "clock-signal" do
  version "2018-10-29"
  sha256 "65ad3ae1e5d37b874b1ab8cdd30ef2cd6d8427bb5bf275e79a5f36d3ac5f8a86"

  url "https://github.com/TomHarte/CLK/releases/download/#{version}/Clock.Signal.macOS.#{version}.zip"
  appcast "https://github.com/TomHarte/CLK/releases.atom"
  name "Clock Signal"
  homepage "https://github.com/TomHarte/CLK"

  app "Clock Signal.app"
end
