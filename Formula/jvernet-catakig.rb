class JvernetCatakig < Formula
  desc "Fork of Catakig that builds on newer Xcode"
  homepage "https://github.com/jvernet/Catakig"
  url "https://github.com/jvernet/Catakig.git",
    :revision => "83d0e8f94047ddcc862a848e63cf610a05e42b0f"
  version "20190303"
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
    ROM files should be put in #{opt_prefix}.
  EOS
  end

  test do
    system "false"
  end
end
