class Napple1 < Formula
  desc "Apple I emulator on a text terminal or console using ncurses"
  homepage "https://github.com/nobuh/napple1"
  url "https://github.com/nobuh/napple1.git",
      :revision => "8c791a116cc65df1c3005a59b632ab21dbde6e2b"
  version "2.2.1"
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
        cd #{libexec} && exec "./napple1" "$@"
    eos
  end

  def caveats; <<-EOS.undent
    When napple1 is running, the working directory is set to
    #{libexec}
    EOS
  end

  test do
    false
  end
end
