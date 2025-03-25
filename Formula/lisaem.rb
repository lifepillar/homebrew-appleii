class Lisaem < Formula
  desc "Fully functional Lisa Emulator"
  homepage "https://lisaem.sunder.net/"
  url "https://github.com/arcanebyte/lisaem/archive/refs/tags/RC5-2025.03.15.tar.gz"
  version "1.2.7-2025.03.15"
  sha256 "29ac35a43a98c693ec85206256fa2450a3371fab2bc0d2da2fc02dd87c1a3e2e"
  head "https://github.com/arcanebyte/lisaem.git"

  depends_on "sdl2"

  resource "wxWidgets" do
    url "https://github.com/wxWidgets/wxWidgets/releases/download/v3.2.5/wxWidgets-3.2.5.tar.bz2"
    sha256 "0ad86a3ad3e2e519b6a705248fc9226e3a09bbf069c6c692a02acf7c2d1c6b51"
  end

  def install
    cd "scripts" do
      resource("wxWidgets").unpack "wxWidgets-3.2.5"
      inreplace "build-wx3.2.5-modern-macosx.sh" do |s|
        # build only 64-bit on >= 10.14
        s.gsub! "\"$OSVER\" > \"macOS-10.14\"", "\"$OSVER\" > \"macOS-10.13\""
        s.gsub! "--prefix=/usr/local/wx${VER}-${TYPE}", "--prefix=#{buildpath}/../wxWidgets"
        s.gsub! "&& sudo make", "&& make"
      end
      system "./build-wx3.2.5-modern-macosx.sh", "--no-minimum-macos"
    end

    inreplace "build.sh", "# replace machine type", "SOFTWARE='LisaEm' #"
    inreplace "bashbuild/Darwin.sys", "macosx10", "macosx1"

    ENV.prepend_path "PATH", buildpath/"../wxWidgets/bin" # for wx-config
    system "./build.sh", "build", "--quiet", "--no-upx", "--prefix=#{prefix}"

    libexec.install "bin/LisaEm.app"
    bin.install Dir["bin/*.*/*"]
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
