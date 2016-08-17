class Profuse < Formula
  desc "ProDOS file system for FUSE"
  homepage "https://github.com/ksherlock/profuse"
  head "https://github.com/ksherlock/profuse.git"

  depends_on :osxfuse

  def install
    system "make"
    # Do not install xattr, as it's already in OS X
    bin.install "o/apfm", "o/fuse_pascal", "o/newfs_pascal", "o/profuse"
  end

  test do
    system "false"
  end
end
