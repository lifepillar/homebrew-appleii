cask "applecommander" do
  arch arm: "arm64", intel: "x86-64"

  version "14.1"
  sha256 arm:   "d18ad1c1913eb5bf3c5fdbab5bc7f4ec34a838bfbd5475a903c613a598148bc3",
         intel: "9cbf994ab4dbc23c68ede2ef55f8bf25fda3aebf90f2c39902e890f73eb6412d"

  url "https://github.com/AppleCommander/AppleCommander/releases/download/#{version}/AppleCommander-#{version}-mac-#{arch}.dmg"
  name "AppleCommander"
  desc "A tool to manipulate Apple ][ disk images"
  homepage "https://applecommander.github.io"

  app "AppleCommander.app"

  caveats "Run `xattr -d com.apple.quarantine /Applications/AppleCommander.app` if you cannot launch the app."

  zap trash: [
    "~/Library/Preferences/AppleCommander.plist",
    "~/Library/Preferences/AppleCommander.preferences"
  ]
end
