cask "clock-signal" do
  version "2019-03-10"
  sha256 "d850835381f18e2841e8edd0181348b170f2f0481fbb92f552071cf1a060216d"

  url "https://github.com/TomHarte/CLK/releases/download/#{version}/Clock.Signal.macOS.#{version}.zip"
  appcast "https://github.com/TomHarte/CLK/releases.atom"
  name "Clock Signal"
  homepage "https://github.com/TomHarte/CLK"

  app "Clock Signal.app"
end
