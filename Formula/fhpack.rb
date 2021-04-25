class Fhpack < Formula
  desc "Compression for Apple II hi-res images"
  homepage "https://github.com/fadden/fhpack"
  url "https://github.com/fadden/fhpack.git",
    :revision => "61b7c1cb8e9b9216a04264d4685b9990f15745ac"
  version "20200730"

  def install
    system ENV.cxx, "-O2", "-o", "fhpack", "fhpack.cpp"
    bin.install "fhpack"
  end

  test do
    system "#{bin}/fhpack"
  end
end
