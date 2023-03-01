class Plasma < Formula
  desc "Proto Language AsSeMbler for Apple"
  homepage "https://github.com/dschmenk/PLASMA"
  url "https://github.com/dschmenk/PLASMA/archive/refs/tags/Beta.tar.gz"
  version "2.0-beta"
  sha256 "2936bb4b6ec17419492bceb4928bc3aa6aa8ec25898777501c649d247d811441"
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
