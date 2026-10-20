class ApplecommanderAcx < Formula
  desc "Move data between Apple ][ disk images and native filesystem"
  homepage "https://applecommander.github.io/"

  version "15.1"

  if Hardware::CPU.arm?
    url "https://github.com/AppleCommander/AppleCommander/releases/download/#{version}/acx-mac-aarch64-#{version}"
    sha256 "e55e4824b51c66efcd7ea0f89841d9148ece3c2847a5d3aa1074e3a700ea5f0e"
  else
    url "https://github.com/AppleCommander/AppleCommander/releases/download/#{version}/acx-mac-x86_64-#{version}"
    sha256 "57aa6e8bc2e10915ee4bf3df21942f585351fb311532be68a47280e7fab38cf4"
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
