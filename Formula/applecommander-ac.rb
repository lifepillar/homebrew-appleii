class ApplecommanderAc < Formula
  desc "Move data between Apple ][ disk images and native filesystem"
  homepage "https://applecommander.github.io/"

  version "14.1"

  if Hardware::CPU.arm?
    url "https://github.com/AppleCommander/AppleCommander/releases/download/#{version}/ac-mac-aarch64-#{version}"
    sha256 "1339a01df2c29509c62083c5cf6bf7b30f5dc3ed6d77100a208cdeaf07f6c6ab"
  else
    url "https://github.com/AppleCommander/AppleCommander/releases/download/#{version}/ac-mac-x86_64-#{version}"
    sha256 "5690742ead7538eee7aa0aa7563c437ed05446b67d65bd5425fb14e90a0c4a7b"
  end

  def install
    executable = Hardware::CPU.arm? ? "ac-mac-aarch64-#{version}" : "ac-mac-x86_64-#{version}"
    bin.install executable => "ac"
  end

  def caveats
    "The command-line executable is called `ac`."
  end

  test do
    system "false"
  end
end
