cask "clock-signal" do
  version "2021-04-06"
  sha256 "64cf6e71da5a2c357b6b1cef7519c4d2abaf73113de99f50cb81e11a3327a903"

  url "https://github.com/TomHarte/CLK/releases/download/#{version}/Clock.Signal.macOS.#{version}.zip"
  appcast "https://github.com/TomHarte/CLK/releases.atom"
  name "Clock Signal"
  homepage "https://github.com/TomHarte/CLK"

  app "Clock Signal.app"
end
