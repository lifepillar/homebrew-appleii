class Ciderpress2 < Formula
  desc "Tool for working with Apple II and vintage Mac disk images and file archives"
  homepage "https://ciderpress2.com/"
  url "https://github.com/fadden/CiderPress2/releases/download/v1.0.3/cp2_1.0.3_osx-x64_sc.zip"
  sha256 "a492cd506ede4ed5005d1bc51adb5199a329271cf32a52fd607c6580b8c7c1a8"

  def install
    libexec.install Dir["*"]

    bin.mkpath
    (bin/"cp2").write <<~EOS
      #!/bin/bash
      cd #{libexec} && exec "./cp2" "$@"
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
