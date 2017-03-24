class Napple1 < Formula
  desc "Apple I emulator on a text terminal or console using ncurses"
  homepage "https://github.com/nobuh/napple1"
  url "https://github.com/nobuh/napple1.git",
      :revision => "f7e5d6733251bd64f7ad1a353f640f61bb487c75"
  version "2.3.0"
  head "https://github.com/nobuh/napple1.git"

  def install
    cd "src" do
      system "make"
    end
    libexec.install "core"
    libexec.install "rom"
    libexec.install "napple1"
    (bin/"napple1").write <<-eos.undent
        #!/bin/bash
        ROMDIR='#{libexec}/rom' exec "#{libexec}/napple1" "$@"
    eos
  end

  test do
    false
  end
end
