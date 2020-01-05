cask "clock-signal" do
  version "2020-01-05"
  sha256 "62d099b8db01e913ee61910ab79c32333382b8df918e60118ef7c8873fa501cb"

  url "https://github.com/TomHarte/CLK/releases/download/#{version}/Clock.Signal.macOS.#{version}.zip"
  appcast "https://github.com/TomHarte/CLK/releases.atom"
  name "Clock Signal"
  homepage "https://github.com/TomHarte/CLK"

  app "Clock Signal.app"
end
