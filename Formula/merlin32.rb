class Merlin32 < Formula
  desc "Multi-pass Cross Assembler for 6502/65c02/65c816 processors"
  homepage "http://www.brutaldeluxe.fr/products/crossdevtools/merlin/"
  url "https://www.brutaldeluxe.fr/products/crossdevtools/merlin/Merlin32_v1.0.zip"
  sha256 "0de8e9458579221501260a63802dab8cbd96fd524b78f674dc0d7b58d13d929c"

  def install
    File.rename "Source", "Merlin32"

    xcodebuild "-configuration", "Release",
      "-alltargets",
      "MACOSX_DEPLOYMENT_TARGET=#{MacOS.version}",
      "SYMROOT=build",
      "PREFIX=#{prefix}"

    bin.install "build/Release/Merlin32"
    prefix.install "Library" => "lib"
  end

  def caveats
    <<~EOS
      Macro definition files are in #{lib}.
      The executable is `Merlin32`.
    EOS
  end

  test do
    system "#{bin}/Merlin32"
  end
end
