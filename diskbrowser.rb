class Diskbrowser < Formula
  desc "Apple II Disk Browser"
  homepage "https://github.com/dmolony/DiskBrowser"
  url "https://github.com/dmolony/DiskBrowser/releases/download/v1.0.23/DiskBrowser.jar"
  version "1.0.23"
  sha256 "cb212623d37119dcfffd73f62f9127e5b8a253edfd09d4c4b967c8db71f7fbcd"

  depends_on :java => "1.6+"

  def install
    libexec.install "DiskBrowser.jar"
    bin.write_jar_script libexec/"DiskBrowser.jar", "diskbrowser"
  end

  test do
    system "false"
  end
end
