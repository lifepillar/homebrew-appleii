cask 'apple1basic' do
  version '20080718' # Date of original post
  sha256 'f697b2e8893f04064367c39fa83c08024b7e4ec427b2436a014a555ba4ba4550'

  # www.weihenstephan.org/~michaste/pagetable/recompiler was verified as official when first introduced to the cask
  url 'http://www.weihenstephan.org/~michaste/pagetable/recompiler/apple1basic_osx.zip',
    verified: "weihenstephan.org/~michaste/"
  name 'Apple I BASIC'
  desc "Apple I BASIC as a scripting language for Mac OS X Intel"
  homepage 'https://www.pagetable.com/?p=35'

  binary 'apple1basic'

  caveats <<~EOS
    This is a 32-bit executable, hence it does not work in macOS Catalina or later.
  EOS
end
