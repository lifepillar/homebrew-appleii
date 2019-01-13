class Applewin < Formula
  desc "Apple II emulator for Windows"
  homepage "https://github.com/AppleWin/AppleWin"
  url "https://github.com/AppleWin/AppleWin/releases/download/v1.28.0.0/AppleWin1.28.0.0.zip"
  sha256 "dda2d4c6787684674d24dce00f8ac8c03a1bf812057889a762605bc1b8983fe9"

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
