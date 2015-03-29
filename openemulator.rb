class Openemulator < Formula
  homepage "https://github.com/OpenEmulatorProject/OpenEmulator-OSX"
  url "https://github.com/OpenEmulatorProject/OpenEmulator-OSX.git"

  depends_on "libpng"
  depends_on "libsamplerate"
  depends_on "libsndfile"
  depends_on "libzip"
  depends_on "portaudio"

  def install
    header_paths = []
    header_paths << "/usr/include/libxml2"
    header_paths << Formula["libpng"].include/"libpng16"
    header_paths << Formula["libsamplerate"].include
    header_paths << Formula["libsndfile"].include
    header_paths << Formula["libzip"].include << Formula["libzip"].lib/"libzip/include"
    header_paths << Formula["portaudio"].include

    library_paths = []
    library_paths << HOMEBREW_PREFIX/"lib"

    xcodebuild "-configuration", "Release", "SYMROOT=build", "PREFIX=#{prefix}", "ONLY_ACTIVE_ARCH=YES",
      "HEADER_SEARCH_PATHS=#{header_paths.join(' ')}", "LIBRARY_SEARCH_PATHS=#{library_paths.join(' ')}"
    prefix.install "build/Release/OpenEmulator.app"
  end

  test do
    system "false"
  end
end
