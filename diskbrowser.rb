class Diskbrowser < Formula
  desc "Apple II Disk Browser"
  homepage "https://github.com/dmolony/DiskBrowser"
  url "https://github.com/dmolony/DiskBrowser/releases/download/v1.0.19/DiskBrowser.jar"
  version "1.0.19"
  sha256 "880f541404b99aba9ee6efcdfcf0c90862059f15af048f0d36cec67f8d2ef7ab"

  depends_on :java => "1.6+"

  def install
    libexec.install "DiskBrowser.jar"
    bin.write_jar_script libexec/"DiskBrowser.jar", "diskbrowser"
  end

  test do
    system "false"
  end
end
