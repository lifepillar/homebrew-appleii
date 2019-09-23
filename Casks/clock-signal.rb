cask "clock-signal" do
  version "2019-09-22"
  sha256 "8bb5b413dd21c99bff5122111e1afb2de977bbbbf9ee0600ab331fd4c941208c"

  url "https://github.com/TomHarte/CLK/releases/download/#{version}/Clock.Signal.macOS.#{version}.zip"
  appcast "https://github.com/TomHarte/CLK/releases.atom"
  name "Clock Signal"
  homepage "https://github.com/TomHarte/CLK"

  app "Clock Signal.app"
end
