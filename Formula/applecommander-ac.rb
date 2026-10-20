class ApplecommanderAc < Formula
  desc "Move data between Apple ][ disk images and native filesystem"
  homepage "https://applecommander.github.io/"

  version "15.1"

  if Hardware::CPU.arm?
    url "https://github.com/AppleCommander/AppleCommander/releases/download/#{version}/ac-mac-aarch64-#{version}"
    sha256 "659ed756d975694e9471bcf815e288de57624e8285f82c28074b6d855f03e852"
  else
    url "https://github.com/AppleCommander/AppleCommander/releases/download/#{version}/ac-mac-x86_64-#{version}"
    sha256 "f2d064d1d52e676c906901f2870adff3017ecd44eebc54ccc5361c6666dd91fd"
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
