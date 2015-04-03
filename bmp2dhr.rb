class Bmp2dhr < Formula
  homepage "http://www.appleoldies.ca/bmp2dhr/"
  url "http://www.appleoldies.ca/cc65/programs/dhgr/bmp2dhr.zip"
  version "1.1"
  sha256 "4ec7e17ab016d0611350cf88f0607354d2ac350be6788b5ba186e22118dcc6c3"

  def install
      cd "src" do
        system ENV.cc, "-DMINGW", "-arch", "i386", "-o", "bmp2dhr", "b2d.c"
      end
      cd "a2fcbmp" do
        system ENV.cc, "-DMINGW", "-arch", "i386", "-o", "a2fcbmp", "a2fcbmp.c"
      end
      cd "xpack" do
        system ENV.cc, "-DMINGW", "-arch", "i386", "-o", "xpack", "xpack.c"
      end
      bin.install "src/bmp2dhr"
      bin.install_symlink bin/"bmp2dhr" => "b2d"
      bin.install "a2fcbmp/a2fcbmp"
      bin.install_symlink bin/"a2fcbmp" => "a2b"
      bin.install "xpack/xpack"
  end

  test do
    system "false"
  end
end
