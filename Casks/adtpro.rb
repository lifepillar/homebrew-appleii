cask 'adtpro' do
  version '2.0.1'
  sha256 '26384b16d3d5b0bae1afde511be8c6f087d5ecd203d2a4197ff2874de4de860f'

  adtpro = 'ADTPro-2.0.1'
  url "http://downloads.sourceforge.net/sourceforge/adtpro/#{adtpro}.dmg"
  name 'ADTPro'
  name 'Apple Disk Transfer ProDOS'
  homepage 'http://adtpro.sourceforge.net'

  app "#{adtpro}/#{adtpro}.app"
end
