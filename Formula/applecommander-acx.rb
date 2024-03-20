class ApplecommanderAcx < Formula
  desc "Move data between Apple ][ disk images and native filesystem"
  homepage "https://applecommander.github.io/"
  url "https://github.com/AppleCommander/AppleCommander/releases/download/1.9.0/AppleCommander-acx-1.9.0.jar"
  sha256 "b884f240f2e4290daaa436597f83e5896afc7182fd123a7437a1190e3f3ef1ce"

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
