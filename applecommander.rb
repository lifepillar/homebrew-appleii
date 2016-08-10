class Applecommander < Formula
  desc "Move data between Apple ][ disk images and native filesystem"
  homepage "http://applecommander.sourceforge.net"
  # The version from sites.google.com is more recent than the ones from SourceForge
  url "https://sites.google.com/site/drjohnbmatthews/applecommander/AppleCommander-1.3.5.14-ac.jar"
  sha256 "84077fd4990398a6212a3ac2450c15979c071497c34a680666c9e24db5b4330b"

  option "with-gui", "Additionally install the GUI."

  depends_on :java => "1.6+" # Not tested with previous versions

  if build.with? "gui"
    resource "AppleCommander-GUI" do
      url "https://sites.google.com/site/drjohnbmatthews/applecommander/AppleCommander-1.3.5.14.jar"
      sha256 "103531d7d06a9d607aebb0a2abc0e0e72ee26313e9ec0110f6d0ad210f8fba46"
    end
  end

  def install
    libexec.install "AppleCommander-1.3.5.14-ac.jar"
    bin.write_jar_script libexec/"AppleCommander-1.3.5.14-ac.jar", "applecommander"
    if build.with? "gui"
      resource("AppleCommander-GUI").stage do
        libexec.install "AppleCommander-1.3.5.14.jar"
        bin.write_jar_script libexec/"AppleCommander-1.3.5.14.jar", "applecommander-gui"
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
