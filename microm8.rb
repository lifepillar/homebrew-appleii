class Microm8 < Formula
  desc "The next generation of emulators"
  homepage "http://www.microm8.com"
  url "http://microm8.com/download/microm8-mac.zip"
  version "0.0.1alpha" # build 201712301427
  sha256 "a285a02f33143503968b23274d62c3fe958e2438d94341c59fae6aa8d5a00717"

  def install
    bin.install "microm8"
  end

  def caveats; <<-EOS.undent
    To get started:
        microm8 -help
    EOS
  end

  test do
    system "#{bin}/microm8" "-version"
  end
end
