class Applecommander < Formula
  if Hardware::CPU.intel?
    url "https://github.com/AppleCommander/AppleCommander/releases/download/13.1/AppleCommander-macosx-x86_64-13.1.jar"
    sha256 "dd5830588956a53f99141c6da30edab6e278e2fec6b2bae2c603a3242088124b"
  else
    url "https://github.com/AppleCommander/AppleCommander/releases/download/13.1/AppleCommander-macosx-aarch64-13.1.jar"
    sha256 "eac252992c8f5d9052221e0649d87412076bf04d85ce0e02babadd4d1f1b8e13"
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
