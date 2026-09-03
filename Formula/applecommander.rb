class Applecommander < Formula
  if Hardware::CPU.intel?
    url "https://github.com/AppleCommander/AppleCommander/releases/download/14.1/AppleCommander-macosx-x86_64-14.1.jar"
    sha256 "ae8925e1785effaecd325d0bc081339acc33fb87c54b4d4de4034c16d4831a86"
  else
    url "https://github.com/AppleCommander/AppleCommander/releases/download/14.1/AppleCommander-macosx-aarch64-14.1.jar"
    sha256 "a712cf7f2f751a4656a50e96f0bf4fa3dea3c9837249bac4117368e307f411b6"
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
    "This formula is DEPRECATED and will be eventually removed. Use `brew install --cask applecommander` instead."
  end

  test do
    system "false"
  end
end
