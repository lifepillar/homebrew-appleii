class Plasma < Formula
  desc "Proto Language AsSeMbler for Apple"
  homepage "https://github.com/dschmenk/PLASMA"
  url "https://github.com/dschmenk/PLASMA/archive/refs/tags/Alpha2.tar.gz"
  version "2.0-alpha2"
  sha256 "b5f888ccf33eccf327b11796d4da508906dce20f29c03278909f167236102dc4"
  head "https://github.com/dschmenk/PLASMA.git"

  option "with-test", "Verify the build with `make test`"

  depends_on "acme"

  def install
    # Install isn't parallel-safe
    ENV.deparallelize

    cd "src" do
      system "make"
      system "make", "test" if build.with?("test")
    end
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"src/plasm"
    bin.write_exec_script libexec/"src/plvm"
  end

  test do
    system "false"
  end
end
