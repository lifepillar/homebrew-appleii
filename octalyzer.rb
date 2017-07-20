class Octalyzer < Formula
  desc "Apple //e Emulator for Millennials!"
  homepage "http://octalyzer.com/"
  url "http://yewsi.com/octalyzer/octalyzer-mac.zip"
  version "0.0.1alpha-201707191230"
  sha256 "9306de993c8e99f875694ca998e8ab985b9f6508e423d5339b13a6e65dd40b66"

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
