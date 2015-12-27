class Nulib2 < Formula
  desc "Disk and file archive program for NuFX  archives"
  homepage "http://nulib.com"
  url "https://github.com/fadden/nulib2/archive/v3.0.0.tar.gz"
  sha256 "0a0b33cf459d3b2a053f5ef6bbe9b0407cac3ab5e3f617fda06da3b6df949f85"
  head "https://github.com/fadden/nulib2.git"

  def install
    cd "nufxlib" do
      system "./configure", "--prefix=#{prefix}"
      system "make", "install"
    end

    cd "nulib2" do
      system "./configure", "--prefix=#{prefix}"
      system "make", "install"
    end
  end

  test do
    system "false"
  end
end
