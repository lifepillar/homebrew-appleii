class Openemulator < Formula
  desc "Accurate, portable emulator of legacy computer systems"
  homepage "https://github.com/openemulator/openemulator"
  url "https://github.com/openemulator/openemulator.git",
    revision: "85f75fe5c493e810b56ee96c0a0bbb640e0739b3"
  version "20200522" # Date of commit
  head "https://github.com/openemulator/openemulator.git"

  depends_on "cmake" => :build
  depends_on xcode: :build
  depends_on "flac"
  depends_on "libpng"
  depends_on "libsamplerate"
  depends_on "libsndfile"
  depends_on "libzip"
  depends_on "portaudio"

  def install
    arch = Hardware::CPU.arm? ? "arm64": "x86_64"
    system "cmake", "-Hmodules/libemulation", "-Bmodules/libemulation/build", "-DCMAKE_BUILD_TYPE=Release"
    system "cmake", "--build", "modules/libemulation/build", "--config", "Release"
    xcodebuild "-configuration", "Release", "-arch", arch, "SYMROOT=build", "PREFIX=#{prefix}"
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
