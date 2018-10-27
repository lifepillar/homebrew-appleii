class Diskbrowser < Formula
  desc "Apple II Disk Browser"
  homepage "https://github.com/dmolony/DiskBrowser"
  url "https://github.com/dmolony/DiskBrowser/releases/download/v1.0.29/DiskBrowser.jar"
  sha256 "a4a2ede6b507940e37535b0a9c66107ead51c7ac153f67b6505162c2878eafb3"

  depends_on :java => "1.10+"

  def install
    libexec.install "DiskBrowser.jar"
    bin.write_jar_script libexec/"DiskBrowser.jar", "diskbrowser"
  end

  test do
    system "false"
  end
end
