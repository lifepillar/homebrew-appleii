cask 'kegs' do
  version '1.08'
  sha256 'f4e0224832cfbf9dab4da520a0e59d9d7dbf3e9208e3bcfe729fc1a2b9dda870'
  # url "https://downloads.sourceforge.net/kegs/kegs.#{version}.tar.gz"
  url "http://kegs.sourceforge.net/kegs.#{version}.tar.gz"
  name 'KEGS'
  desc 'Apple IIgs emulator'
  homepage 'http://kegs.sourceforge.net'

  kegs_folder = '/Applications/KEGS'
  shimscript = "#{staged_path}/kegs-wrapper.sh"

  app "kegs.#{version}/KEGSMAC.app", target: "#{kegs_folder}/KEGSMAC.app"
  binary shimscript, target: 'kegs'
  artifact "kegs.#{version}/config.kegs", target: "#{kegs_folder}/config.kegs"
  artifact "kegs.#{version}/README.a2.compatibility.txt", target: "#{kegs_folder}/README.a2.compatibility.txt"
  artifact "kegs.#{version}/README.kegs.txt", target: "#{kegs_folder}/README.kegs.txt"
  artifact "kegs.#{version}/README.mac.txt", target: "#{kegs_folder}/README.mac.txt"
  artifact "kegs.#{version}/README.ROM.files.txt", target: "#{kegs_folder}/README.ROM.files.txt"
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
