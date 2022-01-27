class Diskbrowser < Formula
  desc "Apple II Disk Browser"
  homepage "https://github.com/dmolony/DiskBrowser"
  url "https://github.com/dmolony/DiskBrowser/releases/download/v1.61/DiskBrowser.jar"
  sha256 "423e4236c4f069ff5f17d991c71ab983a3f889f634084baf1969e2db2c3ba760"

  depends_on "openjdk"

  def install
    libexec.install "DiskBrowser.jar"
    bin.write_jar_script libexec/"DiskBrowser.jar", "diskbrowser"
  end

  test do
    system "false"
  end
end
