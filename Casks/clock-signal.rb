cask "clock-signal" do
  version "2021-04-16"
  sha256 "7ea6df2cb91114c5d0ca8023922723a240ae695b6c13ad7e095c1259b1e54adc"

  url "https://github.com/TomHarte/CLK/releases/download/#{version}/Clock.Signal.macOS.#{version}.zip"
  appcast "https://github.com/TomHarte/CLK/releases.atom"
  name "Clock Signal"
  homepage "https://github.com/TomHarte/CLK"

  app "Clock Signal.app"
end
