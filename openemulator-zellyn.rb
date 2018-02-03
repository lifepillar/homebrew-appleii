class OpenemulatorZellyn < Formula
  desc "Zellyn fork of OpenEmulator with IIe support!"
  homepage "https://github.com/zellyn/OpenEmulator-OSX"
  url "https://github.com/zellyn/OpenEmulator-OSX.git",
       :branch => "iie",
       :revision => "e149425f779c31cbf6a11ab1cb06fa53e7fadd05"
  version "e149425f"
  head "https://github.com/zellyn/OpenEmulator-OSX.git", :branch => "iie"

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

  def caveats; <<~EOS
    Openemulator.app has been installed in #{opt_prefix}.
    You may create an alias in your Applications folder if you want.
    EOS
  end

  test do
    system "false"
  end
end
