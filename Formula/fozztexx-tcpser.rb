class FozztexxTcpser < Formula
  desc "Serial to IP modem emulation program"
  homepage "https://github.com/fozztexx/tcpser"
  url "https://github.com/FozzTexx/tcpser.git",
    :revision => "9413ac1d37ec5750472a8b8b59b4caf18169be05"
  version "20180402" # Date of commit
  head "https://github.com/FozzTexx/tcpser.git", :branch => "master"

  def install
    system "make"
    bin.install "tcpser"
  end

  test do
    system "false"
  end
end
