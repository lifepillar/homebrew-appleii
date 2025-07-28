class Ciderpress2 < Formula
  desc "Tool for working with Apple II and vintage Mac disk images and file archives"
  homepage "https://ciderpress2.com/"
  url "https://github.com/fadden/CiderPress2/releases/download/v1.1.0/cp2_1.1.0_osx-x64_sc.zip"
  sha256 "66a6f1006a6ae050c1f827e0de680b47f924c6eb5c37a9ced1430da2e06e71b5"

  def install
    libexec.install Dir["*"]

    bin.mkpath
    (bin/"cp2").write <<~EOS
      #!/bin/bash
      exec #{libexec}/cp2 "$@"
    EOS
  end

  def caveats
    <<~EOS
      CiderPress2 can be run by typing `cp2` in the terminal.

      If you get a permission error, open #{libexec}
      in the Finder and open cp2 by right-clicking on the cp2 executable. This
      needs to be done once.
    EOS
  end

  test do
    system "false"
  end
end
