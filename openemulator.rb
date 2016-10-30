class Openemulator < Formula
  desc "Accurate, portable emulator of legacy computer systems"
  homepage "https://github.com/OpenEmulatorProject/OpenEmulator-OSX"
  url "https://github.com/OpenEmulatorProject/OpenEmulator-OSX.git",
       :branch => "develop",
       :revision => "4bef515645531d6574c6d10e305f9c0f17bbcba6"
  version "4bef5156"
  head "https://github.com/OpenEmulatorProject/OpenEmulator-OSX.git", :branch => "develop"

  depends_on "flac"
  depends_on "libpng"
  depends_on "libsamplerate"
  depends_on "libsndfile"
  depends_on "libzip"
  depends_on "portaudio"

  def install
    header_paths = [
      "/usr/include/libxml2",
      Formula["flac"].include,
      Formula["libpng"].include/"libpng16",
      Formula["portaudio"].include,
      Formula["libsamplerate"].include,
      Formula["libsndfile"].include,
      Formula["libzip"].include,
      Formula["libzip"].lib/"libzip/include",

    ]

    library_paths = [
      HOMEBREW_PREFIX/"lib",
      Formula["flac"].lib,
    ]
    library_paths << Formula["libpng"].lib if MacOS.version <= :lion

    args = [
      "-configuration", "Release",
      "-alltargets",
      "MACOSX_DEPLOYMENT_TARGET=#{MacOS.version}",
      "SYMROOT=build",
      "PREFIX=#{prefix}",
      "ARCHS=x86_64",
      "HEADER_SEARCH_PATHS=#{header_paths.join(" ")}",
      "LIBRARY_SEARCH_PATHS=#{library_paths.join(" ")}"
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
