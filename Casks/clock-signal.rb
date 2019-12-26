cask "clock-signal" do
  version "2019-12-25"
  sha256 "456ae311d976a073fbd0e14911989fe99cadfec2a782fb9ab9027fc5b4e06c1d"

  url "https://github.com/TomHarte/CLK/releases/download/#{version}/Clock.Signal.macOS.#{version}.zip"
  appcast "https://github.com/TomHarte/CLK/releases.atom"
  name "Clock Signal"
  homepage "https://github.com/TomHarte/CLK"

  app "Clock Signal.app"
end
