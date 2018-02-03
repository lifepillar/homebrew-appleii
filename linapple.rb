class Linapple < Formula
  desc "Apple 2, 2e cross-platform emulator"
  homepage "http://linapple.sourceforge.net"
  url "http://beotiger.com/download/linapple_src-2b"
  sha256 "96f837fe902a00a2b100766d234120f43f70a1e9c19198e442157516da4789fe"
  head "https://github.com/timob/linapple.git"

  depends_on "libzip"
  depends_on "sdl"

  def shim_script(target)
    <<~EOS
      #!/bin/bash
      cd "#{libexec}"; exec ./#{target} "$@"; cd -
    EOS
  end

  def install
    files = [
      "charset40.bmp",
      "font.bmp",
      "icon.bmp",
      "linapple",
      "linapple.conf",
      "linapple.installed.conf",
      "Master.dsk",
      "splash.bmp",
    ]
    ENV.append "CXXFLAGS", "-I#{Formula["libzip"].lib}/libzip/include"
    cd "src" do
      system "make"
    end
    chmod 0644, files
    chmod 0755, "linapple"
    libexec.install files
    (bin+"linapple").write shim_script("linapple")
  end

  test do
    system "false"
  end
end
