class Apple2ImageEncoder < Formula
  desc "Convert a modern image into a format usable by an Apple II"
  homepage "https://github.com/a2geek/apple2-image-encoder"
  url "https://github.com/a2geek/apple2-image-encoder/archive/4.4.1-FINAL.tar.gz"
  sha256 "e67544a1b6676dac8f76387aaa1d8bf27777b74ff20b59159b7b0300a9be5425"
  head "https://github.com/a2geek/apple2-image-encoder.git"

  depends_on "maven" => :build
  depends_on "openjdk@8"

  def install
    system "mvn", "package"
    libexec.install "target/apple2-image-encoder-4.4.1-FINAL.jar"
    bin.write_jar_script libexec/"apple2-image-encoder-4.4.1-FINAL.jar", "apple2-image-encoder"
  end

  def caveats
    <<~EOS
      The executable is called apple2-image-encoder.
    EOS
  end

  test do
    false
  end
end
