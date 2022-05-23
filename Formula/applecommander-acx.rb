class ApplecommanderAcx < Formula
  desc "Move data between Apple ][ disk images and native filesystem"
  homepage "https://applecommander.github.io/"
  url "https://github.com/AppleCommander/AppleCommander/releases/download/1.8.0/AppleCommander-acx-1.8.0.jar"
  sha256 "2a53ffbd82b8474c39720fa56df37af9a671735404f78fd0c61f02471239f72b"

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
