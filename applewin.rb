class Applewin < Formula
  desc "Apple II emulator for Windows"
  homepage "https://github.com/AppleWin/AppleWin"
  url "https://github.com/AppleWin/AppleWin/releases/download/v1.27.0.0/AppleWin1.27.0.0.zip"
  sha256 "9f039b338ba60d9503aa048ff3472a1ee10ccd136d53c67bda049774917b0646"

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
