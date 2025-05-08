class Apple1emulator < Formula
  desc "Apple I Emulator"
  homepage "https://github.com/alexander-akhmetov/apple1"
  url "https://github.com/alexander-akhmetov/apple1/archive/refs/tags/0.4.0.tar.gz"
  sha256 "62efa62e11971519a893214224b3d6f652d6c9e0857e4406ff827b6a8197bd57"
  head "https://github.com/alexander-akhmetov/apple1.git"

  depends_on "rust" => :build

  conflicts_with "apple1", because: "both install an `apple1` executable"

  def install
    inreplace "src/bin.rs" do |s|
      s.sub! "sys/wozmon.bin", "#{libexec}/sys/wozmon.bin"
      s.sub! "sys/replica1.bin", "#{libexec}/sys/replica1.bin"
    end
    system "cargo", "install", "--root", prefix, "--path", "."
    bin.install "./target/release/apple1"
    libexec.install "asm"
    libexec.install "roms"
    libexec.install "sys"
  end

  def caveats
    <<~EOS
      Supporting files have been installed inside #{libexec}/
      For example:

          apple1 -p #{libexec}/asm/apple1hello.asm

    EOS
  end

  test do
    system "false"
  end
end
