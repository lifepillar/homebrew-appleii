class Diskbrowser < Formula
  desc "Apple II Disk Browser"
  homepage "https://github.com/dmolony/DiskBrowser"
  url "https://github.com/dmolony/DiskBrowser/releases/download/v1.42/DiskBrowser.jar"
  sha256 "76f7206b3ec7da412695325308ebff90e4fe1eb140ffd16b0684de612b587770"

  depends_on :java => "1.13+"

  def install
    libexec.install "DiskBrowser.jar"
    bin.write_jar_script libexec/"DiskBrowser.jar", "diskbrowser"
  end

  test do
    system "false"
  end
end
