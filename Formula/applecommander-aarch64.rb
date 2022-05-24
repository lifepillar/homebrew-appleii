class ApplecommanderAarch64 < Formula
  desc "Move data between Apple ][ disk images and native filesystem"
  homepage "https://applecommander.github.io/"
  url "https://github.com/AppleCommander/AppleCommander/releases/download/1.8.0/AppleCommander-macosx-aarch64-1.8.0.jar"
  sha256 "c54e350bc4d9414786a4006a78a49536cbe6b1e2dffa194e44163c068f7d9fc8"

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
