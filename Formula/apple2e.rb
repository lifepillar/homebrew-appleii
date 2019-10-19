class Apple2e < Formula
  desc "Yet another Apple //e emulator"
  homepage "https://github.com/bradgrantham/apple2e"
  url "https://github.com/bradgrantham/apple2e.git",
    :revision => "b76c734115877d4ccb01c17fa56e757a58e4beb6"
  version "20201015" # Date of commit
  head "https://github.com/bradgrantham/apple2e.git"

  depends_on "glfw"
  depends_on "libao"

  def install
    system "make"
    bin.install "apple2e"
    libexec.install "apple2.rom"
    libexec.install "apple2e.rom"
    libexec.install "apple2_intbasic.rom"
    libexec.install "diskII.c600.c6ff.bin"
  end

  def caveats; <<-EOS
    ROM files are in #{libexec}.
  EOS
  end

  test do
    system "false"
  end
end
