class FozztexxTcpser < Formula
  desc "Serial to IP modem emulation program"
  homepage "https://github.com/fozztexx/tcpser"
  url "https://github.com/FozzTexx/tcpser.git",
    revision: "95f4b515ef2f9a5473400229a44a31badc54188f"
  version "20200425" # Date of commit
  head "https://github.com/FozzTexx/tcpser.git", branch: "master"

  def install
    system "make"
    bin.install "tcpser"
  end

  test do
    system "false"
  end
end
