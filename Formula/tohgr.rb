class Tohgr < Formula
  desc "Convert images in PNG, JPG, or XPM format to Apple II images"
  homepage "http://wsxyz.net/tohgr.html"
  url "http://wsxyz.net/tohgr-source.zip"
  version "20141226"
  sha256 "c360e178ee4303f8aa1ed07be3ed37236c3944fe5a143427c92396a1bd92972a"

  depends_on "jpeg"
  depends_on "libpng"

  def install
    system "make"
    bin.install "tohgr"
  end

  def caveats
    <<~EOS
      tohgr may segfault if it does not have permission
      to write to the destination path.
    EOS
  end

  test do
    system "#{bin}/tohgr"
  end
end
