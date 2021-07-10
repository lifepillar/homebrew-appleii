cask "clock-signal" do
  version "2021-07-09"
  sha256 "94495531486b2038b7fa8d62932198bdc4fdf496554d60c6ead5a6b324641bb7"

  url "https://github.com/TomHarte/CLK/releases/download/#{version}/Clock.Signal.macOS.#{version}.zip"
  appcast "https://github.com/TomHarte/CLK/releases.atom"
  name "Clock Signal"
  desc "Latency-hating emulator of 8- and 16-bit platforms"
  homepage "https://github.com/TomHarte/CLK"

  app "Clock Signal.app"
end
