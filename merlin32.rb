class Merlin32 < Formula
  homepage "http://www.brutaldeluxe.fr/products/crossdevtools/merlin/"
  url "http://www.brutaldeluxe.fr/products/crossdevtools/merlin/Merlin32_v1.0.zip"
  sha256 "490d465626fef0aea2f4ea63afe80097fdc2b074b876c04584405fe4715e4323"

  def install
    cd "Source" do
      system "make", "-f", "linux_makefile"
    end
    bin.install "Source/Merlin32"
    prefix.install "Library"
  end

  def caveats; <<-EOS.undent
    Macro definition files are in #{prefix}/Library.
    EOS
  end

  test do
    system "Merlin32"
  end
end
