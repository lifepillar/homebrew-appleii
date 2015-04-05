class Linapple < Formula
  homepage "http://linapple.sourceforge.net"
  url "https://downloads.sourceforge.net/project/linapple/linapple/linapple-2a/linapple-src_2a.tar.bz2"
  version "2a"
  sha256 "64961e7a63e2c22cef19414e165290791b600c307f0e7adebc057a2b0009c360"

  depends_on "libzip"
  depends_on "sdl"

  def shim_script target
    <<-EOS.undent
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
      "splash.bmp"
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
