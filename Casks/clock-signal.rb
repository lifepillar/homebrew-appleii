cask "clock-signal" do
  version "2020-03-21"
  sha256 "03e7f7172ab729f3288d06c9db2a78abca159ca81781b5b746658139fbd3e0ff"

  url "https://github.com/TomHarte/CLK/releases/download/#{version}/Clock.Signal.macOS.#{version}.zip"
  appcast "https://github.com/TomHarte/CLK/releases.atom"
  name "Clock Signal"
  homepage "https://github.com/TomHarte/CLK"

  app "Clock Signal.app"
end
