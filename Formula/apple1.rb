class Apple1 < Formula
  desc "Apple 1 Emulator that doesn't suck"
  homepage "https://github.com/RyuKojiro/apple1"
  url "https://github.com/RyuKojiro/apple1.git",
    :branch   => "master",
    :revision => "b11e9b89a396f3d9bd9f6bd9f4299dab277f04c0"
  version "b11e9b89"
  head "https://github.com/RyuKojiro/apple1.git"

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
