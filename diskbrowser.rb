class Diskbrowser < Formula
  desc "Apple II Disk Browser"
  homepage "https://github.com/dmolony/DiskBrowser"
  url "https://github.com/dmolony/DiskBrowser/releases/download/v1.0.12/DiskBrowser.jar"
  version "1.0.12"
  sha256 "1acdc43a9ea8b012f2f02340dc27ff44dbeaa3a51cbd8f9b4073fa361a713ed2"

  depends_on :java => "1.6+"

  def install
    libexec.install "DiskBrowser.jar"
    bin.write_jar_script libexec/"DiskBrowser.jar", "diskbrowser"
  end

  test do
    system "false"
  end
end
