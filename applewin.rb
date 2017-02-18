class Applewin < Formula
  desc "Apple II emulator for Windows"
  homepage "https://github.com/AppleWin/AppleWin"
  url "https://github.com/AppleWin/AppleWin/releases/download/v1.26.1.1/AppleWin1.26.1.1.zip"
  sha256 "50e37821675129b0de5741696a4b1321bd673178506b4e87e1f0889910eed1f8"

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

  test do
    system "false"
  end
end
