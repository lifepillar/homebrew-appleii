class Applecommander < Formula
  if Hardware::CPU.intel?
    url "https://github.com/AppleCommander/AppleCommander/releases/download/14.0/AppleCommander-macosx-x86_64-14.0.jar"
    sha256 "ecb7b7b342c0b16a41ee92aef8c7f0096764ce48b068cefbcd44892e5adcdcb6"
  else
    url "https://github.com/AppleCommander/AppleCommander/releases/download/14.0/AppleCommander-macosx-aarch64-14.0.jar"
    sha256 "e8b0aabb1b0935e33562654a9871d0b10a6b3f410072f45262e63866e4ca7dc4"
  end

  desc "Move data between Apple ][ disk images and native filesystem"
  homepage "https://applecommander.github.io/"
  depends_on "openjdk"

  def install
    arch = Hardware::CPU.intel? ? "x86_64" : "aarch64"
    libexec.install "AppleCommander-macosx-#{arch}-#{version}.jar"
    bin.write_jar_script libexec/"AppleCommander-macosx-#{arch}-#{version}.jar", "applecommander", "-XstartOnFirstThread"
  end

  def caveats
    "This formaula is DEPRECATED and will be eventually removed. Use `brew install --cask applecommander` instead."
  end

  test do
    system "false"
  end
end
