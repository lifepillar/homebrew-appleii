cask "clock-signal" do
  version "2020-07-27"
  sha256 "12ec1c9406f0fbd6a944efc7d8ecec97a747a9be6e16be4ef80980e2bd3d354c"

  url "https://github.com/TomHarte/CLK/releases/download/#{version}/Clock.Signal.macOS.#{version}.zip"
  appcast "https://github.com/TomHarte/CLK/releases.atom"
  name "Clock Signal"
  homepage "https://github.com/TomHarte/CLK"

  app "Clock Signal.app"
end
