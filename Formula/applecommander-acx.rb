class ApplecommanderAcx < Formula
  desc "Move data between Apple ][ disk images and native filesystem"
  homepage "https://applecommander.github.io/"

  version "14.0"

  if Hardware::CPU.arm?
    url "https://github.com/AppleCommander/AppleCommander/releases/download/#{version}/acx-mac-aarch64-#{version}"
    sha256 "2c50eabbce9ec20165ec990dc2151a2683d2369b88e2b094c0e80a2e35e9405f"
  else
    url "https://github.com/AppleCommander/AppleCommander/releases/download/#{version}/acx-mac-x86_64-#{version}"
    sha256 "d051343a3c0ec0b8c60372cd1599062b6129e48b215b31ed7f0e09309a121693"
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
