class Octalyzer < Formula
  desc "Apple //e Emulator for Millennials!"
  homepage "http://octalyzer.com/"
  url "http://yewsi.com/octalyzer/octalyzer-mac.zip"
  version "0.0.1alpha-201706120217"
  sha256 "6ced69de88e79f59033ec9f824abb7fe6e55a11d82bf39bbb88a0ee254f32c1f"

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
