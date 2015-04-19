class Epple2 < Formula
  homepage "http://mosher.mine.nu/epple2"
  url "https://github.com/cmosher01/Epple-II.git"

  depends_on :x11
  depends_on "sdl2"
  # For epple2sys:
  depends_on "m4" => :build
  depends_on "xa" => :build

  needs :cxx11

  resource "epple2sys" do
    url "http://mosher.mine.nu/epple2/download/epple2sys-latest.tar.gz"
    version "1.1"
    sha256 "653c89bde1c4093d625d8b9fe6b8b008b43ccbe6160d92a02965153508450638"
  end

  def install
    ENV.cxx11

    resource("epple2sys").stage do
      system "./configure", "--prefix=#{prefix}"
      system "make", "install"
    end

    opts = []
    opts << "--disable-dependency-tracking"
    opts << "--disable-silent-rules" if build.head?
    opts << "--prefix=#{prefix}"

    system "./configure", *opts
    system "make", "install"
  end

  def caveats; <<-EOS.undent
    Configuration files are in #{etc}/epple2.
    EOS
  end

  test do
    system "false"
  end
end
