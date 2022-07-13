class Applecommander < Formula
  if Hardware::CPU.intel?
    url "https://github.com/AppleCommander/AppleCommander/releases/download/1.8.0/AppleCommander-macosx-x86_64-1.8.0.jar"
    sha256 "0b21e2fafa0725b52d4468ce6fc212bd1ee051062d42b2a5079a678e2d2f7220"
  else
    url "https://github.com/AppleCommander/AppleCommander/releases/download/1.8.0/AppleCommander-macosx-aarch64-1.8.0.jar"
    sha256 "c54e350bc4d9414786a4006a78a49536cbe6b1e2dffa194e44163c068f7d9fc8"
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
