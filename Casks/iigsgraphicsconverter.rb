cask 'iigsgraphicsconverter' do
  version '1.0'
  sha256 :no_check

  url "http://www.apple2works.com/marklim/iigsgraphicsconverter.zip"
  name 'IIGSGraphicsConverter'
  desc 'Utility for converting unpacked Apple IIGS SHR graphics files to a packed format'
  homepage 'http://www.apple2works.com'

  app "IIGSGraphicsConverter.app"
end
