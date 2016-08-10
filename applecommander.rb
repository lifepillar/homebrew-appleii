class Applecommander < Formula
  desc "Move data between Apple ][ disk images and native filesystem"
  homepage "http://applecommander.sourceforge.net"
  # The version from sites.google.com is more recent than the ones from SourceForge
  url "https://sites.google.com/site/drjohnbmatthews/applecommander/AppleCommander-1.3.5.14-ac.jar"
  sha256 "84077fd4990398a6212a3ac2450c15979c071497c34a680666c9e24db5b4330b"

  depends_on :java => "1.6+" # Not tested with previous versions

  def install
    libexec.install "AppleCommander-1.3.5.14-ac.jar"
    bin.write_jar_script libexec/"AppleCommander-1.3.5.14-ac.jar", "applecommander"
  end

  def caveats; <<-EOS.undent
    The command-line executable is called `applecommander`.
    EOS
  end

  test do
    system "false"
  end
end
