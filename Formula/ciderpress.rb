class Ciderpress < Formula
  desc "Apple II archive utility for Windows"
  homepage "http://a2ciderpress.com"
  url "https://github.com/fadden/ciderpress/releases/download/v4.1.1/CiderPress411.zip"
  version "4.1.1"
  sha256 "d2348b114e7506e3d2f99dc2a47358e710e06a8e99304ab27f88e9e321a5283f"

  def install
    libexec.install Dir["*"]

    bin.mkpath
    (bin/"ciderpress").write <<~EOS
      #!/bin/bash
      wine64 ${HOME}'/.wine/drive_c/Program Files (x86)/faddenSoft/CiderPress/CiderPress.exe' "$@"
    EOS
  end

  def caveats
    <<~EOS
      Ciderpress requires Wine. Install it with:

          brew install wine-stable

      To complete the installation execute:

        cd #{libexec}
        wine64 Setup411.exe

      and choose Immediate Installation.

      Ciderpress can then be launched from the command-line with `ciderpress`.
    EOS
  end

  test do
    system "false"
  end
end
