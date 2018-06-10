class MachKernelCadius < Formula
  desc "BrutalDeluxe's Cadius ProDOS disk imaging utility"
  homepage "https://www.brutaldeluxe.fr/products/crossdevtools/cadius"
  url "https://github.com/mach-kernel/cadius/archive/1.4.0.tar.gz"
  sha256 "6755f73a45f879c361d0eacb923f675c66038699d9cfb4856ac6814832defc96"

  def install
    system "make"
    bin.install "./bin/release/cadius"
  end

  test do
    system "cadius"
  end
end
