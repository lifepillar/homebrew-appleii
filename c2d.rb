class C2d < Formula
  desc "Apple II Code to Disk"
  homepage "https://github.com/datajerk/c2d"
  url "https://github.com/datajerk/c2d/archive/v0.57.tar.gz"
  sha256 "f6437d3bbd43fb638ef8378232b2453d1c75f5e5ed7f85adc47565596f940cc1"
  head "https://github.com/datajerk/c2d.git"

  def install
    system ENV.cc, "-Wall", "-Wno-missing-braces", "-I.", "-O3", "-o", "c2d", "c2d.c", "-lm"
    system ENV.cc, "-Wall", "-O3", "-o", "bin/text2page", "text2page.c", "-lm"
    system ENV.cc, "-Wall", "-O3", "-o", "bin/page2text", "page2text.c", "-lm"
    bin.install "c2d"
    bin.install "bin/text2page"
    bin.install "bin/page2text"
  end

  test do
    system "make", "test" # Fails
  end
end
