class Openemulator < Formula
  desc "Accurate, portable emulator of legacy computer systems"
  homepage "https://github.com/OpenEmulatorProject/OpenEmulator-OSX"
  url "https://github.com/OpenEmulatorProject/OpenEmulator-OSX.git",
    :revision => "77fbd285084cca14252998c871115eea6136509d"
  version "20200407" # Date of commit
  head "https://github.com/OpenEmulatorProject/OpenEmulator-OSX.git",
    :branch   => "develop"

  depends_on "cmake" => :build
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

    system "cmake", "-Hmodules/libemulation", "-Bmodules/libemulation/build", "-DCMAKE_BUILD_TYPE=Release"
    system "cmake", "--build", "modules/libemulation/build", "--config", "Release"
    xcodebuild "-configuration", "Release", "SYMROOT=build", "PREFIX=#{prefix}"
    prefix.install "build/Release/OpenEmulator.app"
  end

  def caveats
    <<~EOS
      Openemulator.app has been installed in #{opt_prefix}.
      You may create an alias in your Applications folder if you want.
    EOS
  end

  test do
    system "false"
  end
end
