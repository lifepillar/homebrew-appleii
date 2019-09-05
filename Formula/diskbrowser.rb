class Diskbrowser < Formula
  desc "Apple II Disk Browser"
  homepage "https://github.com/dmolony/DiskBrowser"
  url "https://github.com/dmolony/DiskBrowser/releases/download/v1.0.38/DiskBrowser.jar"
  sha256 "ed01cad2debb1d92ae7ef5258d1c0a5ec8f73711075ba0f70f93b39701397a1a"

  depends_on :java => "1.10+"

  def install
    libexec.install "DiskBrowser.jar"
    bin.write_jar_script libexec/"DiskBrowser.jar", "diskbrowser"
  end

  test do
    system "false"
  end
end
