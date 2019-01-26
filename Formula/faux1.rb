class Faux1 < Formula
  desc "Apple I emulator for the terminal with cut and paste"
  homepage "http://faux1.sourceforge.net"
  url "https://downloads.sourceforge.net/project/faux1/faux1.0.95.9.20120222.src.tar.gz"
  version "1.0.95.9.20120222"
  sha256 "fc5c72085abd0e5925d57c477d5e4dc20ded83723a03bd3c5f09281cdc43f25e"

  def install
    cd "src" do
      system "make"
    end
    libexec.install "apps"
    libexec.install "rom"
    libexec.install "faux1"
    (bin/"faux1").write <<~EOS
      #!/bin/bash
      cd #{libexec} && exec "./faux1" "$@"
    EOS
  end

  def caveats; <<~EOS
    When faux1 is running, the working directory is set to
    #{libexec}
    EOS
  end

  test do
    false
  end
end
