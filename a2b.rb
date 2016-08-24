class A2b < Formula
  desc "Convert modern graphics to Apple IIGS SHR graphics"
  homepage "http://www.appleoldies.ca/a2b/"
  url "http://www.appleoldies.ca/a2b/Summer2015/a2bSnapShotSummer2015.zip"
  version "8.0"
  sha256 "4cd25bccddae411a512ef172b447083ca9d4eb72ffb58a5bdadd1e4200a8b0ac"

  # Fix random() function conflicting with the same function in stdlib.h
  patch :DATA

  def install
    cd "a2fcbmp" do
      system ENV.cc, "-DMINGW", "-arch", "i386", "-o", "a2b", "a2fcbmp.c"
    end
    bin.install "a2fcbmp/a2b"
    bin.install_symlink bin/"a2b" => "a2fcbmp"
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
 
