class C2t < Formula
  desc "Retro Code (Apple II, Cosmac VIP) to Tape/Text"
  homepage "https://github.com/datajerk/c2t"
  url "https://github.com/datajerk/c2t.git",
    revision: "6c20c17fd21d522315fa232c49b64adc65cf9460"
  version "6c20c17f"
  sha256 "bcf3b0fc596b8e77c6647f489e093380419f577e5dd334e902a9158674b43582"

  def install
    ENV.deparallelize
    system "make", "clean"
    system "make", "macos"

    if Hardware::CPU.arm?
      bin.install "bin/c2t_arm" => "c2t"
      bin.install "bin/c2t-96h_arm" => "c2t-96h"
    else
      bin.install "bin/c2t"
      bin.install "bin/c2t-96h"
    end
  end

  test do
    system "false"
  end
end
