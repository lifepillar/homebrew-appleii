class ApplecommanderAc < Formula
  desc "Move data between Apple ][ disk images and native filesystem"
  homepage "https://applecommander.github.io/"
  url "https://github.com/AppleCommander/AppleCommander/releases/download/1.9.0/AppleCommander-ac-1.9.0.jar"
  sha256 "43f7112570139c6dc8dc89bcd09870ae1588b20ea7eb6ea500b6d407bbdba84d"

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
