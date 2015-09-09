class Pom1 < Formula
  desc "Apple I emulator"
  homepage "http://pom1.sourceforge.net"
  url "https://downloads.sourceforge.net/project/pom1/pom1/1.0.0/pom1-1.0.0.tar.gz"
  sha256 "8a1088be1628f593c9d00b0e91d47a3820016d4d2b80a4b047cfedf61b34c9c4"

  depends_on "sdl"

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "false"
  end
end
