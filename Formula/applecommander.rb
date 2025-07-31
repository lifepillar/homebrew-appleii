class Applecommander < Formula
  if Hardware::CPU.intel?
    url "https://github.com/AppleCommander/AppleCommander/releases/download/1.10.1/AppleCommander-macosx-x86_64-1.10.1.jar"
    sha256 "85720cc52793b1c79dd9df6c5adb697cc62318fd75c5319f27214f09d7a9a41e"
  else
    url "https://github.com/AppleCommander/AppleCommander/releases/download/1.10.1/AppleCommander-macosx-aarch64-1.10.1.jar"
    sha256 "e971232ed34122ea3485c79ac4a533a6c9b31bf1b15e720c7d26f42fd7e27063"
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
