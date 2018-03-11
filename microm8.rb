class Microm8 < Formula
  desc "The next generation of emulators"
  homepage "http://www.microm8.com"
  url "http://microm8.com/download/microm8-mac.zip"
  version "0.0.1alpha-201802230153" # build 201802230153
  sha256 "4a1128038a49691b89e9e3717e7f7d79cad5243fa827946b2ee8bbd4578cca1c"

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
