cask "clock-signal" do
  version "2021-04-21"
  sha256 "db8f2364f0abbdd5f0f1e6f9d901b8ec31c1ecaf4d5c391c912ada3e01d4bdb9"

  url "https://github.com/TomHarte/CLK/releases/download/#{version}/Clock.Signal.macOS.#{version}.zip"
  appcast "https://github.com/TomHarte/CLK/releases.atom"
  name "Clock Signal"
  homepage "https://github.com/TomHarte/CLK"

  app "Clock Signal.app"
end
