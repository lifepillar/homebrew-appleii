class Cadius < Formula
  desc "A maintained fork of BrutalDeluxe's Cadius ProDOS disk imaging utility (used for making Apple II disk images)."
  homepage "https://github.com/mach-kernel/cadius"
  url "https://github.com/mach-kernel/cadius/archive/1.4.0.tar.gz"
  version "1.4.0"
  sha256 "6755f73a45f879c361d0eacb923f675c66038699d9cfb4856ac6814832defc96"

  def install
    system "make"
    bin.install "./bin/release/cadius"
  end

  test do
    system "cadius"
  end
end
