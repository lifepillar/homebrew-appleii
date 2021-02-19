class Plasma < Formula
  desc "Proto Language AsSeMbler for Apple"
  homepage "https://github.com/dschmenk/PLASMA"
  url "https://github.com/dschmenk/PLASMA/archive/Alpha1.tar.gz"
  version "2.0-alpha1"
  sha256 "2a8f90cef2956d060861ad943204d7a5bb48b8b491ac18522002d1fae95e091d"
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
