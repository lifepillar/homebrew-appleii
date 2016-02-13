class Jace < Formula
  desc "Logical reproduction of an enhanced Apple //e computer"
  homepage "https://sites.google.com/site/brendanrobert/projects/jace"
  url "https://github.com/badvision/jace/releases/download/2.0-stable/Jace.jar"
  version "2.0"
  sha256 "169df9846dfd496b985c0635717cbb1b93d2e4421d3662640ce32b2737ff6395"
  head "https://github.com/badvision/jace.git"

  depends_on :java => "1.8+"
  depends_on "maven" => :build if build.head?

  def install
    if head?
      system "mvn", "package"
      libexec.install "target/Jace.jar"
    else
      libexec.install "Jace.jar"
    end
    bin.write_jar_script libexec/"Jace.jar", "jace", "-Duser.dir=#{etc}"
  end

  def caveats; <<-EOS.undent
    Jace configuration is saved in
        #{etc}/.jace.conf
    EOS
  end

  test do
    false
  end
end
