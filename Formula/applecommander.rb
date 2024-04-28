class Applecommander < Formula
  if Hardware::CPU.intel?
    url "https://github.com/AppleCommander/AppleCommander/releases/download/1.9.0/AppleCommander-macosx-x86_64-1.9.0.jar"
    sha256 "1a7eebfb41aebebd8f72655bd9a9a288ede9db8ff3e1ca96b10aafda57e79d96"
  else
    url "https://github.com/AppleCommander/AppleCommander/releases/download/1.9.0/AppleCommander-macosx-aarch64-1.9.0.jar"
    sha256 "e819705babe2aa14ac979208de3a4642506a9195b03bd966277849790bbf2401"
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
