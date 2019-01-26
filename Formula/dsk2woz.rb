class Dsk2woz < Formula
  desc "Convert Apple II DSK images to WOZ format"
  homepage "https://github.com/tomharte/dsk2woz"
  url "https://github.com/TomHarte/dsk2woz.git",
    :revision => "4dc9ba551a5888cd685beb9a9180d227417c4062"
  version "4dc9ba55"
  head "https://github.com/TomHarte/dsk2woz.git"

  def install
    system ENV.cc, "-Wall", "-O3", "-o", "dsk2woz", "dsk2woz.c"
    bin.install "dsk2woz"
  end

  test do
    system "false"
  end
end
