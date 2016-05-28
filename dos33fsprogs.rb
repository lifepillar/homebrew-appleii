class Dos33fsprogs < Formula
  desc "Apple DOS 3.3 filesystem tools"
  homepage "http://www.deater.net/weave/vmwprod/apple/dos33fs.html"
  url "http://www.deater.net/weave/vmwprod/apple/dos33fsprogs-0.0.10.tar.gz"
  sha256 "b7bcaddda5f403621c6551eb6ad67900e9c7fcd11b78c4ceced009a08725dd5a"
  head "https://github.com/deater/dos33fsprogs.git"

  def install
    mkdir_p bin
    if head?
      inreplace "Makefile.inc", "/usr/local/bin", bin
    else
      inreplace "Makefile", "/usr/local/bin", bin
    end
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
