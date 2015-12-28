class AppleIiDiskTools < Formula
  desc "Utilities for Apple ][ floppy disk images"
  homepage "https://github.com/cmosher01/Apple-II-Disk-Tools"
  # In the following archive, src/ctest is mistakenly empty:
  # url "https://github.com/cmosher01/Apple-II-Disk-Tools/archive/1.1.tar.gz"
  # sha256 "fc84650bdd7f2f7d7a7f40914ec4b8e7bacb15377f70bf9ea0b1e2f60a16e7e2"
  url "http://mosher.mine.nu/apple2/download/a2catalog-latest.tar.gz"
  version "1.1"
  sha256 "798e6fcdcf7add395f9e741f9afc2d323e10d4d839a6d4cb2b09c101058afc57"
  head "https://github.com/cmosher01/Apple-II-Disk-Tools.git"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "gettext"

  def install
    system "./bootstrap --skip-po"
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "a2catalog -T"
    system "a2nibblize -T"
  end
end
