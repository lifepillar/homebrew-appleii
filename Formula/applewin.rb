class Applewin < Formula
  desc "Apple II emulator for Windows"
  homepage "https://github.com/AppleWin/AppleWin"
  url "https://github.com/AppleWin/AppleWin/releases/download/v1.28.2.0/AppleWin1.28.2.0.zip"
  sha256 "7c50c0385e4f9d5f3e944b1aa848ecaedc6fb4e039b4c1d45e8baaa60d647219"

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
