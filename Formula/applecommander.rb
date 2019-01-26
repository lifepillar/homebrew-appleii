class Applecommander < Formula
  desc "Move data between Apple ][ disk images and native filesystem"
  homepage "http://applecommander.github.io"
  url "https://github.com/AppleCommander/AppleCommander/releases/download/v1-5-0/AppleCommander-ac-1.5.0.jar"
  sha256 "4994afa46b67b30dd74c1964caca94c8df1a6e8e9bad3e141ecb3a4519256eb2"

  option "with-gui", "Additionally install the GUI."

  depends_on :java => "1.8+" # Not tested with previous versions

  if build.with? "gui"
    resource "AppleCommander-GUI" do
      url "https://github.com/AppleCommander/AppleCommander/releases/download/v1-4-0/AppleCommander-macosx-1.4.0.jar"
      sha256 "e35ce5676f8329da3f61e4a6be3dc9f5c0776524033889473db0c4c663e503be"
    end
  end

  def install
    libexec.install "AppleCommander-ac-1.4.0.jar"
    bin.write_jar_script libexec/"AppleCommander-ac-1.4.0.jar", "applecommander"
    if build.with? "gui"
      resource("AppleCommander-GUI").stage do
        libexec.install "AppleCommander-macosx-1.4.0.jar"
        bin.write_jar_script libexec/"AppleCommander-macosx-1.4.0.jar", "applecommander-gui", "-XstartOnFirstThread"
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
