class Epple2 < Formula
  desc "Emulator of the Apple ][ computer"
  homepage "http://mosher.mine.nu/epple2"
  url "https://github.com/cmosher01/Epple-II/archive/refs/tags/1.1.1.tar.gz"
  sha256 "4dde05482fd0a548e12d8976030fb9dff4e2f6268717963678f536f0c3a6327d"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "cmake" => :build
  depends_on "xa" => :build
  depends_on "sdl2"

  resource "apple2sys" do
    url "https://github.com/cmosher01/Apple-II-Source/archive/refs/tags/1.2.1.tar.gz"
    sha256 "4c27bb6f462ba766ad12cf094ef978336ee612648d830c52b929a7b3b419915f"
  end

  def install
    ENV.cxx11
    ENV.append "CXXFLAGS", "-DETCDIR=\\\"#{etc}\\\""

    resource("apple2sys").stage do
      system "./bootstrap", "--skip-po"
      system "./configure", "--prefix=#{prefix}"
      system "make", "install"
    end

    cd "rom" do
      system "make"
    end

    system "cmake", "--install-prefix=#{prefix}", "."
    system "make"
    bin.install "src/epple2"
    (lib/"epple2/system").install "rom/epple2sys.a65"
    (lib/"epple2/cards").install "rom/stdout.a65"
    (lib/"epple2/cards").install "rom/stdin.a65"
    (lib/"epple2/cards").install "rom/clock.a65"

    (etc/"epple2").install Pathname.glob("conf/*.conf") unless Dir.exist? etc/"epple2"
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
