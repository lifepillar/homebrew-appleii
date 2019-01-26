class AppleIiCassetteRecover < Formula
  desc "Recover data from Apple ][ cassette image WAVE files"
  homepage "https://github.com/cmosher01/Apple-II-Cassette-Recover"
  url "https://github.com/cmosher01/Apple-II-Cassette-Recover.git",
    :revision => "9c47d0a901ea9e94ba7dd46cfbfa91dd71f40686"
  version "20190123" # Date of commit
  sha256 "798e6fcdcf7add395f9e741f9afc2d323e10d4d839a6d4cb2b09c101058afc57"
  head "https://github.com/cmosher01/Apple-II-Cassette-Recover.git"

  depends_on "qt" => :build
  depends_on "sdl2" => :build

  def install
    system "qmake"
    system "make"
    bin.install "./a2cassre.app/Contents/MacOS/a2cassre"
  end

  def caveats; <<~EOS
    To get started, type 'a2cassre'.
  EOS
  end

  test do
    system "false"
  end
end
