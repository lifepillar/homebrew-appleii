class Applewin < Formula
  desc "Apple II emulator for Windows"
  homepage "https://github.com/AppleWin/AppleWin"
  url "https://github.com/AppleWin/AppleWin/releases/download/v1.30.18.0/AppleWin1.30.18.0.zip"
  sha256 "392e927c75cfbb93b3aa893f7139d78b32daaeeb81305429ba8fbebe4822a083"

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
      Applewin requires Wine. Install it with:

          brew install wine-stable

      The executable is called `applewin`.
    EOS
  end

  test do
    system "false"
  end
end
