class ApplecommanderAc < Formula
  desc "Move data between Apple ][ disk images and native filesystem"
  homepage "https://applecommander.github.io/"
  url "https://github.com/AppleCommander/AppleCommander/releases/download/1.8.0/AppleCommander-ac-1.8.0.jar"
  sha256 "748cfe74bd21a20b80556359e27cb65f890e32db228da777f60c4067315bd1f2"

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
