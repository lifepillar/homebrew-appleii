class ReinetteIi < Formula
  desc "A French Apple II text-only emulator"
  homepage "https://github.com/ArthurFerreira2/reinette-II"
  url "https://github.com/ArthurFerreira2/reinette-II.git",
    :revision => "ef47881ad38e6b43dc1e31ca8e449725657f8632"
  version "20190325" # Date of commit
  sha256 "f73809580cb026fe5d146b126aa5ee33c0e295d3629e0d4d587d3de0dc6c9c5a"

  depends_on "ncurses"

  def shim_script(target)
    <<~EOS
      #!/bin/bash
      cd "#{libexec}"; exec ./#{target} "$@"; cd -
    EOS
  end

  def install
    system "make"
    libexec.install "reinette-II"
    libexec.install "appleII+.rom"
    libexec.install "appleII.rom"
    (bin+"reinette-II").write shim_script("reinette-II")
  end

  test do
    system "false"
  end
end
