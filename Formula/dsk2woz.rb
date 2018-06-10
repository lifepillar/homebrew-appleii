class Dsk2woz < Formula
  desc "Convert Apple II DSK images to WOZ format"
  homepage "https://github.com/tomharte/dsk2woz"
  url "https://github.com/TomHarte/dsk2woz.git",
    :revision => "fbe7398d0f0ab6c4c88088b5bb1f35fd0e2f68f3"
  version "fbe7398d"
  head "https://github.com/TomHarte/dsk2woz.git"

  def install
    system ENV.cc, "-Wall", "-O3", "-o", "dsk2woz", "dsk2woz.c"
    bin.install "dsk2woz"
  end

  test do
    system "false"
  end
end
