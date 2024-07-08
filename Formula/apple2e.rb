class Apple2e < Formula
  desc "Yet another Apple //e emulator"
  homepage "https://github.com/bradgrantham/apple2e"
  url "https://github.com/bradgrantham/apple2e.git",
    revision: "8e656aba3b07788aee11705e188e4431c46b7e68"
  version "20240708" # Date of commit
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

  def caveats
    <<-EOS
      ROM files are in #{libexec}.
    EOS
  end

  test do
    system "false"
  end
end
