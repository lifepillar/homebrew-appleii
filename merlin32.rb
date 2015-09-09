class Merlin32 < Formula
  desc "A multi-pass Cross Assembler for 6502/65c02/65c816 processors."
  homepage "http://www.brutaldeluxe.fr/products/crossdevtools/merlin/"
  url "http://www.brutaldeluxe.fr/products/crossdevtools/merlin/Merlin32_v1.0.zip"
  sha256 "97bce524386a0d7a94cfe2292082090b7f96c371934ed8c819b0797fa16b5667"

  def install
    merlin_dir = buildpath/"Merlin32_v1.0"
    src_dir = merlin_dir/"Source"
    cd src_dir do
      system "make", "-f", "linux_makefile"
    end
    bin.install src_dir/"Merlin32"
    prefix.install merlin_dir/"Library"
  end

  def caveats; <<-EOS.undent
    Macro definition files are in #{prefix}/Library.
    EOS
  end

  test do
    system "Merlin32"
  end
end
