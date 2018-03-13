class Plasma < Formula
  desc "Proto Language AsSeMbler for Apple"
  homepage "https://github.com/dschmenk/PLASMA"
  url "https://github.com/dschmenk/PLASMA/archive/v1.1.0.tar.gz"
  sha256 "a7294c409453406acbb947f6f74c0c947bda1df11db1fcc90cc1f33f0028d37b"
  head "https://github.com/dschmenk/PLASMA.git"

  option "with-test", "Verify the build with `make test`"

  depends_on "acme"

  def install
    cd "src" do
      begin
        # For some reason, the first make fails, but second builds correctly
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
