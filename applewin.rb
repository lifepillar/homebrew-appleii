class Applewin < Formula
  desc "Apple II emulator for Windows"
  homepage "https://github.com/AppleWin/AppleWin"
  url "https://github.com/AppleWin/AppleWin/releases/download/v1.26.2.1/AppleWin1.26.2.1.zip"
  sha256 "3b10fd247f7e5fd6faa88c7bb5322b987f54c7f805c6ea0f8f632bbc10f5e976"

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
