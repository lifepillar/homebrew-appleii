class ReinetteIiPlus < Formula
  desc "A French Apple II plus emulator"
  homepage "https://github.com/ArthurFerreira2/reinette-II-plus"
  url "https://github.com/ArthurFerreira2/reinette-II-plus/archive/0.3b.tar.gz"
  sha256 "f73809580cb026fe5d146b126aa5ee33c0e295d3629e0d4d587d3de0dc6c9c5a"

  depends_on "sdl2"

  def shim_script(target)
    <<~EOS
      #!/bin/bash
      cd "#{libexec}"; exec ./#{target} "$@"; cd -
    EOS
  end

  patch :DATA

  def install
    system "make"
    libexec.install "reinetteII+"
    libexec.install "assets"
    libexec.install "rom"
    libexec.install "DOS3.3 Blank.nib"
    (bin+"reinetteII+").write shim_script("reinetteII+")
  end

  test do
    system "false"
  end
end

__END__
diff --git a/Makefile b/Makefile
index 32374dd..69ea68f 100644
--- a/Makefile
+++ b/Makefile
@@ -3,10 +3,10 @@ FLAGS = -std=c99 -pedantic -Wpedantic -Wall -O3 -Werror
 
 LIBS = -lSDL2
 # comment this line if you are under Linux :
-WIN32-LIBS = -lmingw32 -lSDL2main -Wl,-subsystem,windows
+#WIN32-LIBS = -lmingw32 -lSDL2main -Wl,-subsystem,windows
 
 # comment this line if you are under Linux :
-WIN32-RES = reinetteII+.res
+#WIN32-RES = reinetteII+.res
 
 reinetteII+: reinetteII+.c puce6502.c $(WIN32-RES)
        $(CC) $^ $(FLAGS) $(WIN32-LIBS) $(LIBS) -o $@
