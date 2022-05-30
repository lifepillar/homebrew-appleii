class Diskbrowser < Formula
  desc "Apple II Disk Browser"
  homepage "https://github.com/dmolony/DiskBrowser"
  url "https://github.com/dmolony/DiskBrowser/releases/download/v1.63/DiskBrowser.jar"
  sha256 "21267f0d3c11ced7647e082352008455835871cdc6b4053e4e11f2d00add566a"

  depends_on "openjdk"

  def install
    libexec.install "DiskBrowser.jar"
    bin.write_jar_script libexec/"DiskBrowser.jar", "diskbrowser"
  end

  test do
    system "false"
  end
end
