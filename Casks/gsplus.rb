cask 'gsplus' do
  version '0.13'
  sha256 '7a170868901eca3e1a88c15277709340f68e9de6ccc6b010aa9dc849f5e71903'

  url 'http://apple2.gs/downloads/plusbuilds/0.13/GSplus-Install.dmg'
  name 'GSplus'
  name 'Apple IIGS emulator based on KEGS and GSPort'
  homepage 'https://apple2.gs/plus/'

  gsplus_folder = '/Applications/GSplus'
  shimscript = "#{staged_path}/gsplus-wrapper.sh"

  app 'GSplus.app', target: "#{gsplus_folder}/GSplus.app"
  binary shimscript, target: 'gsplus'
  artifact 'COPYING.txt', target: "#{gsplus_folder}/COPYING.txt"
  artifact 'gsplusmanual.pdf', target: "#{gsplus_folder}/gsplusmanual.pdf"
  artifact 'gsplusmanual.txt', target: "#{gsplus_folder}/gsplusmanual.txt"
  artifact 'README.txt', target: "#{gsplus_folder}/README.txt"

  preflight do
    IO.write shimscript, <<~EOS
      #!/bin/sh
      #{gsplus_folder}/GSplus.app/Contents/macOS/gsplus -config #{gsplus_folder}/config.txt "$@"
    EOS
  end

  postflight do
    IO.write("#{gsplus_folder}/config.txt", '# GSplus configuration file')
  end

  caveats <<~EOS
    Edit the config file located at #{gsplus_folder}/config.txt.

    GSplus must be launched from the command line. To get started, type:

      gsplus -h
  EOS
end
