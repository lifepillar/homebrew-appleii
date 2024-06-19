class Dos33fsprogs < Formula
  desc "Apple DOS 3.3 filesystem tools"
  homepage "http://www.deater.net/weave/vmwprod/apple/dos33fs.html"
  url "https://github.com/deater/dos33fsprogs/archive/refs/tags/tfv004.tar.gz"
  version "tfv004"
  sha256 "8bcc36e6d7fca9319fca085783a9aa13606a19a67d5ec643aa4c5c902af7c4f1"
  head "https://github.com/deater/dos33fsprogs.git"

  def install
    mkdir_p bin
    inreplace "Makefile.inc", "/usr/local/bin", bin
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
