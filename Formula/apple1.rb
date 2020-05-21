class Apple1 < Formula
  desc "Apple 1 Emulator that doesn't suck"
  homepage "https://github.com/RyuKojiro/apple1"
  url "https://github.com/RyuKojiro/apple1.git",
    :revision => "95134f17c290528231f9a99d6d103e534172aa16"
  version "20190201" # Date of commit
  head "https://github.com/RyuKojiro/apple1.git"

  depends_on "libedit"
  depends_on "ncurses"

  conflicts_with "apple1emulator", :because => "both install an `apple1` executable"

  def install
    system "make"
    libexec.install "./apple1"
    libexec.install "./apple1.rom"
    libexec.install "./apple1.dbg"
    man1.install "./src/apple1.1"
    (bin/"apple1").write <<~EOS
      #!/bin/bash
      cd #{libexec} && exec "./apple1" "$@"
    EOS
  end

  test do
    system "false"
  end
end
