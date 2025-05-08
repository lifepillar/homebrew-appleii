class Merlin32 < Formula
  desc "Multi-pass Cross Assembler for 6502/65c02/65c816 processors"
  homepage "https://www.brutaldeluxe.fr/products/crossdevtools/merlin/"
  url "https://www.brutaldeluxe.fr/products/crossdevtools/merlin/Merlin32_v1.2.zip"
  sha256 "4022503d0fa779529190acc2b598c766f522da5012c12890179cb437b504f43d"

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
