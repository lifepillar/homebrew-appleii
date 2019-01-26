class Ciderpress < Formula
  desc "Apple II archive utility for Windows"
  homepage "http://a2ciderpress.com"
  url "https://github.com/fadden/ciderpress/releases/download/v4.0.3/CiderPress403.zip"
  version "4.0.3"
  sha256 "fc21b46adbd01ac5911066d99ef3b74cb6704bd8df234e724a183ad451e7cd25"

  bottle :unneeded

  depends_on "wine"

  def install
    libexec.install Dir["*"]

    bin.mkpath
    (bin/"ciderpress").write <<~EOS
      #!/bin/bash
      wine ${HOME}'/.wine/drive_c/Program Files (x86)/faddenSoft/CiderPress/CiderPress.exe' "$@"
    EOS
  end

  def caveats; <<~EOS
    To complete the installation execute:

      cd #{libexec}
      wine Setup403.exe

    and choose No-Question-Asked Installation.

    Ciderpress can then be launched from the command-line with `ciderpress`.
  EOS
  end

  test do
    system "false"
  end
end
