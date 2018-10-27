class Dskalyzer < Formula
  desc "Apple II disk image management tool"
  homepage "https://github.com/paleotronic/dskalyzer"
  url "https://github.com/paleotronic/dskalyzer/archive/v0.1.3.tar.gz"
  sha256 "6e150746eb62bfa80b8edc513cd786f6a7917b837fe1ecf199eac132ff6b9d03"
  head "https://github.com/paleotronic/dskalyzer.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GOROOT"] = Formula["go"].opt_libexec

    (buildpath/"src/github.com/paleotronic/dskalyzer").install buildpath.children
    cd "src/github.com/paleotronic/dskalyzer" do
      system "./make.sh"
    end
    system "unzip", "src/github.com/paleotronic/dskalyzer/publish/dskalyzer-darwin-amd64.zip"
    bin.install "dskalyzer" => "dskalyzer"
  end

  test do
    system "false"
  end
end
