class Calvados < Formula
  desc "Gtk app designed as a workalike of CiderPress"
  homepage "https://github.com/softwarejanitor/calvados"
  url "https://github.com/softwarejanitor/calvados.git",
    :revision => "9df8ea81d84b4095f74c8eb998b3403fccebb026"
  version "9df8ea81"
  head "https://github.com/softwarejanitor/calvados.git"

  depends_on "gtk+"

  def install
    inreplace "Makefile", %r{/usr/include}, "#{HOMEBREW_PREFIX}/include"
    system "make", "calvados"
    libexec.install "calvados"
    libexec.install "images"
    (bin/"calvados").write <<~EOS
        #!/bin/bash
        cd #{libexec} && exec "./calvados" "$@"
    EOS
  end

  def caveats; <<~EOS
    Calvados is still a work in progress and no
    functionality has been implemented yet.

    The executable is called `calvados`.
    EOS
  end

  test do
    system "false"
  end
end
