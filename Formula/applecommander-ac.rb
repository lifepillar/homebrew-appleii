class ApplecommanderAc < Formula
  desc "Move data between Apple ][ disk images and native filesystem"
  homepage "https://applecommander.github.io/"

  version "14.0"

  if Hardware::CPU.arm?
    url "https://github.com/AppleCommander/AppleCommander/releases/download/#{version}/ac-mac-aarch64-#{version}"
    sha256 "291c8485ce4027a6440bfaf1351df11d71f37d3028b98b00500a160c6bb7d78a"
  else
    url "https://github.com/AppleCommander/AppleCommander/releases/download/#{version}/ac-mac-x86_64-#{version}"
    sha256 "d051343a3c0ec0b8c60372cd1599062b6129e48b215b31ed7f0e09309a121693"
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
