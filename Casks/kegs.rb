cask 'kegs' do
  version '1.23'
  sha256 '5466e91868ee6d156c853625740d9c9b5e6a3409e9bcfbb1e517788e7dae2aec'
  url "https://kegs.sourceforge.net/kegs.#{version}.zip"
  name 'KEGS'
  desc 'Apple IIgs emulator'
  homepage 'http://kegs.sourceforge.net'

  kegs_folder = '/Applications/KEGS'
  shimscript = "#{staged_path}/kegs-wrapper.sh"

  app "kegs.#{version}/KEGSMAC.app", target: "#{kegs_folder}/KEGSMAC.app"
  binary shimscript, target: 'kegs'
  artifact "kegs.#{version}/config.kegs", target: "#{kegs_folder}/config.kegs"
  artifact "kegs.#{version}/doc", target: "#{kegs_folder}/doc"
  artifact "kegs.#{version}/NUCLEUS03.gz", target: "#{kegs_folder}/NUCLEUS03.gz"
  artifact "kegs.#{version}/XMAS_DEMO.gz", target: "#{kegs_folder}/XMAS_DEMO.gz"

  preflight do
    IO.write shimscript, <<~EOS
      #!/bin/sh
      cd #{kegs_folder}
      #{kegs_folder}/KEGSMAC.app/Contents/MacOS/KEGSMAC "$@"
    EOS
  end

  caveats <<-EOS
    You may launch KEGS by running `kegs` from the terminal.

    Because of macOS security measures, you may have to open KEGSAPP by
    right-clicking on the app in the Finder a couple of times.

    You need to copy ROM files into #{kegs_folder}.

    See #{kegs_folder}/README.mac.txt.
  EOS
end
