class ApplecommanderAcx < Formula
  desc "Move data between Apple ][ disk images and native filesystem"
  homepage "https://applecommander.github.io/"
  url "https://github.com/AppleCommander/AppleCommander/releases/download/1.11.0/AppleCommander-acx-1.11.0.jar"
  sha256 "bfd2d2cd4ec7db9b36ec846a56ca89651c0b1be7f95f636c4cf57c336e3087eb"

  depends_on "openjdk"

  def install
    libexec.install "AppleCommander-acx-#{version}.jar"
    bin.write_jar_script libexec/"AppleCommander-acx-#{version}.jar", "acx"
  end

  def caveats
    "The command-line executable is called `acx`."
  end

  test do
    system "false"
  end
end
