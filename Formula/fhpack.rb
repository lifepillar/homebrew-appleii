class Fhpack < Formula
  desc "Compression for Apple II hi-res images"
  homepage "https://github.com/fadden/fhpack"
  url "https://github.com/fadden/fhpack.git",
    :revision => "8a83b45203e346c975be25d505013c8033655b94"
  version "20150815"

  def install
    system ENV.cxx, "-O2", "-o", "fhpack", "fhpack.cpp"
    bin.install "fhpack"
  end

  test do
    system "#{bin}/fhpack"
  end
end
