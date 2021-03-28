class Bmp2dhr < Formula
  desc "Convert modern graphics to Apple II graphics"
  homepage "https://www.appleoldies.ca/bmp2dhr/"
  url "https://www.appleoldies.ca/cc65/programs/dhgr/bmp2dhr.zip"
  version "20160824"
  sha256 "a55ea2f0bedf9229f566a3bba7c60cf1c970e6e0f51f5fb7cfc52166e740e4ee"

  # To use the batch files provided with A2B to do automatic conversions
  depends_on "imagemagick"

  conflicts_with "digarok-bmp2dhr", because: "both install a `b2d` executable"

  patch :DATA

  def install
    cd "a2fcbmp" do
      system ENV.cc, "-DMINGW", "-o", "a2b", "a2fcbmp.c"
    end
    cd "src" do
      system ENV.cc, "-DMINGW", "-o", "b2d", "b2d.c"
    end
    cd "magick" do
      system ENV.cc, "-DMINGW", "-o", "m2s", "m2s.c"
    end
    libexec.install "bmp"
    libexec.install "dither"
    libexec.install "msk"
    libexec.install "SHR/scripts"
    libexec.install "template"
    bin.install "a2fcbmp/a2b"
    bin.install_symlink bin/"a2b" => "a2fcbmp"
    bin.install "src/b2d"
    bin.install_symlink bin/"b2d" => "bmp2dhr"
    bin.install "magick/m2s"
  end

  def caveats
    <<~EOS
      A template directory can be copied from #{libexec}/template

      Post-processing scripts are available at #{libexec}/scripts
    EOS
  end

  test do
    system "false"
  end
end

__END__
diff --git a/a2fcbmp/a2fcbmp.c b/a2fcbmp/a2fcbmp.c
index db8fb35..a8d82f1 100644
--- a/a2fcbmp/a2fcbmp.c
+++ b/a2fcbmp/a2fcbmp.c
@@ -76,6 +76,7 @@
 /*                    Should now run everywhere (Windows, Linux, OSX)       */
 /* ------------------------------------------------------------------------ */
 
+#include <ctype.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
@@ -115,6 +116,8 @@
 /* Declarations, Vars. etc.                                                 */
 /* ------------------------------------------------------------------------ */
 
+int cmpstr(char *str, char *cmp);
+
 /* options flags */
 
 int longnames = 1, bmp = 0, bm2 = 0, bmp3 = 0, a2fc = 0, auxbin = 0, tohgr = 0, dhr = 0, frag = 0,
diff --git a/magick/m2s.c b/magick/m2s.c
index 9d03dcf..dbd354e 100644
--- a/magick/m2s.c
+++ b/magick/m2s.c
@@ -62,6 +62,7 @@ M2S.EXE - WIN32
 Built under MinGW 5.1.4 (gcc)
 ----------------------------------------------------------------------- */
 
+#include <ctype.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
diff --git a/src/b2d.c b/src/b2d.c
index ae2980b..6ae3e9d 100644
--- a/src/b2d.c
+++ b/src/b2d.c
@@ -277,6 +277,7 @@ documentation can be reviewed for additional information.
 /* ========================== includes ============================= */
 /* ***************************************************************** */
 
+#include <ctype.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
