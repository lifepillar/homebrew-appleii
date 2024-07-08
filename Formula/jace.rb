class Jace < Formula
  desc "Cycle-accurate emulation of an Apple //e computer"
  homepage "https://github.com/badvision/jace"
  url "https://github.com/badvision/jace/releases/download/3.0/Jace_3.0_MacOS_Intel64.zip"
  version "3.0"
  sha256 "d0f7930668b42b57a84046f267bda21a4ce5d52c27afdf14cc34cc92e3c651f1"
  head "https://github.com/badvision/jace.git"

  def install
    libexec.install "Jace"
    (bin/"jace").write <<~EOS
      #!/bin/bash
      cd #{etc}
      #{libexec}/Jace
    EOS
  end

  def caveats
    <<~EOS
      The executable is called `jace`. Jace configuration is saved in
      #{etc}/.jace.conf.
    EOS
  end

  test do
    false
  end
end
