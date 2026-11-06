class ApplecommanderAc < Formula
  desc "Move data between Apple ][ disk images and native filesystem"
  homepage "https://applecommander.github.io/"

  version "15.2"

  if Hardware::CPU.arm?
    url "https://github.com/AppleCommander/AppleCommander/releases/download/#{version}/ac-mac-aarch64-#{version}"
    sha256 "1e5cd6d88f281b3585aeff843ae4dd11c1f4a20a00f71170aac92de01e3eec79"
  else
    url "https://github.com/AppleCommander/AppleCommander/releases/download/#{version}/ac-mac-x86_64-#{version}"
    sha256 "a0553178722926db61e4c15ba26966ebdefc43e7a1465c845d99147d854bd337"
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
