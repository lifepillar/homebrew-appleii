class Diskbrowser < Formula
  desc "Apple II Disk Browser"
  homepage "https://github.com/dmolony/DiskBrowser"
  url "https://github.com/dmolony/DiskBrowser/releases/download/1.0.30/DiskBrowser.jar"
  sha256 "3f1c22263dc7981ed5937faff1209cfb05a8e013988495bd22d8fc2f28a87b1f"

  depends_on :java => "1.10+"

  def install
    libexec.install "DiskBrowser.jar"
    bin.write_jar_script libexec/"DiskBrowser.jar", "diskbrowser"
  end

  test do
    system "false"
  end
end
