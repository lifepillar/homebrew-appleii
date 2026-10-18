cask "apple1basic" do
  version "20080718" # Date of original post
  sha256 :no_check

  # www.weihenstephan.org/~michaste/pagetable/recompiler was verified as official when first introduced to the cask
  url "http://www.weihenstephan.org/~michaste/pagetable/recompiler/apple1basic_osx.zip"

  name "Apple I BASIC"
  desc "Apple I BASIC as a scripting language for 32-bit Intel"
  homepage "https://www.pagetable.com/?p=35"

  binary "apple1basic"
end
