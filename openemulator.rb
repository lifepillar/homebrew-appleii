class Openemulator < Formula
  homepage "https://github.com/OpenEmulatorProject/OpenEmulator-OSX"
  url "https://github.com/OpenEmulatorProject/OpenEmulator-OSX.git"

  depends_on "libpng"
  depends_on "libsndfile"
  depends_on "libsamplerate"
  depends_on "libzip"
  depends_on "portaudio"

  def install
    xcodebuild "-configuration", "Release", "SYMROOT=build", "PREFIX=#{prefix}", "ONLY_ACTIVE_ARCH=YES",
      "HEADER_SEARCH_PATHS=#{Formula["libzip"].lib}/libzip/include /usr/include/libxml2 #{Formula["libpng"].include}/libpng16",
      "LIBRARY_SEARCH_PATHS=#{Formula["libpng"].lib}",
      "OTHER_LDFLAGS=-F#{r_opt_prefix}"
    prefix.install "macosx/build/Release/OpenEmulator.app"
  end

  test do
    system "false"
  end
end
