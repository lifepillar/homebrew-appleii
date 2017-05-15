class Octalyzer < Formula
  desc "Apple //e Emulator for Millennials!"
  homepage "http://octalyzer.com/"
  url "http://yewsi.com/octalyzer/octalyzer-mac.zip"
  version "2017-05-15"
  sha256 "9c81f9f21f1f59d719be0e312b475b8bda3d4ff0764eba6cc84bb5274e01867a"

  def install
    bin.install "octalyzer"
  end

  def caveats; <<-EOS.undent
    To get started:
        octalyzer -help
    EOS
  end

  test do
    system "#{bin}/octalyzer" "-version"
  end
end
