class Napple1 < Formula
  desc "Apple I emulator on a text terminal or console using ncurses"
  homepage "https://github.com/nobuh/napple1"
  url "https://github.com/nobuh/napple1.git",
    revision: "a6f12814f9260e3c24bf4c0bcaf1073b32481a13"
  version "20181006" # Date of commit
  head "https://github.com/nobuh/napple1.git"

  def install
    cd "src" do
      system "make"
    end
    libexec.install "core"
    libexec.install "rom"
    libexec.install "napple1"
    (bin/"napple1").write <<~EOS
      #!/bin/bash
      ROMDIR='#{libexec}/rom' exec "#{libexec}/napple1" "$@"
    EOS
  end

  test do
    false
  end
end
