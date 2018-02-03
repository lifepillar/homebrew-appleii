class Jace < Formula
  desc "Logical reproduction of an enhanced Apple //e computer"
  homepage "https://sites.google.com/site/brendanrobert/projects/jace"
  url "https://github.com/badvision/jace/releases/download/2.0-Stable/Jace.jar"
  sha256 "e133bccd95cc5a7b21bd741fa36c99b8dbced249b165edbe9f15bb600b18565d"
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

  def caveats; <<~EOS
    Jace configuration is saved in
        #{etc}/.jace.conf
    EOS
  end

  test do
    false
  end
end
