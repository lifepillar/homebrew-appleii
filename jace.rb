class Jace < Formula
  desc "Logical reproduction of an enhanced Apple //e computer"
  homepage "https://sites.google.com/site/brendanrobert/projects/jace"
  url "https://github.com/badvision/jace/archive/v2.0b.tar.gz"
  version "2.0b"
  sha256 "5ca3e38a9af710f259fd11a9b482a59b1591669915d2de8c93451d22f6dc3bff"
  head "https://github.com/badvision/jace.git"

  depends_on :java => "1.6+"
  depends_on "maven" => :build


  def install
    system "mvn", "package"
    libexec.install "target/jfx/app/jace-2.0-SNAPSHOT-jfx.jar"
    bin.write_jar_script libexec/"jace-2.0-SNAPSHOT-jfx.jar", "jace", "-Duser.dir=#{etc}"
  end
  end

  test do
    false
  end
end
