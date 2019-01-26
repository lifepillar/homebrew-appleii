class Calvados < Formula
  desc "Gtk app designed as a workalike of CiderPress"
  homepage "https://github.com/softwarejanitor/calvados"
  url "https://github.com/softwarejanitor/calvados.git",
    :revision => "f46ea157e7b0d950e0d4fb6a582f19b6ab3057d1"
  version "20190125"  # Date of commit
  head "https://github.com/softwarejanitor/calvados.git"

  depends_on "pkg-config" => :build
  depends_on "glib"
  depends_on "gtk+"

  def install
    gtkx = Formula["gtk+"]
    glib = Formula["glib"]
    glib_include = "#{glib.opt_include}/glib-2.0"
    inreplace "Makefile" do |s|
      s.gsub! "GTKFLAGS=", "GTKFLAGS=-I#{gtkx.opt_include}/gtk-2.0 "
      s.gsub! "INCLUDES=-I/usr/include/glib-2.0", "INCLUDES=-I#{glib_include} -I#{glib_include}/glib"
      s.gsub! "/usr/include", "#{HOMEBREW_PREFIX}/include"
    end
    system "make", "calvados"
    libexec.install "calvados"
    libexec.install "images"
    (bin/"calvados").write <<~EOS
      #!/bin/bash
      cd #{libexec} && exec "./calvados" "$@"
    EOS
  end

  def caveats; <<~EOS
    Calvados is still a work in progress and no
    functionality has been implemented yet.

    The executable is called `calvados`.
  EOS
  end

  test do
    system "false"
  end
end
