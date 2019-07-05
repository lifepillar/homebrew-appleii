class Merlin32 < Formula
  desc "Multi-pass Cross Assembler for 6502/65c02/65c816 processors"
  homepage "http://www.brutaldeluxe.fr/products/crossdevtools/merlin/"
  url "https://www.brutaldeluxe.fr/products/crossdevtools/merlin/Merlin32_v1.0.zip"
  sha256 "4dd56aa11ad8f3736e7c7a2295fd5922fd897d2324e006f44c09e0b932b07b4b"

  def install
    cd "Source" do
      system "make", "-f", "linux_makefile"
    end
    bin.install "Source/Merlin32"
    prefix.install "Library" => "lib"
  end

  def caveats; <<~EOS
    Macro definition files are in #{lib}.
  EOS
  end

  test do
    system "#{bin}/Merlin32"
  end
end
