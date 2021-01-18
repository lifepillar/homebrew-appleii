class Jace < Formula
  desc "Logical reproduction of an enhanced Apple //e computer"
  homepage "https://sites.google.com/site/brendanrobert/projects/jace"
  url "https://github.com/badvision/jace/archive/2.0-Stable.tar.gz"
  version "2.0-Stable"
  sha256 "eb3f6f044d05326e43873eac93ebfad778c47f4c286ba9654d759b10f0fb46e1"
  head "https://github.com/badvision/jace.git"

  depends_on "maven" => :build
  depends_on "openjdk@8"

  def install
    system "./build.sh"
    libexec.install "target/Jace.jar"
    bin.write_jar_script libexec/"Jace.jar", "jace", "-Duser.dir=#{etc}", :java_version => "1.8"
  end

  def caveats; <<~EOS
    The executable is called `jace`.
    Jace configuration is saved in
        #{etc}/.jace.conf
  EOS
  end

  test do
    false
  end
end
