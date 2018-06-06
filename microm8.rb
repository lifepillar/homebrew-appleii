class Microm8 < Formula
  desc "The next generation of emulators"
  homepage "https://paleotronic.com/microm8/"
  url "https://paleotronic.com/download/microm8-mac.zip"
  version "0.0.1alpha-201806061356" # build 201806061356
  sha256 "8b2d856af8dbb86ffdf550a757f288a9e142c901dbe8e58d104edbc3720e7a37"

  def install
    bin.install "microm8"
  end

  def caveats; <<~EOS
    To get started:
        microm8 -help
    EOS
  end

  test do
    system "#{bin}/microm8" "-version"
  end
end
