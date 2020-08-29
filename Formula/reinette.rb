class Reinette < Formula
  desc "A French Apple I emulator"
  homepage "https://github.com/ArthurFerreira2/reinette"
  url "https://github.com/ArthurFerreira2/reinette.git",
    :revision => "e565bee15259ef1661615a6726295bf17a0878c3"
  version "20191220" # Date of commit

  depends_on "ncurses"

  def install
    system "make"
    bin.install "reinette"
  end

  test do
    system "false"
  end
end
