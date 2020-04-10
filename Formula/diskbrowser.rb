class Diskbrowser < Formula
  desc "Apple II Disk Browser"
  homepage "https://github.com/dmolony/DiskBrowser"
  url "https://github.com/dmolony/DiskBrowser/releases/download/1.44/DiskBrowser.jar"
  sha256 "cdff1062098bdf142cdef8517b7788540063aa0da79cad9352c1054b8ea589f1"

  depends_on :java => "1.13+"

  def install
    libexec.install "DiskBrowser.jar"
    bin.write_jar_script libexec/"DiskBrowser.jar", "diskbrowser"
  end

  test do
    system "false"
  end
end
