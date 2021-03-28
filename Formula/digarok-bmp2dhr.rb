class DigarokBmp2dhr < Formula
  desc "Convert modern graphics to Apple II graphics"
  homepage "https://github.com/digarok/b2d"
  url "https://github.com/digarok/b2d/releases/download/v1.4/b2d-macos-latest-v1.4.zip"
  sha256 "a7943907d6b26de946d5242fc4359f1e182a3bdf3c1380240693b5ae04996e8b"

  conflicts_with "bmp2dhr", because: "both install a `b2d` executable"

  def install
    bin.install "b2d"
    bin.install_symlink bin/"b2d" => "bmp2dhr"
  end

  test do
    system "false"
  end
end
