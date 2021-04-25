class ReinetteIi < Formula
  desc "French Apple II text-only emulator"
  homepage "https://github.com/ArthurFerreira2/reinette-II"
  url "https://github.com/ArthurFerreira2/reinette-II.git",
    revision: "ef47881ad38e6b43dc1e31ca8e449725657f8632"
  version "20200408" # Date of commit

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

  def caveats
    <<~EOS
      The executable is `reinette-II`.
    EOS
  end

  test do
    system "false"
  end
end
