class Applewin < Formula
  desc "Apple II emulator for Windows"
  homepage "https://github.com/AppleWin/AppleWin"
  url "https://github.com/AppleWin/AppleWin/releases/download/v1.26.3.6/AppleWin1.26.3.6.zip"
  sha256 "3599fdd806836640764a2c786142e408c2dd05715907cf17a0a4915115c59b7a"

  bottle :unneeded

  depends_on "wine"

  def install
    libexec.install Dir["*"]

    bin.mkpath
    (bin/"applewin").write <<-EOS.undent
      #!/bin/bash
      wine #{libexec}/Applewin.exe "$@"
    EOS
  end

  def caveats; <<-EOS.undent
    The executable is called `applewin`.
    EOS
  end

  test do
    system "false"
  end
end
