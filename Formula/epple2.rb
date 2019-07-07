class Epple2 < Formula
  desc "Emulator of the Apple ][ computer"
  homepage "http://mosher.mine.nu/epple2"
  url "https://github.com/cmosher01/Epple-II/archive/v1.0.4.tar.gz"
  sha256 "99030cfe4dfb320d7b7d4a5f4731dffc53f09729389da5eb99b013290872f729"
  head "https://github.com/cmosher01/Epple-II.git"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  # For apple2sys:
  depends_on "xa" => :build
  depends_on "sdl2"

  resource "apple2sys" do
    url "https://github.com/cmosher01/Apple-II-Source/archive/v1.1.2.tar.gz"
    sha256 "452a924e84d26e2ff0d9b29f42e32d485b0bb48ef0881ff5d2dff836e1f9c187"
  end

  def install
    ENV.cxx11
    ENV.append "CXXFLAGS", "-DETCDIR=\\\"#{etc}\\\""

    resource("apple2sys").stage do
      system "./bootstrap", "--skip-po"
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

  def caveats; <<~EOS
    Please read Warning Concerning Copyright Restrictions here:

        http://mosher.mine.nu/apple2/site/

    Configuration files are in #{etc}/epple2.

    After upgrading you may need to update the import path in
        #{etc}/epple2/epple2.conf
  EOS
  end

  test do
    system "false"
  end
end
