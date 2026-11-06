cask "applecommander" do
  arch arm: "arm64", intel: "x86-64"

  version "15.2"
  sha256 arm:   "f76495038c1373dc4b3acc324274da846b97d8497ae678ae3d9580cded624e0c",
         intel: "54d33c7bd52b31bab154e9dc1a0819d021074693de7a604d97d94689d5baaf4f"

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
