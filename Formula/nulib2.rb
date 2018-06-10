class Nulib2 < Formula
  desc "NufxLib and NuLib2, Apple II file archive utilities"
  homepage "http://nulib.com"
  url "https://github.com/fadden/nulib2/archive/v3.1.0.tar.gz"
  sha256 "383127d6966edae09da550f4d7197e68eed101d239f2a23cee42dc086506af12"
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
