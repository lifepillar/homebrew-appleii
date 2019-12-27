cask "clock-signal" do
  version "2019-12-26"
  sha256 "fc9fb11befc3a3e2827ce2917eb0538784c7c8a5657835ae7d2ce52ffbe415c7"

  url "https://github.com/TomHarte/CLK/releases/download/#{version}/Clock.Signal.macOS.#{version}.zip"
  appcast "https://github.com/TomHarte/CLK/releases.atom"
  name "Clock Signal"
  homepage "https://github.com/TomHarte/CLK"

  app "Clock Signal.app"
end
