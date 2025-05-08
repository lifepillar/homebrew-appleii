cask "kegs" do
  version "1.38"
  sha256 "d54c04cef80cc2d0dbd605210130047c03c5c2a89edc13745b74d16aa97d97ff"

  url "https://kegs.sourceforge.net/kegs.#{version}.zip"
  name "KEGS"
  desc "Apple IIgs emulator"
  homepage "https://kegs.sourceforge.net/"

  livecheck do
    url :homepage
    regex(/href=.*?kegs[._-](\d+(?:\.\d+)*)\.zip/i)
  end

  depends_on macos: ">= :high_sierra"

  kegs_folder = "#{appdir}/KEGS"
  shimscript = "#{staged_path}/kegs-wrapper.sh"

  app "kegs.#{version}/KEGSMAC.app", target: "#{kegs_folder}/KEGSMAC.app"
  binary shimscript, target: "kegs"
  artifact "kegs.#{version}/config.kegs", target: "#{kegs_folder}/config.kegs"
  artifact "kegs.#{version}/doc", target: "#{kegs_folder}/doc"
  artifact "kegs.#{version}/NUCLEUS03.gz", target: "#{kegs_folder}/NUCLEUS03.gz"
  artifact "kegs.#{version}/XMAS_DEMO.gz", target: "#{kegs_folder}/XMAS_DEMO.gz"

  preflight do
    File.write shimscript, <<~EOS
      #!/bin/sh
      cd #{kegs_folder}
      #{kegs_folder}/KEGSMAC.app/Contents/MacOS/KEGSMAC "$@"
    EOS
  end

  caveats <<~EOS
    You may launch KEGS by running `kegs` from the terminal.

    Because of macOS security measures, you may have to first open KEGSMAC by
    right-clicking on the app in the Finder and selecting "Open".

    You need to copy ROM files into #{kegs_folder}.

    See #{kegs_folder}/README.mac.txt.
  EOS
end
