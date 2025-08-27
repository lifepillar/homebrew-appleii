class Applecommander < Formula
  if Hardware::CPU.intel?
    url "https://github.com/AppleCommander/AppleCommander/releases/download/12.0/AppleCommander-macosx-x86_64-12.0.jar"
    sha256 "cfd6e1a40ff9d7644667c877699d11e7aacbb56cfd56be96392f0a7af934f64b"
  else
    url "https://github.com/AppleCommander/AppleCommander/releases/download/12.0/AppleCommander-macosx-aarch64-12.0.jar"
    sha256 "c136b466ab86683707f2d0a19abf6674a5892a224aed6f439bec5d51c2b23289"
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
