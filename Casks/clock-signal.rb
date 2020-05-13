cask "clock-signal" do
  version "2020-05-10"
  sha256 "202bfc4e174f746b73d776fdb259311d75aebbbbb15481706bee73d0fdd9fff5"

  url "https://github.com/TomHarte/CLK/releases/download/#{version}/Clock.Signal.macOS.#{version}.zip"
  appcast "https://github.com/TomHarte/CLK/releases.atom"
  name "Clock Signal"
  homepage "https://github.com/TomHarte/CLK"

  app "Clock Signal.app"
end
