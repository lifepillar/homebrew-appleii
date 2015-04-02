class Pom1 < Formula
  homepage "http://pom1.sourceforge.net"
  url "https://downloads.sourceforge.net/project/pom1/pom1/1.0.0/pom1-1.0.0.tar.gz"
  sha256 "44f7c5278773397cc98d14b5ff3422770f05caa4e8af5f65487c24aaa82ebc85"

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
