class Applecommander < Formula
  desc "Move data between Apple ][ disk images and native filesystem"
  homepage "http://applecommander.github.io"
  url "https://github.com/AppleCommander/AppleCommander/releases/download/v1-5-0/AppleCommander-ac-1.5.0.jar"
  sha256 "31f9989dd69148b865f1b135833327b2ea2462cfe038f1bde7ed30f55d19d588"

  option "with-gui", "Additionally install the GUI."

  depends_on :java => "1.8+" # Not tested with previous versions

  if build.with? "gui"
    resource "AppleCommander-GUI" do
      url "https://github.com/AppleCommander/AppleCommander/releases/download/v1-5-0/AppleCommander-macosx-1.5.0.jar"
      sha256 "91661cf06d99736c66e2f23e921239a7754ed5527d29943d4928473a6ac869fc"
    end
  end

  def install
    libexec.install "AppleCommander-ac-1.5.0.jar"
    bin.write_jar_script libexec/"AppleCommander-ac-1.5.0.jar", "applecommander"
    if build.with? "gui"
      resource("AppleCommander-GUI").stage do
        libexec.install "AppleCommander-macosx-1.5.0.jar"
        bin.write_jar_script libexec/"AppleCommander-macosx-1.5.0.jar", "applecommander-gui", "-XstartOnFirstThread"
      end
    end
  end

  def caveats
    s = "The command-line executable is called `applecommander`."
    if build.with? "gui"
      s += "\nTo run the GUI version use `applecommander-gui`."
    end
    s
  end

  test do
    system "false"
  end
end
