class ApplecommanderAcx < Formula
  desc "Move data between Apple ][ disk images and native filesystem"
  homepage "https://applecommander.github.io/"
  url "https://github.com/AppleCommander/AppleCommander/releases/download/1.10.1/AppleCommander-acx-1.10.1.jar"
  sha256 "7782d9b495de76fcb708e6b6b19617cdcce8f357c2bd5f080684898855a1ec79"

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
