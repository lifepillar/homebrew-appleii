class Diskbrowser < Formula
  desc "Apple II Disk Browser"
  homepage "https://github.com/dmolony/DiskBrowser"
  url "https://github.com/dmolony/DiskBrowser/releases/download/v1.0.2/DiskBrowser.jar"
  version "1.0.2"
  sha256 "d1d35a7977d68a6658c28ca75e302a9bc242c07ff0b18401f5383f490a00e155"

  depends_on :java => "1.6+"

  def install
    libexec.install "DiskBrowser.jar"
    bin.write_jar_script libexec/"DiskBrowser.jar", "diskbrowser"
  end

  test do
    system "false"
  end
end
