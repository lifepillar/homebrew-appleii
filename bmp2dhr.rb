# frozen_string_literal: true
class Bmp2dhr < Formula
  desc "Convert modern graphics to Apple II graphics"
  homepage "http://www.appleoldies.ca/bmp2dhr/"
  url "http://www.appleoldies.ca/cc65/programs/dhgr/bmp2dhr.zip"
  version "20160824"
  sha256 "4cd25bccddae411a512ef172b447083ca9d4eb72ffb58a5bdadd1e4200a8b0ac"

  # To use the batch files provided with A2B to do automatic conversions
  depends_on "imagemagick"

  # Fix random() function conflicting with the same function in stdlib.h
  patch :DATA

  def install
    cd "a2fcbmp" do
      system ENV.cc, "-DMINGW", "-arch", "i386", "-o", "a2b", "a2fcbmp.c"
    end
    cd "src" do
      system ENV.cc, "-DMINGW", "-arch", "i386", "-o", "b2d", "b2d.c"
    end
    cd "magick" do
      system ENV.cc, "-DMINGW", "-arch", "i386", "-o", "m2s", "m2s.c"
    end
    cd "xpack" do
      system ENV.cc, "-DMINGW", "-arch", "i386", "-o", "xpack", "xpack.c"
    end
    libexec.install "bmp"
    libexec.install "dither"
    libexec.install "msk"
    libexec.install "template"
    bin.install "a2fcbmp/a2b"
    bin.install_symlink bin/"a2b" => "a2fcbmp"
    bin.install "src/b2d"
    bin.install_symlink bin/"b2d" => "bmp2dhr"
    bin.install "magick/m2s"
    bin.install "xpack/xpack"
    # Install scripts
    Dir["SHR/scripts/*.sh"].each do |s|
      bin.install s => "b2d-#{s.match('([^/]+)\.sh$')[1]}" # Prefix all script names with `b2d-`
    end
  end

  def caveats
    "A template directory can be copied from #{libexec}/template"
  end

  test do
    system "false"
  end
end

__END__
diff --git a/a2fcbmp/a2fcbmp.c b/a2fcbmp/a2fcbmp.c
index 496f043..d561452 100755
--- a/a2fcbmp/a2fcbmp.c
+++ b/a2fcbmp/a2fcbmp.c
@@ -1172,7 +1172,7 @@ unsigned char dlomaincolor[16] = {
 /* -------------------------------------------------------------- */
 /* http://stackoverflow.com/questions/7602919/how-do-i-generate-random-numbers-without-rand-function */
 ushort RandomSeed = (ushort)0xACE1;
-ushort random()
+ushort a2b_random()
 {
     ushort bit = ((RandomSeed >> 0) ^ (RandomSeed >> 2) ^ (RandomSeed >> 3) ^ (RandomSeed >> 5) ) & 1;
 
@@ -1193,7 +1193,7 @@ int RandomRange(int iMaxValue)
 
   do {
     /* get random number */
-    iRetVal = (int)random();
+    iRetVal = (int)a2b_random();
     /* get a positive value */
     if (iRetVal < 0) iRetVal *= -1;
 
