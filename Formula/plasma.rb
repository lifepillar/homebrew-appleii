class Plasma < Formula
  desc "Proto Language AsSeMbler for Apple"
  homepage "https://github.com/dschmenk/PLASMA"
  url "https://github.com/dschmenk/PLASMA/archive/refs/tags/v2.20.tar.gz"
  sha256 "cd16a131e50fb02dd28f92ecb6742533f74b437ffaf91aa6e053e3038ad0a958"
  head "https://github.com/dschmenk/PLASMA.git"

  depends_on "acme"

  def install
    # Install isn't parallel-safe
    ENV.deparallelize

    cd "src" do
      system "make"
    end
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"src/xplasm"
    bin.write_exec_script libexec/"src/plvm"
  end

  test do
    system "false"
  end
end
