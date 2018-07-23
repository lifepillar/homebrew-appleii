class Diskbrowser < Formula
  desc "Apple II Disk Browser"
  homepage "https://github.com/dmolony/DiskBrowser"
  url "https://github.com/dmolony/DiskBrowser/releases/download/v1.0.27/DiskBrowser.jar"
  sha256 "507185607879dbd3ea34e44ad29cf3dfd9b5e8abe2a7c42518b09c02c0882ff3"

  depends_on :java => "1.10+"

  def install
    libexec.install "DiskBrowser.jar"
    bin.write_jar_script libexec/"DiskBrowser.jar", "diskbrowser"
  end

  test do
    system "false"
  end
end
