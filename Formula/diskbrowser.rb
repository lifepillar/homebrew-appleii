class Diskbrowser < Formula
  desc "Apple II Disk Browser"
  homepage "https://github.com/dmolony/DiskBrowser"
  url "https://github.com/dmolony/DiskBrowser/releases/download/v1.65/DiskBrowser.jar"
  sha256 "57d0c7995d274ef85d6e22340eedc89b83325eac659c42845787d1354384da0c"

  depends_on "openjdk"

  def install
    libexec.install "DiskBrowser.jar"
    bin.write_jar_script libexec/"DiskBrowser.jar", "diskbrowser"
  end

  test do
    system "false"
  end
end
