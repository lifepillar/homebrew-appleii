class Unlatch < Formula
  homepage "http://www.appleoldies.ca/bmp2dhr/basic/"
  url "http://www.appleoldies.ca/cc65/programs/dhgr/unlatch.zip"
  version "2014-09-17"
  sha256 "24e3f56d6a783a4f8718ecafd1b6fa4c626436a562de41b7f1bbc4c60cfaf1ce"

  def install
    system "make"
    bin.install "unlatch"
  end

  test do
    system "false"
  end
end
