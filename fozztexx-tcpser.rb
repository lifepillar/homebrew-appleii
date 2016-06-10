class FozztexxTcpser < Formula
  desc "Serial to IP modem emulation program"
  homepage "https://github.com/fozztexx/tcpser"
  url "https://github.com/FozzTexx/tcpser.git",
    :branch => "master",
    :revision => "62b801cd8146a879b6d81b20aa02bf6553b0581a"
  version "62b801cd"
  head "https://github.com/FozzTexx/tcpser.git", :branch => "master"

  def install
    system "make"
    bin.install "tcpser"
  end

  test do
    system "false"
  end
end
