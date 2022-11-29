class Epple2 < Formula
  desc "Emulator of the Apple ][ computer"
  homepage "http://mosher.mine.nu/epple2"
  url "https://github.com/cmosher01/Epple-II/archive/refs/tags/1.1.1.tar.gz"
  sha256 "4dde05482fd0a548e12d8976030fb9dff4e2f6268717963678f536f0c3a6327d"
  head "https://github.com/cmosher01/Epple-II.git"

  depends_on "cmake" => :build
  # For apple2sys:
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "xa" => :build
  depends_on "sdl2"

  resource "apple2sys" do
    url "https://github.com/cmosher01/Apple-II-Source/archive/refs/tags/1.2.0.tar.gz"
    sha256 "fee4fcf4730784ac506edfafabb9dcbcc377af67cb5c71ff8ace2029dc0bb76a"
  end

  def install
    ENV.cxx11
    ENV.append "CXXFLAGS", "-DETCDIR=\\\"#{etc}\\\""

    resource("apple2sys").stage do
      system "./bootstrap", "--skip-po"
      system "./configure", "--prefix=#{prefix}"
      system "make", "install"
    end

    system "cmake", "--install-prefix=#{prefix}", "."
    system "make"
    bin.install "src/epple2"
    if not Dir.exist? etc/"epple2"
      (etc/"epple2").install Pathname.glob("conf/*.conf")
    end
  end

  def caveats
    <<~EOS
      Please read Warnings about copyright here:

          https://cmosher01.github.io/Apple-II-Source/

      Configuration files are in #{etc}/epple2.

      After upgrading you may need to update the import path in
          #{etc}/epple2/epple2.conf
    EOS
  end

  test do
    system "false"
  end
end
