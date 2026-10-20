cask "applecommander" do
  arch arm: "arm64", intel: "x86-64"

  version "15.1"
  sha256 arm:   "761649e4c6cf87a987335258f2f3f110f9fb034c50db0afb3101e30b390dc2c1",
         intel: "d2348a3bd6efabfdf8968ea55057e71430d31b088134e815cdc2c0c5c6f6741d"

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
