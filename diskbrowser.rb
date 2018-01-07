class Diskbrowser < Formula
  desc "Apple II Disk Browser"
  homepage "https://github.com/dmolony/DiskBrowser"
  url "https://github.com/dmolony/DiskBrowser/releases/download/v1.0.24/DiskBrowser.jar"
  version "1.0.24"
  sha256 "de75936415e01e9ec2dcf0ff8ed81a53b8b0567868bcc03cb5f9ed7f30d3e79b"

  depends_on :java => "1.6+"

  def install
    libexec.install "DiskBrowser.jar"
    bin.write_jar_script libexec/"DiskBrowser.jar", "diskbrowser"
  end

  test do
    system "false"
  end
end
