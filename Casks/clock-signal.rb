cask "clock-signal" do
  version "2021-04-19"
  sha256 "7b07acf96b0b6544b067abf8e3d46cf4a6590b37e9b8abcceeb3784f7e794fd6"

  url "https://github.com/TomHarte/CLK/releases/download/#{version}/Clock.Signal.macOS.#{version}.zip"
  appcast "https://github.com/TomHarte/CLK/releases.atom"
  name "Clock Signal"
  homepage "https://github.com/TomHarte/CLK"

  app "Clock Signal.app"
end
