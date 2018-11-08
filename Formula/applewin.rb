class Applewin < Formula
  desc "Apple II emulator for Windows"
  homepage "https://github.com/AppleWin/AppleWin"
  url "https://github.com/AppleWin/AppleWin/releases/download/v1.27.10.0/AppleWin1.27.10.0.zip"
  sha256 "37fb89494ed673f73261108757a6d8143f60a97d72a277d0b2d0d2a5ad08ad71"

  bottle :unneeded

  depends_on "wine"

  def install
    libexec.install Dir["*"]

    bin.mkpath
    (bin/"applewin").write <<~EOS
      #!/bin/bash
      wine #{libexec}/Applewin.exe "$@"
    EOS
  end

  def caveats; <<~EOS
    The executable is called `applewin`.
  EOS
  end

  test do
    system "false"
  end
end
