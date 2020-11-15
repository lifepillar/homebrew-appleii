cask "clock-signal" do
  version "2020-11-13"
  sha256 "836fbd5ac6cfcdfdac378bd3b9c714bac7087d5f53ff2dfd85217d69013205c0"

  url "https://github.com/TomHarte/CLK/releases/download/#{version}/Clock.Signal.macOS.#{version}.updated.zip"
  appcast "https://github.com/TomHarte/CLK/releases.atom"
  name "Clock Signal"
  homepage "https://github.com/TomHarte/CLK"

  app "Clock Signal.app"
end
