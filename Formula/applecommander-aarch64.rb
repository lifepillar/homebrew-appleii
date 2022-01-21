class ApplecommanderAarch64 < Formula
  desc "Move data between Apple ][ disk images and native filesystem"
  homepage "https://applecommander.github.io/"
  url "https://github.com/AppleCommander/AppleCommander/releases/download/1.7.0/AppleCommander-macosx-aarch64-1.7.0.jar"
  sha256 "94b57f52998b4205999e255673daef3353411ce698913d95011a2d19a5c22caf"

  depends_on "openjdk"

  def install
    libexec.install "AppleCommander-macosx-aarch64-#{version}.jar"
    bin.write_jar_script libexec/"AppleCommander-macosx-aarch64-#{version}.jar", "applecommander", "-XstartOnFirstThread"
  end

  def caveats
    "Run by typing `applecommander` in the terminal."
  end

  test do
    system "false"
  end
end
