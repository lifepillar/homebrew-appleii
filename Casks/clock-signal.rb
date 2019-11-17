cask "clock-signal" do
  version "2019-11-17"
  sha256 "fbffa578136198d403cbcd6281aca45a1bbbf4b80a081c4a3504b4c3f0f5a746"

  url "https://github.com/TomHarte/CLK/releases/download/#{version}/Clock.Signal.macOS.#{version}.zip"
  appcast "https://github.com/TomHarte/CLK/releases.atom"
  name "Clock Signal"
  homepage "https://github.com/TomHarte/CLK"

  app "Clock Signal.app"
end
