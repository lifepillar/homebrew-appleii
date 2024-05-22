cask "openemulator" do
  version "1.1.1-20220311"
  sha256 "b32f144efc3d6bf2be857e35fe1d65a91fd40ffe6f3dc34cf34cbf7501998a6f"

  url "https://archive.org/download/OpenEmulatorSnapshots/OpenEmulator-20220311.zip"
  name "OpenEmulator"
  desc "Accurate, portable emulator of legacy computer systems"
  homepage "https://archive.org/details/OpenEmulatorSnapshots"

  app "OpenEmulator.app"

  zap trash: [
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/org.openemulator.openemulator.sfl",
    "~/Library/Preferences/org.openemulator.OpenEmulator.plist",
  ]
end
