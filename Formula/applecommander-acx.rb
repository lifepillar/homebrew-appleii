class ApplecommanderAcx < Formula
  desc "Move data between Apple ][ disk images and native filesystem"
  homepage "https://applecommander.github.io/"

  version "14.1"

  if Hardware::CPU.arm?
    url "https://github.com/AppleCommander/AppleCommander/releases/download/#{version}/acx-mac-aarch64-#{version}"
    sha256 "970a5708164c38bc562963b4476218f27034638de01ca16818e7228214a2c8b0"
  else
    url "https://github.com/AppleCommander/AppleCommander/releases/download/#{version}/acx-mac-x86_64-#{version}"
    sha256 "09a938fc0608f8bed562257e72baeb94a5d8fb13209ba85d853e44e5d2a25f8b"
  end

  def install
    executable = Hardware::CPU.arm? ? "acx-mac-aarch64-#{version}" : "acx-mac-x86_64-#{version}"
    bin.install executable => "acx"
  end

  def caveats
    "The command-line executable is called `acx`."
  end

  test do
    system "false"
  end
end
