cask "gsplus" do
  version "0.14"
  sha256 "63015f83211fccedd01707cca56342f5dba58127d5b336bc9c33be51b93d8882"

  url "http://apple2.gs/downloads/plusbuilds/#{version}/GSplus-Install.dmg"
  name "GSplus"
  desc "Apple IIGS emulator based on KEGS and GSPort"
  homepage "https://apple2.gs/plus/"

  gsplus_folder = "/Applications/GSplus"
  shimscript = "#{staged_path}/gsplus-wrapper.sh"

  app "GSplus.app", target: "#{gsplus_folder}/GSplus.app"
  binary shimscript, target: "gsplus"
  artifact "license", target: "#{gsplus_folder}/license"
  artifact "gsplusmanual.pdf", target: "#{gsplus_folder}/gsplusmanual.pdf"
  artifact "README.txt", target: "#{gsplus_folder}/README.txt"

  preflight do
    IO.write shimscript, <<~EOS
      #!/bin/sh
      #{gsplus_folder}/GSplus.app/Contents/macOS/gsplus -config #{gsplus_folder}/config.txt "$@"
    EOS
  end

  postflight do
    IO.write("#{gsplus_folder}/config.txt", "# GSplus configuration file")
  end

  caveats <<~EOS
    Edit the config file located at #{gsplus_folder}/config.txt.

    GSplus must be launched from the command line. To get started, type:

      gsplus -h
  EOS
end
