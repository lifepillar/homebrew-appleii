class Calvados < Formula
  desc "Gtk app designed as a workalike of CiderPress"
  homepage "https://github.com/softwarejanitor/calvados"
  url "https://github.com/softwarejanitor/calvados.git",
    :revision => "fbf7281338c51d12c4f20cc55a08a002ec08a3d2"
  version "fbf72813"
  head "https://github.com/softwarejanitor/calvados.git"

  depends_on "gtk+"

  def install
    inreplace "Makefile", %r{/usr/include}, "#{HOMEBREW_PREFIX}/include"
    system "make", "calvados"
    libexec.install "calvados"
    libexec.install "images"
    (bin/"calvados").write <<-eos.undent
        #!/bin/bash
        cd #{libexec} && exec "./calvados" "$@"
    eos
  end

  def caveats; <<-EOS.undent
    Calvados is still a work in progress and no
    functionality has been implemented yet.

    The executable is called `calvados`.
    EOS
  end

  test do
    system "false"
  end
end
