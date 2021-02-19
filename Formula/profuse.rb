class Profuse < Formula
  desc "ProDOS file system for FUSE"
  homepage "https://github.com/ksherlock/profuse"
  url "https://github.com/ksherlock/profuse/archive/2016-08-16.tar.gz"
  version "2016-08-16"
  sha256 "83ce3a7e3001ea1816d3518f29a6532c857e500be6a780586c5fd365d85a77aa"
  head "https://github.com/ksherlock/profuse.git"

  on_macos do
    deprecate! date: "2020-11-10", because: "requires FUSE"
    depends_on :osxfuse
  end

  def install
    system "make"
    # Do not install xattr, as it's already in OS X
    bin.install "o/apfm", "o/fuse_pascal", "o/newfs_pascal", "o/profuse"
  end

  test do
    system "false"
  end
end
