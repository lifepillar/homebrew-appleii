class Jace < Formula
  desc "Logical reproduction of an enhanced Apple //e computer"
  homepage "https://sites.google.com/site/brendanrobert/projects/jace"
  url "https://github.com/badvision/jace/archive/2.0-Stable.tar.gz"
  version "2.0-Stable"
  sha256 "eb3f6f044d05326e43873eac93ebfad778c47f4c286ba9654d759b10f0fb46e1"
  head "https://github.com/badvision/jace.git"

  depends_on "maven" => :build

  unless Dir.exist?("/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home")
    puts "Execute `brew install zulufx8` before installing Jace"
    exit 1
  end

  def install
    java_home = "/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home"
    ENV["JAVA_HOME"] = java_home
    system "./build.sh"
    libexec.install "target/Jace.jar"
    (bin/"jace").write <<~EOS
      #!/bin/bash
      export JAVA_HOME="#{java_home}"
      exec "${JAVA_HOME}/bin/java" -Duser.dir=/usr/local/etc -jar "/usr/local/Cellar/jace/2.0-Stable/libexec/Jace.jar" "$@"
    EOS
  end

  def caveats
    <<~EOS
      The executable is called `jace`.
      Jace configuration is saved in
          #{etc}/.jace.conf
    EOS
  end

  test do
    false
  end
end
