class Plasma < Formula
  desc "Proto Language AsSeMbler for Apple"
  homepage "https://github.com/dschmenk/PLASMA"
  url "https://github.com/dschmenk/PLASMA.git",
      :revision => "a5215e330905e8ecc026dcddcb5afb24b54f4efa"
  version "a5215e33"
  head "https://github.com/dschmenk/PLASMA.git"

  option "with-test", "Verify the build with `make test`"

  depends_on "acme"

  def install
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
