class Applewin < Formula
  desc "Apple II emulator for Windows"
  homepage "https://github.com/AppleWin/AppleWin"
  url "https://github.com/AppleWin/AppleWin/releases/download/v1.30.0.0(try2)/AppleWin1.30.0.0.zip"
  sha256 "17d2c5e1a29afbaf782b7110a3d5c887251869c3907953dd4ba6c419a214b7c9"

  def install
    libexec.install Dir["*"]

    bin.mkpath
    (bin/"applewin").write <<~EOS
      #!/bin/bash
      wine64 #{libexec}/Applewin.exe "$@"
    EOS
  end

  def caveats
    <<~EOS
      Applewin requires Wine. It is recommended to use homebrew-wine:

          https://github.com/Gcenx/homebrew-wine

      The executable is called `applewin`.
    EOS
  end

  test do
    system "false"
  end
end
