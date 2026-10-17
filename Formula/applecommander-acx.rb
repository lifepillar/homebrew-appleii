class ApplecommanderAcx < Formula
  desc "Move data between Apple ][ disk images and native filesystem"
  homepage "https://applecommander.github.io/"

  version "15.0"

  if Hardware::CPU.arm?
    url "https://github.com/AppleCommander/AppleCommander/releases/download/#{version}/acx-mac-aarch64-#{version}"
    sha256 "d69ee2ff8a4e388aaf8c147c5b398a7265fbed3c74c8149d0aba4a30834af62c"
  else
    url "https://github.com/AppleCommander/AppleCommander/releases/download/#{version}/acx-mac-x86_64-#{version}"
    sha256 "5375e6cba1dc71b0cc3a5eea6837b799f3ab2383c88d3917b6fa6a23112dbfa5"
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
