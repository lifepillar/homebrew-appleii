class Dsk2woz < Formula
  desc "Convert Apple II DSK images to WOZ format"
  homepage "https://github.com/tomharte/dsk2woz"
  url "https://github.com/TomHarte/dsk2woz.git",
    :revision => "0dca2116efcd0b3dc53359be8a57dc08f75424a9"
  version "0dca2116"
  head "https://github.com/TomHarte/dsk2woz.git"

  def install
    system ENV.cc, "-Wall", "-O3", "-o", "dsk2woz", "dsk2woz.c"
    bin.install "dsk2woz"
  end

  test do
    system "false"
  end
end
