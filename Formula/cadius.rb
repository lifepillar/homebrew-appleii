class Cadius < Formula
  desc "BrutalDeluxe's Cadius ProDOS disk imaging utility"
  homepage "https://www.brutaldeluxe.fr/products/crossdevtools/cadius"
  url "https://www.brutaldeluxe.fr/products/crossdevtools/cadius/Cadius_v1.4_mac.zip"
  sha256 "9621dcca4a58c5911bf9daf181ec296408613c6a1b174719a0bd8b93126f8c6e"

  conflicts_with "mach-kernel-cadius", because: "both install `cadius`"

  def install
    bin.install "cadius"
  end

  test do
    system "#{bin}/cadius", "--version"
  end
end
