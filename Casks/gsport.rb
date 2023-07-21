cask "gsport" do
  version "0.31"
  sha256 "00d5df71ff0ee6932ece28b248e100fdb378d05d958374223c15962b2529b913"

  url "https://github.com/david-schmidt/gsport/releases/download/#{version}/gsport_#{version}.dmg",
    verified: "github.com/david-schmidt/gsport/"
  name "GSPort"
  desc "Portable Apple IIGS emulator"
  homepage "https://david-schmidt.github.io/gsport/"

  # Copy the whole folder
  app "GSPort"

  caveats "A ROM file should be put in #{staged_path}/GSport."
end
