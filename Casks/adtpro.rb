cask 'adtpro' do
  version '2.0.2'
  sha256 '29e711906520172684e363ec4e7b55d09d915c0cf22444df4403595d28f47ccf'

  adtpro = "ADTPro-#{version}"
  url "https://github.com/ADTPro/adtpro/releases/download/v_#{version.tr('.','_')}/#{adtpro}.dmg"
  appcast "https://github.com/ADTPro/adtpro/releases.atom"
  name 'ADTPro'
  name 'Apple Disk Transfer ProDOS'
  homepage 'http://adtpro.com'

  # Copy the whole folder
  app "#{adtpro}"
end
