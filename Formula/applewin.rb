class Applewin < Formula
  desc "Apple II emulator for Windows"
  homepage "https://github.com/AppleWin/AppleWin"
  url "https://github.com/AppleWin/AppleWin/releases/download/v1.27.9.0/AppleWin1.27.9.0.zip"
  sha256 "b5146b858eb94d298490a3943d979dc8144c063d953df0ed5a2e87f2ce3aea04"

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
