class ApplecommanderAcx < Formula
  desc "Move data between Apple ][ disk images and native filesystem"
  homepage "https://applecommander.github.io/"
  url "https://github.com/AppleCommander/AppleCommander/releases/download/12.0/AppleCommander-acx-12.0.jar"
  sha256 "495f15960a1ac778a0ad85db7a34b59634db485e4ddaf6a67574f2e92731c370"

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
