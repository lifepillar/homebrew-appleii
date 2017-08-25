class Merlin32 < Formula
  desc "Multi-pass Cross Assembler for 6502/65c02/65c816 processors."
  homepage "http://www.brutaldeluxe.fr/products/crossdevtools/merlin/"
  url "http://www.brutaldeluxe.fr/products/crossdevtools/merlin/Merlin32_v1.0.zip"
  sha256 "eb9203b22dba23e70382ab876112e826d4c6bb3d04004f712fd8a9df56778e39"

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
