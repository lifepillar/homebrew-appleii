class Diskbrowser < Formula
  desc "Apple II Disk Browser"
  homepage "https://github.com/dmolony/DiskBrowser"
  url "https://github.com/dmolony/DiskBrowser/releases/download/v1.66/DiskBrowser.jar"
  sha256 "3f5bf42b576ff538845f6a8f907ab6186589b87f6011ab7d2241fe89db90f4db"

  depends_on "openjdk"

  def install
    libexec.install "DiskBrowser.jar"
    bin.write_jar_script libexec/"DiskBrowser.jar", "diskbrowser"
  end

  test do
    system "false"
  end
end
