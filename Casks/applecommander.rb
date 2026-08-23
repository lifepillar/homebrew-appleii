cask "applecommander" do
  arch arm: "arm64", intel: "x86-64"

  version "14.0"
  sha256 arm:   "79ab8339b3c88ed7127f7038a82d81bd1351834d6882995817fd584847bdcb74",
         intel: "a6524ea1773c762c76fa4f641e0540638292eace41f47a3e68f0c5782f26bb3b"

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
