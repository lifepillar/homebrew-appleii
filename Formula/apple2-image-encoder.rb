class Apple2ImageEncoder < Formula
  desc "Convert a modern image into a format usable by an Apple II"
  homepage "https://github.com/a2geek/apple2-image-encoder"
  url "https://github.com/a2geek/apple2-image-encoder/archive/4.4.0-FINAL.tar.gz"
  version "4.4.0"
  sha256 "493fbeb36121e7d160ab9e3fbb32eaf42dbc4bc4992a692fc1cd60fb7c4caf61"
  head "https://github.com/a2geek/apple2-image-encoder.git"

  depends_on :java => "1.8+"
  depends_on "maven" => :build

  def install
    system "mvn", "package"
    libexec.install "target/apple2-image-encoder-4.4.0-FINAL.jar"
    bin.write_jar_script libexec/"apple2-image-encoder-4.4.0-FINAL.jar", "apple2-image-encoder"
  end

  def caveats; <<~EOS
    The executable is called apple2-image-encoder.
    EOS
  end

  test do
    false
  end
end
