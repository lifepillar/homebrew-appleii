class ReinetteIiPlus < Formula
  desc "French Apple II plus emulator"
  homepage "https://github.com/ArthurFerreira2/reinette-II-plus"
  url "https://github.com/ArthurFerreira2/reinette-II-plus/archive/refs/tags/v0.4.8.tar.gz"
  sha256 "ea630d3ca3555edec742a633993db1bf8655c3a1b66e6398fd1346b01e977ed3"

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
    libexec.install "DOS 3.3.nib"
    (bin+"reinetteII+").write shim_script("reinetteII+")
  end

  def caveats
    <<~EOS
      The executable is `reinetteII+`.
    EOS
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
@@ -3,8 +3,8 @@

 LIBS = -lSDL2
 # comment these two lines if you are under Linux :
-WIN32-LIBS = -lmingw32 -lSDL2main -Wl,-subsystem,windows
-WIN32-RES = reinetteII+.res
+#WIN32-LIBS = -lmingw32 -lSDL2main -Wl,-subsystem,windows
+#WIN32-RES = reinetteII+.res

 reinetteII+: reinetteII+.c puce6502.c $(WIN32-RES)
 	$(CC) $^ $(FLAGS) $(WIN32-LIBS) $(LIBS) -o $@
