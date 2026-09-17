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

  kegs_folder = "#{appdir}/KEGS"

  app "kegs.#{version}/KEGSMAC.app", target: "#{kegs_folder}/KEGSMAC.app"
  binary "kegs-wrapper.sh", target: "kegs"
  artifact "kegs.#{version}/config.kegs", target: "#{kegs_folder}/config.kegs"
  artifact "kegs.#{version}/doc", target: "#{kegs_folder}/doc"
  artifact "kegs.#{version}/NUCLEUS03.gz", target: "#{kegs_folder}/NUCLEUS03.gz"
  artifact "kegs.#{version}/XMAS_DEMO.gz", target: "#{kegs_folder}/XMAS_DEMO.gz"

  preflight_steps do
    write_file "kegs-wrapper.sh", <<~EOS
      #!/bin/sh
      cd {{appdir}}/KEGS
      {{appdir}}/KEGS/KEGSMAC.app/Contents/MacOS/KEGSMAC "$@"
    EOS
  end

  caveats <<~EOS
    You may launch KEGS by running `kegs` from the terminal.

    Because of macOS security measures, you may have to first remove the
    quarantine attribute using the following command:

        xattr -d com.apple.quarantine #{kegs_folder}/KEGSMAC.app

    ROM files must be copied into into #{kegs_folder}.

    See also #{kegs_folder}/doc/README.mac.txt.
  EOS
end
