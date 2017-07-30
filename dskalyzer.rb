class Dskalyzer < Formula
  desc "Apple II disk image management tool"
  homepage "http://octalyzer.com/dskalyzer/"
  # In the following archive, src/ctest is mistakenly empty:
  # url "https://github.com/cmosher01/Apple-II-Disk-Tools/archive/1.1.tar.gz"
  # sha256 "fc84650bdd7f2f7d7a7f40914ec4b8e7bacb15377f70bf9ea0b1e2f60a16e7e2"
  url "https://github.com/paleotronic/dskalyzer/archive/v0.1.2.tar.gz"
  sha256 "221ebcec5464455fb6e061bb92f0151033d7c63d314082566ac870088404a697"
  head "https://github.com/paleotronic/dskalyzer.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GOROOT"] = Formula["go"].opt_libexec

    (buildpath/"src/github.com/paleotronic/dskalyzer").install buildpath.children
    cd "src/github.com/paleotronic/dskalyzer" do
      chmod 0755, "make.sh"
      system "./make.sh"
    end
    bin.install "src/github.com/paleotronic/dskalyzer/bin/dskalyzer-darwin-amd64" => "dskalyzer"
  end

  test do
    system "false"
  end
end
