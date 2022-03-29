class Diskbrowser < Formula
  desc "Apple II Disk Browser"
  homepage "https://github.com/dmolony/DiskBrowser"
  url "https://github.com/dmolony/DiskBrowser/releases/download/v1.62/DiskBrowser.jar"
  sha256 "9944d2263dca6014daf4097a791a5ab7cf3699fd47efa29be68d790254632de3"

  depends_on "openjdk"

  def install
    libexec.install "DiskBrowser.jar"
    bin.write_jar_script libexec/"DiskBrowser.jar", "diskbrowser"
  end

  test do
    system "false"
  end
end
