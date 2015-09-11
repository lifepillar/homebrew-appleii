class Openemulator < Formula
  desc "An accurate, portable emulator of legacy computer systems"
  homepage "https://github.com/OpenEmulatorProject/OpenEmulator-OSX"
  head "https://github.com/OpenEmulatorProject/OpenEmulator-OSX.git", :branch => "develop"

  depends_on "libpng"
  depends_on "libsamplerate"
  depends_on "libsndfile"
  depends_on "libzip"
  depends_on "portaudio"

  def install
    header_paths = [
      "/usr/include/libxml2",
      Formula["libpng"].include/"libpng16",
      Formula["libsamplerate"].include,
      Formula["libsndfile"].include,
      Formula["libzip"].include,
      Formula["libzip"].lib/"libzip/include",
      Formula["portaudio"].include
    ]


    library_paths = [
      HOMEBREW_PREFIX/"lib"
    ]
    library_paths << Formula["libpng"].lib if MacOS.version <= :lion

    args = [
      "-sdk",
      "macosx#{MacOS.version}",
      "-configuration", "Release",
      "-alltargets",
      "MACOSX_DEPLOYMENT_TARGET=#{MacOS.version}",
      "SYMROOT=build",
      "PREFIX=#{prefix}",
      "ARCHS=x86_64",
      "HEADER_SEARCH_PATHS=#{header_paths.join(' ')}",
      "LIBRARY_SEARCH_PATHS=#{library_paths.join(' ')}"
    ]

    xcodebuild *args
    prefix.install "build/Release/OpenEmulator.app"
  end

  def caveats; <<-EOS.undent
    OpenEmulator does not contain any ROM file. See:

        https://github.com/OpenEmulatorProject/libemulation/issues/15

    ROM files must be copied inside #{prefix}/OpenEmulator.app/Contents/Resources/roms.
    EOS
  end

  test do
    system "false"
  end
end
