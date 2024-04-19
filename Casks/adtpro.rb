cask "adtpro" do
  version "2.1.0"
  sha256 "663a4a6c8b0b7d61bcbf5ae0284b014645cb701a00c084c4ab4361df99eae8fc"

  adtpro = "ADTPro-#{version}"
  url "https://github.com/ADTPro/adtpro/releases/download/v_#{version.tr('.','_')}/#{adtpro}.dmg",
    verified: "github.com/ADTPro/adtpro/"
  name "ADTPro"
  desc "Apple Disk Transfer ProDOS"
  homepage "http://adtpro.com/"

  # Copy the whole folder
  app "#{adtpro}"
end
