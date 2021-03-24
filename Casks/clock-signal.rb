cask "clock-signal" do
  version "2021-03-23"
  sha256 "0d9321117073ed45886d0efd37370fde69bf1aca6b62f8635c15d40a9de1bdaf"

  url "https://github.com/TomHarte/CLK/releases/download/#{version}/Clock.Signal.macOS.#{version}.zip"
  appcast "https://github.com/TomHarte/CLK/releases.atom"
  name "Clock Signal"
  homepage "https://github.com/TomHarte/CLK"

  app "Clock Signal.app"
end
