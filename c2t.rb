class C2t < Formula
  desc "Retro Code (Apple II, Cosmac VIP) to Tape/Text"
  homepage "https://github.com/datajerk/c2t"
  url "https://github.com/datajerk/c2t/archive/v0.997.tar.gz"
  sha256 "bcf3b0fc596b8e77c6647f489e093380419f577e5dd334e902a9158674b43582"
  head "https://github.com/datajerk/c2t.git"

  depends_on "cc65" => :build

  def install
    system "make", "clean"
    system "make"
    bin.install "bin/c2t"
    bin.install "bin/c2t-96h"
  end

  test do
    system "make", "test" # Fails
  end
end
