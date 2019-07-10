class Applewin < Formula
  desc "Apple II emulator for Windows"
  homepage "https://github.com/AppleWin/AppleWin"
  url "https://github.com/AppleWin/AppleWin/releases/download/v1.29.0.0/AppleWin1.29.0.0.zip"
  sha256 "b057a46de773df1b410b90df6c486b5a577fd4da5dcc00c8286b9d2508846b68"

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
