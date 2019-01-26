class JvernetCatakig < Formula
  desc "Fork of Catakig that builds on newer Xcode"
  homepage "https://github.com/jvernet/Catakig"
  url "https://github.com/jvernet/Catakig.git",
    :revision => "61f2551e236204b1fac5200e5ed0d8acbdc3b1e2"
  version "20190126"
  head "https://github.com/jvernet/Catakig.git"

  def install
    xcodebuild "-configuration", "Release",
      "-alltargets",
      "MACOSX_DEPLOYMENT_TARGET=#{MacOS.version}",
      "SYMROOT=build",
      "PREFIX=#{prefix}",
      "HEADER_SEARCH_PATHS=./Source/LibAppleII"

    prefix.install "build/Release/Catakig.app"
  end

  def caveats; <<~EOS
    Catakig.app has been installed in #{opt_prefix}.
    You may create an alias in your Applications folder if you want.
  EOS
  end

  test do
    system "false"
  end
end
