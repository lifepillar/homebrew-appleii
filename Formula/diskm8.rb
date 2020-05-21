class Diskm8 < Formula
  desc "Command-line tool for manipulating and managing Apple II DSK images"
  homepage "https://paleotronic.com/software/microm8/"
  url "https://github.com/paleotronic/diskm8/archive/v0.5.7.tar.gz"
  sha256 "79349f996937e641b744d4f167bc43b1459ff7f1c108b7ee405033e921ea8c6e"
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
