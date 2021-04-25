class Lisaem < Formula
  desc "Fully functional Lisa Emulator™"
  homepage "https://lisaem.sunder.net/"
  url "https://lisaem.sunder.net/downloads/lisaem-1.2.7-RC3a-2020.08.24-src.tar.xz"
  version "1.2.7-2020.08.24"
  sha256 "0920c16c8e0c4896d5070c8d6350aa26d717c6d7dcb46155110767b7e8a5b98c"
  head "https://github.com/rayarachelian/lisaem.git"

  depends_on "sdl2"
  depends_on "xz"

  resource "wxWidgets" do
    url "https://github.com/wxWidgets/wxWidgets/releases/download/v3.1.3/wxWidgets-3.1.3.tar.bz2"
    sha256 "fffc1d34dac54ff7008df327907984b156c50cff5a2f36ee3da6052744ab554a"
  end

  def install
    cd "scripts" do
      resource("wxWidgets").unpack buildpath/"wxWidgets-3.1.3"
      inreplace "build-wx3.1.2-modern-macosx.sh" do |s|
        # build for current OS rather than latest SDK
        s.gsub! "[[ -z \"$MIN_MACOSX_VERSION\" ]] && ", ""
        s.gsub! "for VER in 3.1.2; do\n", "for VER in 3.1.3; do\n#"
        # build for only x86_64 on >= 10.14
        s.gsub! "\"$OSVER\" > \"macOS-10.14\"", "\"$OSVER\" > \"macOS-10.13\""
        s.gsub! "--prefix=/usr/local/wx${VER}-${TYPE}", "--prefix=#{buildpath}/../wxWidgets"
        s.gsub! "&& sudo make", "&& make"
      end
      system "./build-wx3.1.2-modern-macosx.sh"
    end

    ENV.prepend_path "PATH", buildpath/"../wxWidgets/bin" # for wx-config
    system "./build.sh", "build", "--quiet", "--no-upx", "--prefix=#{prefix}"

    bin.install Dir["bin/10.*/*"]
    libexec.install "bin/LisaEm.app"
  end

  def caveats
    <<~EOS
      LisaEm.app has been installed in #{opt_libexec}.
      You may create an alias in your Applications folder if you want.
    EOS
  end

  test do
    system bin/"lisadiskinfo"
  end
end
