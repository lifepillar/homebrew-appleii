class B2d < Formula
  desc "Convert modern graphics to Apple II graphics"
  homepage "http://www.appleoldies.ca/bmp2dhr/"
  url "http://www.appleoldies.ca/cc65/programs/dhgr/bmp2dhr.zip"
  version "1.1"
  sha256 "4cd25bccddae411a512ef172b447083ca9d4eb72ffb58a5bdadd1e4200a8b0ac"

  def install
    cd "src" do
      system ENV.cc, "-DMINGW", "-arch", "i386", "-o", "b2d", "b2d.c"
    end
    cd "magick" do
      system ENV.cc, "-DMINGW", "-arch", "i386", "-o", "m2s", "m2s.c"
    end
    cd "xpack" do
      system ENV.cc, "-DMINGW", "-arch", "i386", "-o", "xpack", "xpack.c"
    end
    bin.install "src/b2d"
    bin.install_symlink bin/"b2d" => "bmp2dhr"
    bin.install "magick/m2s"
    bin.install "xpack/xpack"
  end

  test do
    system "false"
  end
end
