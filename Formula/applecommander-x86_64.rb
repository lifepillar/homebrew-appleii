class ApplecommanderX8664 < Formula
  desc "Move data between Apple ][ disk images and native filesystem"
  homepage "https://applecommander.github.io/"
  url "https://github.com/AppleCommander/AppleCommander/releases/download/1.7.0/AppleCommander-macosx-x86_64-1.7.0.jar"
  sha256 "d353d2932c6aab018b216d120a8534413b0dee55f2d22a4618c37fd467145383"

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
