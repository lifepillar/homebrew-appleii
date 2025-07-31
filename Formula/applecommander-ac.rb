class ApplecommanderAc < Formula
  desc "Move data between Apple ][ disk images and native filesystem"
  homepage "https://applecommander.github.io/"
  url "https://github.com/AppleCommander/AppleCommander/releases/download/1.10.1/AppleCommander-ac-1.10.1.jar"
  sha256 "d93595b74841e4c0e573a471310fb8c6ba5d84957850776cfd6f1c26fb63b3e4"

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
