class MachKernelCadius < Formula
  desc "BrutalDeluxe's Cadius ProDOS disk imaging utility"
  homepage "https://www.brutaldeluxe.fr/products/crossdevtools/cadius"
  url "https://github.com/mach-kernel/cadius/archive/1.4.2.tar.gz"
  sha256 "1360d51fe7f1f9017420d83a3d2a2bee0cd1d60a75033dfb76db13d5d081d5c5"

  def install
    system "make"
    bin.install "./bin/release/cadius"
  end

  test do
    system "#{bin}/cadius"
  end
end
