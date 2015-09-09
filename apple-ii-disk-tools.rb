class AppleIiDiskTools < Formula
  desc "Utilities for Apple ][ floppy disk images"
  homepage "https://github.com/cmosher01/Apple-II-Disk-Tools"
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
