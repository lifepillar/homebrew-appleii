class ApplecommanderX8664 < Formula
  desc "Move data between Apple ][ disk images and native filesystem"
  homepage "https://applecommander.github.io/"
  url "https://github.com/AppleCommander/AppleCommander/releases/download/1.8.0/AppleCommander-macosx-x86_64-1.8.0.jar"
  sha256 "0b21e2fafa0725b52d4468ce6fc212bd1ee051062d42b2a5079a678e2d2f7220"

  depends_on "openjdk"

  def install
    libexec.install "AppleCommander-macosx-x86_64-#{version}.jar"
    bin.write_jar_script libexec/"AppleCommander-macosx-x86_64-#{version}.jar", "applecommander", "-XstartOnFirstThread"
  end

  def caveats
    "Run by typing `applecommander` in the terminal."
  end

  test do
    system "false"
  end
end
