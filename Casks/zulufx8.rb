cask "zulufx8" do
  version "8.0.382,8.72.0.17-ca"

  on_arm do
    sha256 "33b3a54448e4aea4b88741c59ed2025104ae35c7113c3cf380318a4ff34081fd"

    url "https://cdn.azul.com/zulu/bin/zulu#{version.after_comma}-fx-jdk#{version.before_comma}-macosx_aarch64.dmg",
        referer: "https://www.azul.com/downloads/zulu/zulu-mac/"
  end
  on_intel do
    sha256 "e22beea3abeab79cd31164b72125c68e92bdf093661bd04440028630aae50f87"

    url "https://cdn.azul.com/zulu/bin/zulu#{version.after_comma}-fx-jdk#{version.before_comma}-macosx_x64.dmg",
        referer: "https://www.azul.com/downloads/zulu/zulu-mac/"
  end

  name "ZuluFX 8"
  desc "Azul Zulu Java 8 Standard Edition Development Kit"
  homepage "https://www.azul.com/downloads/zulu/zulu-mac/"

  livecheck do
    url "https://api.azul.com/zulu/download/community/v1.0/bundles/latest/?jdk_version=#{version.major}&ext=dmg&os=macos"
    regex(/zulu(.+)-fx-jdk(.+)-macos/i)
    strategy :json do |json, regex|
      json["name"].scan(regex).map { |match| match[1] + "," + match[0] }
    end
  end

  pkg "Double-Click to Install Azul Zulu JDK #{version.major}.pkg"

  uninstall pkgutil: "com.azulsystems.zulu.#{version.major}"
end
