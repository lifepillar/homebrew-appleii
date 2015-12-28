class Epple2 < Formula
  desc "Emulator of the original APPLE ][ and APPLE ][ PLUS computers"
  homepage "http://mosher.mine.nu/epple2"
  url "https://github.com/cmosher01/Epple-II.git",
       :revision => "c50307a571b27f6de241fb609f94439c455bcd9b"
  version "c50307a5"
  head "https://github.com/cmosher01/Epple-II.git"

  depends_on "apple-ii-disk-tools"
  depends_on "automake" => :build
  depends_on "autoconf" => :build
  depends_on "sdl2"
  # For apple2sys:
  depends_on "xa" => :build

  needs :cxx11

  resource "apple2sys" do
    url "http://mosher.mine.nu/apple2/download/apple2sys-latest.tar.gz"
    version "1.1"
    sha256 "0fa87ae28035e3e1ec1d686e277e67e5b27b34cea5e2875a255f5a0e8f705197"
  end

  def install
    ENV.cxx11
    ENV.append "CXXFLAGS", "-DETCDIR=\\\"#{etc}\\\""

    resource("apple2sys").stage do
      system "./configure", "--prefix=#{prefix}"
      system "make", "install"
    end

    opts = []
    opts << "--disable-dependency-tracking"
    opts << "--disable-silent-rules"
    opts << "--prefix=#{prefix}"

    system "autoreconf", "--install"
    system "./configure", *opts
    system "make", "install"
    # Rename default configuration file and install epple2.conf manually,
    # so that it won't be deleted if epple2 is removed.
    File.rename prefix/"etc/epple2/epple2.conf", prefix/"etc/epple2/epple2.conf.default"
    (etc/"epple2").install "conf/epple2.conf" unless File.exist?(etc/"epple2/epple2.conf")
  end

  def caveats; <<-EOS.undent
    Configuration files are in #{etc}/epple2.
    If, after upgrading, you get warnings about missing files,
    try removing #{etc}/epple2 and reinstall epple2.

    Use Cmd-Alt-Esc to quit Epple ][ when in full-screen mode.
    EOS
  end

  test do
    system "false"
  end
end
