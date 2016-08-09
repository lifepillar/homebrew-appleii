class Diskbrowser < Formula
  desc "Apple II Disk Browser"
  homepage "https://github.com/dmolony/DiskBrowser"
  url "https://github.com/dmolony/DiskBrowser/releases/download/v1.0.13/DiskBrowser.jar"
  version "1.0.13"
  sha256 "f4b9edb2eb8f618dcdf2c686bfe5914180fa05c8b8333fbb9a8b18ac74c585d4"

  depends_on :java => "1.6+"

  def install
    libexec.install "DiskBrowser.jar"
    bin.write_jar_script libexec/"DiskBrowser.jar", "diskbrowser"
  end

  test do
    system "false"
  end
end
