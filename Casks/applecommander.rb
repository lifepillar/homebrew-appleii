cask "applecommander" do
  arch arm: "arm64", intel: "x86-64"

  version "15.0"
  sha256 arm:   "ce0514244c1a4b7f2bcdd890dfa8217aa1669a28db395f7c832fa33d2953498f",
         intel: "ac81230dc1fa97f4bb41278a176d7bd92560430172c9dde7a1fa6fe33648fe76"

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
