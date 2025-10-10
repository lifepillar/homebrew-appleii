class Applecommander < Formula
  if Hardware::CPU.intel?
    url "https://github.com/AppleCommander/AppleCommander/releases/download/13.0/AppleCommander-macosx-x86_64-13.0.jar"
    sha256 "1878ad5b3704093e6c910f58cf4c8345ff65326ab6cbeb64b1b4b13515dc9353"
  else
    url "https://github.com/AppleCommander/AppleCommander/releases/download/13.0/AppleCommander-macosx-aarch64-13.0.jar"
    sha256 "46898dfa72cb822b40996bd496857ef96f22d78320f377ec1a2fad741d9390c9"
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
    "Run by typing `applecommander` in the terminal."
  end

  test do
    system "false"
  end
end
