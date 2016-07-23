class OutlawEditor < Formula
  desc "Multi-platform RPG game editor"
  homepage "https://github.com/badvision/lawless-legends"
  url "https://github.com/badvision/lawless-legends/archive/latestStable.tar.gz"
  version "294fe817"
  sha256 "6ae54a61cb60cbb88fce4103ff9d2ab36c546461bb9b000c2f783e2973ac41dc"
  head "https://github.com/badvision/lawless-legends.git"

  depends_on :java => "1.8+"
  depends_on "maven" => :build

  def install
    cd "OutlawEditor" do
      system "mvn", "package"
      libexec.install "target/OutlawEditor.jar"
      bin.write_jar_script libexec/"OutlawEditor.jar", "OutlawEditor"
    end
  end

  test do
    system "false"
  end
end
