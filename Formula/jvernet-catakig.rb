class JvernetCatakig < Formula
  desc "Fork of Catakig that builds on newer Xcode"
  homepage "https://github.com/jvernet/Catakig"
  url "https://github.com/jvernet/Catakig.git",
    :branch => "master",
    :revision => "dc676711b8128453b7a897ff9a9e5008c416e260"
  version "dc676711"
  head "https://github.com/jvernet/Catakig.git"

  def install
    args = [
      "-configuration", "Release",
      "-alltargets",
      "MACOSX_DEPLOYMENT_TARGET=#{MacOS.version}",
      "SYMROOT=build",
      "PREFIX=#{prefix}",
      "ARCHS=i386"
    ]

    xcodebuild *args
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
