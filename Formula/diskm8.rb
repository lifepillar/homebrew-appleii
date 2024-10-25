class Diskm8 < Formula
  desc "Command-line tool for manipulating and managing Apple II DSK images"
  homepage "https://paleotronic.com/software/microm8/"
  url "https://github.com/paleotronic/diskm8/archive/refs/tags/v0.6.1.tar.gz"
  sha256 "8a5d1e86e7401fe2de7988994a9926f2197f1c466603f33edb59505561cd5cac"
  head "https://github.com/paleotronic/diskm8.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GOROOT"] = Formula["go"].opt_libexec
    ENV["GOOS"] = "darwin"
    ENV["GOARCH"] = Hardware::CPU.arm? ? "arm64" : "amd64"

    system "go", "build", "-o", "diskm8"
    bin.install "diskm8" => "diskm8"
  end

  test do
    system "false"
  end
end
