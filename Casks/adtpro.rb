cask 'adtpro' do
  version "2.0.3"
  sha256 "fb3d380a1a5196a950a2a90711fa99e2bd6bfd025891984e5ff967b2725d5dfc"

  adtpro = "ADTPro-#{version}"
  url "https://github.com/ADTPro/adtpro/releases/download/v_#{version.tr('.','_')}/#{adtpro}.dmg",
    verified: "github.com/ADTPro/adtpro/"
  appcast "https://github.com/ADTPro/adtpro/releases.atom"
  name "ADTPro"
  desc "Apple Disk Transfer ProDOS"
  homepage "http://adtpro.com"

  # Copy the whole folder
  app "#{adtpro}"
end
