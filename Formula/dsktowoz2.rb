class Dsktowoz2 < Formula
  desc "Converts Apple ][ DSK images to new WOZ2 format images"
  homepage "https://github.com/cmosher01/DskToWoz2"
  url "https://github.com/cmosher01/DskToWoz2/archive/v1.0.4.tar.gz"
  sha256 "d64f4ca4cf06c1a34fc5c9fe983da9ddb11b4ff6747eae111d286ecbd83b05e3"

  depends_on "qt"

  def install
    system "qmake"
    system "make"
    libexec.install "dsktowoz2.app"
  end

  def caveats; <<~EOS
    dsktowoz2.app was installed in #{libexec}.

    You may create a symlink into /Applications or ~/Applications:

    ln -Fs '#{libexec}/dsktowoz2.app' /Applications/DskToWoz2.app
  EOS
  end

  test do
    system "false"
  end
end
