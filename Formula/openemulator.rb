class Openemulator < Formula
  desc "Accurate, portable emulator of legacy computer systems"
  homepage "https://github.com/OpenEmulatorProject/OpenEmulator-OSX"
  url "https://github.com/OpenEmulatorProject/OpenEmulator-OSX.git",
    :revision => "dc41cad2a741894f9e6c0a4b13caaf55fe2cd68f"
  version "20181226" # Date of commit
  head "https://github.com/OpenEmulatorProject/OpenEmulator-OSX.git",
    :branch   => "develop"

  depends_on "flac"
  depends_on "libpng"
  depends_on "libsamplerate"
  depends_on "libsndfile"
  depends_on "libzip"
  depends_on "portaudio"

  def install
    header_paths = [
      "/usr/include/libxml2",
      Formula["flac"].opt_include,
      Formula["libpng"].opt_include/"libpng16",
      Formula["portaudio"].opt_include,
      Formula["libsamplerate"].opt_include,
      Formula["libsndfile"].opt_include,
      Formula["libzip"].opt_include,
      Formula["libzip"].lib/"libzip/include",

    ]

    library_paths = [
      HOMEBREW_PREFIX/"lib",
      Formula["flac"].lib,
    ]
    library_paths << Formula["libpng"].lib # if MacOS.version <= :lion

    xcodebuild "-configuration", "Release",
      "-alltargets",
      "MACOSX_DEPLOYMENT_TARGET=#{MacOS.version}",
      "SYMROOT=build",
      "PREFIX=#{prefix}",
      "ARCHS=x86_64",
      "HEADER_SEARCH_PATHS=#{header_paths.join(" ")}",
      "LIBRARY_SEARCH_PATHS=#{library_paths.join(" ")}",
      "OTHER_LIBTOOLFLAGS=-L/usr/local/lib/ -lpng16 -search_paths_first"
    prefix.install "build/Release/OpenEmulator.app"
  end

  def caveats; <<~EOS
    Openemulator.app has been installed in #{opt_prefix}.
    You may create an alias in your Applications folder if you want.

    OpenEmulator does not contain any ROM file. See:
      https://github.com/OpenEmulatorProject/libemulation/issues/15

    ROM files must be copied into:
      #{opt_prefix}/OpenEmulator.app/Contents/Resources/roms
  EOS
  end

  test do
    system "false"
  end
end
