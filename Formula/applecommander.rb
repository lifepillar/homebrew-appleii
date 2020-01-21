class Applecommander < Formula
  desc "Move data between Apple ][ disk images and native filesystem"
  homepage "http://applecommander.github.io"
  url "https://github.com/AppleCommander/AppleCommander/releases/download/v1-6-0/AppleCommander-ac-1.6.0.jar"
  sha256 "7a6a9128798d5f1affc51963f0ab1684de592e41bf960be4ab4b2e5d994e0df6"

  option "with-gui", "Additionally install the GUI."

  depends_on :java => "1.8+" # Not tested with previous versions

  if build.with? "gui"
    resource "AppleCommander-GUI" do
      url "https://github.com/AppleCommander/AppleCommander/releases/download/v1-6-0/AppleCommander-macosx-1.6.0.jar"
      sha256 "fe15adf8967644cb08304864990f93a06ecf159c31a0c470247b1cb081fdb82c"
    end
  end

  def install
    libexec.install "AppleCommander-ac-1.6.0.jar"
    bin.write_jar_script libexec/"AppleCommander-ac-1.6.0.jar", "applecommander"
    if build.with? "gui"
      resource("AppleCommander-GUI").stage do
        libexec.install "AppleCommander-macosx-1.6.0.jar"
        bin.write_jar_script libexec/"AppleCommander-macosx-1.6.0.jar", "applecommander-gui", "-XstartOnFirstThread"
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
