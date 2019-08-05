class Diskbrowser < Formula
  desc "Apple II Disk Browser"
  homepage "https://github.com/dmolony/DiskBrowser"
  url "https://github.com/dmolony/DiskBrowser/releases/download/v1.0.37/DiskBrowser.jar"
  sha256 "077455c644e5db2826081ddbd14387e57253fe2aa831260ef0eed5b72dd7e9a5"

  depends_on :java => "1.10+"

  def install
    libexec.install "DiskBrowser.jar"
    bin.write_jar_script libexec/"DiskBrowser.jar", "diskbrowser"
  end

  test do
    system "false"
  end
end
