cask "zulufx8" do
  arch arm: "aarch64", intel: "x64"

  version "8.0.412,8.78.0.19"
  sha256 arm:   "bda9050d1720b0b0b5c9850326bf870f505b882a7d1c5a580144f1d9c9c7036f",
         intel: "0c88a577fee7a0c33ee8e908d2a8686a0d95428b52be4666c9e3bfbf1e1f3361"

  url "https://cdn.azul.com/zulu/bin/zulu#{version.csv.second}-ca-fx-jdk#{version.csv.first}-macosx_#{arch}.dmg",
      referer: "https://www.azul.com/downloads/"
  name "Azul ZuluFX Java 8 Standard Edition Development Kit"
  desc "OpenJFX distribution from Azul"
  homepage "https://www.azul.com/downloads/zulu/zulufx/"

  livecheck do
    url "https://api.azul.com/zulu/download/community/v1.0/bundles/latest/?jdk_version=#{version.major}&ext=dmg&os=macos"
    url "https://api.azul.com/zulu/download/community/v1.0/bundles/latest/?java_version=#{version.major}&os=macos&arch=#{arch}&ext=dmg&bundle_type=jdk&release_status=ga"
    regex(/zulu(\d+(?:[._]\d+)*)-ca-fx-jdk(\d+(?:\.\d+)*)-macosx_#{arch}\.dmg/i)
    strategy :json do |json, regex|
      json["url"]&.scan(regex)&.map { |match| "#{match[1]},#{match[0]}" }
    end
  end

  depends_on macos: ">= :mojave"

  pkg "Double-Click to Install Azul Zulu JDK #{version.major}.pkg"

  uninstall pkgutil: "com.azulsystems.zulu.#{version.major}"

  zap trash: "~/Library/Saved Application State/com.azul.zulu.java.savedState"
end
