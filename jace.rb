class Jace < Formula
  homepage "https://sites.google.com/site/brendanrobert/projects/jace"
  url "https://downloads.sourceforge.net/project/java-ace/Builds/jace.jar"
  version "2013-04-07"
  sha256 "3f6d0227f46f7a8cacce5e8acdc57aca8cc09803fe680ff6f4aced62d3971754"

  depends_on :java => "1.6+"

  def install
    libexec.install "jace.jar"
    bin.write_jar_script libexec/"jace.jar", "jace", "-Duser.dir=$HOME"
  end

  test do
  end
end
