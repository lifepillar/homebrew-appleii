class Dsk2woz < Formula
  desc "Convert Apple II DSK images to WOZ format"
  homepage "https://github.com/tomharte/dsk2woz"
  url "https://github.com/TomHarte/dsk2woz.git",
    revision: "0459a8a090028ccf56336f7ee0b0ba9344789398"
  version "20200129" # Date of commit
  head "https://github.com/TomHarte/dsk2woz.git"

  def install
    system ENV.cc, "-Wall", "-O3", "-o", "dsk2woz", "dsk2woz.c"
    bin.install "dsk2woz"
  end

  test do
    system "false"
  end
end
