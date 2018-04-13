class Applewin < Formula
  desc "Apple II emulator for Windows"
  homepage "https://github.com/AppleWin/AppleWin"
  url "https://github.com/AppleWin/AppleWin/releases/download/v1.27.2.0/AppleWin1.27.2.0.zip"
  sha256 "cb4685ead6f4708f9c7fccf760b3435133d5f26a747934582c919dea5f76ddfd"

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
