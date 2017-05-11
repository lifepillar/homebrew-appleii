class Octalyzer < Formula
  desc "Apple //e Emulator for Millennials!"
  homepage "http://octalyzer.com/"
  url "http://yewsi.com/octalyzer/octalyzer-mac.zip"
  version "2017-03-27"
  sha256 "61eaae09738af5df08be897a877cb723edafc05473ab9e5fd7952f09447929a3"

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
