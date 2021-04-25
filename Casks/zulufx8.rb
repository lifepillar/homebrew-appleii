cask "zulufx8" do
  version "8.0.282,8.52.0.23-ca"

  if Hardware::CPU.intel?
    sha256 "84393b9430bbb4e5270cc00a0fc1311df6508e85c0bc891bff1ed1d5067da190"

    url "https://cdn.azul.com/zulu/bin/zulu#{version.after_comma}-fx-jdk#{version.before_comma}-macosx_x64.dmg",
      referer: "https://www.azul.com/downloads/zulu/zulu-mac/"
  else
    sha256 "e037a306b29d2079719229d43ffaf89908a9c4f7477bf71cd8af718c4285af47"

    url "https://cdn.azul.com/zulu/bin/zulu#{version.after_comma}-fx-jdk#{version.before_comma}-macosx_aarch64.dmg",
        referer: "https://www.azul.com/downloads/zulu/zulu-mac/"
  end

  name "ZuluFX 8"
  desc "Azul Zulu Java 8 Standard Edition Development Kit"
  homepage "https://www.azul.com/downloads/zulu/zulu-mac/"

  livecheck do
    url "https://api.azul.com/zulu/download/community/v1.0/bundles/latest/?jdk_version=#{version.major}&ext=dmg&os=macos"
    regex(/url":"https:.*zulu(.*)-jdk(.*)-macos/i)
    strategy :page_match do |page, regex|
      page.scan(regex).map { |match| match[1] + "," + match[0] }
    end
  end

  depends_on macos: ">= :yosemite"

  pkg "Double-Click to Install ZuluFX #{version.major}.pkg"

  uninstall pkgutil: "com.azulsystems.zulu.#{version.major}"
end
