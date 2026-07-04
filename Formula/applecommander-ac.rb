class ApplecommanderAc < Formula
  desc "Move data between Apple ][ disk images and native filesystem"
  homepage "https://applecommander.github.io/"
  url "https://github.com/AppleCommander/AppleCommander/releases/download/13.1/AppleCommander-ac-13.1.jar"
  sha256 "49ef0e028120c84a42264b054fb208a52792ffb7e6b2e96bd516cabb93fe056e"

  depends_on "openjdk"

  def install
    libexec.install "AppleCommander-ac-#{version}.jar"
    bin.write_jar_script libexec/"AppleCommander-ac-#{version}.jar", "ac"
  end

  def caveats
    "The command-line executable is called `ac`."
  end

  test do
    system "false"
  end
end
