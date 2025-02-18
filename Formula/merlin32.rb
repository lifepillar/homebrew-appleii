class Merlin32 < Formula
  desc "Multi-pass Cross Assembler for 6502/65c02/65c816 processors"
  homepage "https://www.brutaldeluxe.fr/products/crossdevtools/merlin/"
  url "https://www.brutaldeluxe.fr/products/crossdevtools/merlin/Merlin32_v1.1.zip"
  sha256 "6a4ebd09ed8800a3874b15e35b5d16469a8ad08dd477b9f84cbd5ce8832dc108"

  livecheck do
    url :homepage
    regex(/href=.*?Merlin32[._-]v?(\d+(?:\.\d+)+)\./i)
  end

  def install
    cd "Source" do
      system "make", "-f", "linux_makefile"
      bin.install "Merlin32"
    end
    prefix.install "Library" => "lib"
  end

  def caveats
    <<~EOS
      Macro definition files are in #{lib}.
      The executable is `Merlin32`.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/Merlin32 -v", 1)
  end
end
