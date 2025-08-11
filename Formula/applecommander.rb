class Applecommander < Formula
  if Hardware::CPU.intel?
    url "https://github.com/AppleCommander/AppleCommander/releases/download/1.11.0/AppleCommander-macosx-x86_64-1.11.0.jar"
    sha256 "037d37822e1d2ae3ea63a2e6e6156649fbff50090bc39543afe9178d5a23973b"
  else
    url "https://github.com/AppleCommander/AppleCommander/releases/download/1.11.0/AppleCommander-macosx-aarch64-1.11.0.jar"
    sha256 "4f13bc6776b261db73b8de673a071c8bd155b453e879aecac7aeda35f5893545"
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
