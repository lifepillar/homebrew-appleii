class Dsktowoz2 < Formula
  desc "Converts Apple ][ DSK images to new WOZ2 format images"
  homepage "https://github.com/cmosher01/DskToWoz2"
  url "https://github.com/cmosher01/DskToWoz2/archive/v1.0.8.tar.gz"
  sha256 "9b972bec289db17e10e609209d19c395ae382636b9bf798fdab566b185236bb8"

  depends_on "qt@5"

  def install
    system "qmake"
    system "make"
    libexec.install "dsktowoz2.app"
  end

  def caveats
    <<~EOS
      dsktowoz2.app was installed in #{libexec}.

      You may create a symlink into /Applications or ~/Applications:

      ln -Fs '#{libexec}/dsktowoz2.app' /Applications/DskToWoz2.app
    EOS
  end

  test do
    system "false"
  end
end
