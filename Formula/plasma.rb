class Plasma < Formula
  desc "Proto Language AsSeMbler for Apple"
  homepage "https://github.com/dschmenk/PLASMA"
  url "https://github.com/dschmenk/PLASMA/archive/v1.1a.tar.gz"
  sha256 "cf70e58d7d94b727a2ab3bb1f5f5e7e3f4769581b121c9166912c12eeb75ec25"
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
