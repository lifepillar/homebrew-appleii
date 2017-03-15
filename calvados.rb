class Calvados < Formula
  desc "Gtk app designed as a workalike of CiderPress"
  homepage "https://github.com/softwarejanitor/calvados"
  url "https://github.com/softwarejanitor/calvados.git",
    :revision => "c5dda859f2f5d8fe62369cf050390de05275ce1f"
  version "c5dda859"
  head "https://github.com/softwarejanitor/calvados.git"

  depends_on "gtk"

  # Remove GTK flag causing build to fail
  patch :DATA

  def install
    system "make", "calvados"
    libexec.install "calvados"
    libexec.install Dir["images"]
    (bin/"calvados").write <<-eos.undent
        #!/bin/bash
        cd #{libexec} && exec "./calvados" "$@"
    eos
  end

  def caveats; <<-EOS.undent
    Calvados is still a work in progress and no
    functionality has been implemented yet.

    The executable is called `calvados`.
    EOS
  end

  test do
    system "false"
  end
end

__END__
diff --git a/Makefile b/Makefile
index 582085f..849eb42 100644
--- a/Makefile
+++ b/Makefile
@@ -3,7 +3,7 @@
 #
 NAME=calvados
 CFLAGS=-g -Wall -o $(NAME)
-GTKFLAGS=-export-dynamic `pkg-config --cflags --libs gtk+-2.0`
+GTKFLAGS=`pkg-config --cflags --libs gtk+-2.0`
 SRCS=calvados.c select_volume.c closing_dialog.c close_dialog.c show_about.c \
        disk_sector_viewer_popup.c create_disk_image.c new_archive.c \
        open_file.c okfunc_create_disk_image.c okfunc_select_volume.c \
