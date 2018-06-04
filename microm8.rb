class Microm8 < Formula
  desc "The next generation of emulators"
  homepage "https://paleotronic.com/microm8/"
  url "https://paleotronic.com/download/microm8-mac.zip"
  version "0.0.1alpha-201806041256" # build 201806041256 
  sha256 "f52948fba858b9e033152559fa90c370b28aac19b31d22b05e4b470ab110e231"

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
