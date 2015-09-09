class Epple2 < Formula
  desc "An emulator of the original APPLE ][ and APPLE ][ PLUS computers"
  homepage "http://mosher.mine.nu/epple2"
  url "https://github.com/cmosher01/Epple-II.git", :revision => "130d2b4ac4333062f30d0e6ae5b668228e3cc36f"
  version "130d2b4ac"
  head "https://github.com/cmosher01/Epple-II.git"

  depends_on "automake" => :build
  depends_on "autoconf" => :build
  depends_on "sdl2"
  # For epple2sys:
  depends_on "xa" => :build

  needs :cxx11

  resource "epple2sys" do
    url "http://mosher.mine.nu/epple2/download/epple2sys-latest.tar.gz"
    version "1.1"
    sha256 "653c89bde1c4093d625d8b9fe6b8b008b43ccbe6160d92a02965153508450638"
  end

  def install
    ENV.cxx11
    ENV.append "CXXFLAGS", "-DETCDIR=\\\"#{etc}\\\""

    resource("epple2sys").stage do
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

    Use Cmd-Alt-Esc to quit Epple ][ when in full-screen mode.
    EOS
  end

  test do
    system "false"
  end
end
