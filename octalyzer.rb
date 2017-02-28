class Octalyzer < Formula
  desc "Apple //e Emulator for Millennials!"
  homepage "http://octalyzer.com/"
  url "http://yewsi.com/octalyzer/octalyzer-mac.zip"
  version "0.0.1alpha"
  sha256 "99ec54d382623e252de0d347f39dd1fca4c32ae53625de6af2be63f5e9b1eda7"

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
