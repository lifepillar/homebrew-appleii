class Plasma < Formula
  desc "Proto Language AsSeMbler for Apple"
  homepage "https://github.com/dschmenk/PLASMA"
  url "https://github.com/dschmenk/PLASMA/archive/v1.0.0.tar.gz"
  sha256 "cd5c9bbc6653092305ccb560a9c08a77f2ca2a3c027229fc9f93f3e0774fd849"
  head "https://github.com/dschmenk/PLASMA.git"

  option "with-test", "Verify the build with `make test`"

  depends_on "acme"

  def install
    cd "src" do
      begin # For some reason, the first make fails, but second builds correctly
        system "make"
      rescue
      end
      system "make"
      system "make", "test" if build.with?("test")
    end
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"src/plasm"
    bin.write_exec_script libexec/"src/plvm"
  end

  def caveats; <<~EOS
    If you see errors during the first `make`, you may safely ignore them.
    EOS
  end

  test do
    system "false"
  end
end
