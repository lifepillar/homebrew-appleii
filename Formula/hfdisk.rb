class Hfdisk < Formula
  desc "Port of the Apple MkLinux mac-fdisk pdisk utility"
  homepage "https://www.codesrc.com/gitweb/index.cgi?p=hfdisk.git;a=summary"
  url "https://www.codesrc.com/gitweb/index.cgi?p=hfdisk.git;a=snapshot;h=a7659ed434abc8fb6994498e9e0e6e2c40bfbf51;sf=tgz"
  version "1.0-rc3"
  sha256 "5e38c66169a1988441f9a7e4b68d692a4ea6450fe1fccb44b335788257163972"
  head "git://www.codesrc.com/git/hfdisk.git"

  def install
    system "make"
    bin.install "hfdisk"
    man8.install "hfdisk.8"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hfdisk -v")
  end
end
