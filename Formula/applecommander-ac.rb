class ApplecommanderAc < Formula
  desc "Move data between Apple ][ disk images and native filesystem"
  homepage "https://applecommander.github.io/"

  version "15.0"

  if Hardware::CPU.arm?
    url "https://github.com/AppleCommander/AppleCommander/releases/download/#{version}/ac-mac-aarch64-#{version}"
    sha256 "fce08d3141d27820fd7e7605604586383d5ef0c046c26b55287d2fc676565807"
  else
    url "https://github.com/AppleCommander/AppleCommander/releases/download/#{version}/ac-mac-x86_64-#{version}"
    sha256 "3b18bde0a674e550f847633b4924a71bf286ceafe49e66bddaa68baeceb45858"
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
