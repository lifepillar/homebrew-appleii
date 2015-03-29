class Epple2 < Formula
  homepage "http://mosher.mine.nu/epple2"
  url "https://github.com/cmosher01/Epple-II.git"
  sha1 "ec13fbdaf14953a234f49b80dfda6a9502e18479"

  depends_on "autoconf" => :build
  depends_on "automake" => :build

  needs :cxx11

  def install
    ENV.cxx11

    system "autoreconf --install"
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "true"
  end
end
