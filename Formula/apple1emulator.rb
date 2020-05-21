class Apple1emulator < Formula
  desc "Apple 1 Emulator"
  homepage "https://github.com/alexander-akhmetov/apple1"
  url "https://github.com/alexander-akhmetov/apple1/archive/0.1.0.tar.gz"
  head "https://github.com/alexander-akhmetov/apple1.git"

  depends_on "rust" => :build

  conflicts_with "apple1", :because => "both install an `apple1` executable"

  def install
    system "cargo", "install", "--root", prefix, "--path", "."
    bin.install "./target/release/apple1"
    libexec.install Dir["./asm/*"]
    libexec.install Dir["./roms/*"]
    libexec.install Dir["./sys/*"]
  end

  def caveats
    <<~EOS
      Supporting files have been installed inside #{libexec}/
    EOS
  end

  test do
    system "false"
  end
end
