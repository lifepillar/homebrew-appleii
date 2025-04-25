class Ciderpress2 < Formula
  desc "Tool for working with Apple II and vintage Mac disk images and file archives"
  homepage "https://ciderpress2.com/"
  url "https://github.com/fadden/CiderPress2/releases/download/v1.0.7/cp2_1.0.7_osx-x64_sc.zip"
  sha256 "e6a76c6258dae4fe4e30c072e98bcb7d92beb0d151844075b9335f5d4ce59b98"

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
