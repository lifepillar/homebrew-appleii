class ApplecommanderAcx < Formula
  desc "Move data between Apple ][ disk images and native filesystem"
  homepage "https://applecommander.github.io/"

  version "15.2"

  if Hardware::CPU.arm?
    url "https://github.com/AppleCommander/AppleCommander/releases/download/#{version}/acx-mac-aarch64-#{version}"
    sha256 "13d9e03e2054296626a324b0d71be1923c81ddfbcd92d77b54b8efc1e74fede4"
  else
    url "https://github.com/AppleCommander/AppleCommander/releases/download/#{version}/acx-mac-x86_64-#{version}"
    sha256 "0cdb8fc476d1337fa299c9560d73cd85db0bcdd620f86f66b47ef8dbbc3e8a1c"
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
