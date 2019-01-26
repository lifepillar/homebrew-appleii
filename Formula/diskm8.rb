class Diskm8 < Formula
  desc "Command-line tool for manipulating and managing Apple II DSK images"
  homepage "http://www.microm8.com/diskm8/"
  url "https://github.com/paleotronic/diskm8/archive/v0.5.6.tar.gz"
  sha256 "cf31d8f2c2c29eb13a1c430b4749e4d6d6b7acd4a32cca73d8a33efa4fbdd5a7"
  head "https://github.com/paleotronic/diskm8.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GOROOT"] = Formula["go"].opt_libexec

    (buildpath/"src/github.com/paleotronic/diskm8").install buildpath.children
    cd "src/github.com/paleotronic/diskm8" do
      system "./make.sh"
    end
    system "unzip", "src/github.com/paleotronic/diskm8/publish/diskm8-darwin-amd64.zip"
    bin.install "diskm8" => "diskm8"
  end

  test do
    system "false"
  end
end
