class MachKernelCadius < Formula
  desc "BrutalDeluxe's Cadius ProDOS disk imaging utility"
  homepage "https://www.brutaldeluxe.fr/products/crossdevtools/cadius"
  url "https://github.com/mach-kernel/cadius/archive/1.4.5.tar.gz"
  sha256 "2c88bfa75a3b7ef0df81cfe69665a167228f78299a9885d5b2f0d92cb9ec55af"

  conflicts_with "cadius", because: "both install `cadius`"

  def install
    system "make"
    bin.install "./bin/release/cadius"
  end

  test do
    system "#{bin}/cadius"
  end
end
