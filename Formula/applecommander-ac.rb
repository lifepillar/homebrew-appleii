class ApplecommanderAc < Formula
  desc "Move data between Apple ][ disk images and native filesystem"
  homepage "https://applecommander.github.io/"
  url "https://github.com/AppleCommander/AppleCommander/releases/download/13.0/AppleCommander-ac-13.0.jar"
  sha256 "2860b0a2e5a405dbcf3b58fdbd71cabff1e2204a8d066762198125b190e16855"

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
