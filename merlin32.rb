class Merlin32 < Formula
  desc "Multi-pass Cross Assembler for 6502/65c02/65c816 processors."
  homepage "http://www.brutaldeluxe.fr/products/crossdevtools/merlin/"
  url "http://www.brutaldeluxe.fr/products/crossdevtools/merlin/Merlin32_v1.0.zip"
  sha256 "eb9203b22dba23e70382ab876112e826d4c6bb3d04004f712fd8a9df56778e39"

  # Fix printf() placeholder being the wrong type
  patch :DATA

  def install
    cd "Source" do
      system "make", "-f", "linux_makefile"
    end
    bin.install "Source/Merlin32"
    prefix.install "Library"
  end

  def caveats; <<~EOS
    Macro definition files are in #{prefix}/Library.
    EOS
  end

  test do
    system "Merlin32"
  end
end

__END__
diff --git a/Source/a65816_Line.c b/Source/a65816_Line.c
index 2cc4677..ad3732f 100644
--- a/Source/a65816_Line.c
+++ b/Source/a65816_Line.c
@@ -2409,7 +2409,7 @@ int ComputeLineAddress(struct omf_segment *current_omfsegment, struct omf_projec
                 }
               if(nb_byte < 0)
                 {
-                  sprintf(param->buffer_error,"Error : Evaluation of DS data size ends up as negative value (%d) : '%d' (line %d, file '%s')",nb_byte,operand,current_line->file_line_number,current_line->file->file_name);
+                  sprintf(param->buffer_error,"Error : Evaluation of DS data size ends up as negative value (%d) : '%s' (line %d, file '%s')",nb_byte,operand,current_line->file_line_number,current_line->file->file_name);
                   my_RaiseError(ERROR_RAISE,param->buffer_error);
                 }
                 
