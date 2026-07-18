class Applecommander < Formula
  if Hardware::CPU.intel?
    url "https://github.com/AppleCommander/AppleCommander/releases/download/13.2/AppleCommander-macosx-x86_64-13.2.jar"
    sha256 "e8e5bdf0288270f46b1f046ead77d54e6ead9e412dd7b80d1581184707977598"
  else
    url "https://github.com/AppleCommander/AppleCommander/releases/download/13.2/AppleCommander-macosx-aarch64-13.2.jar"
    sha256 "b76cbc06ed98df057e94a710888324f4bee184d16371dc393ce14699ba3ec1bf"
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
