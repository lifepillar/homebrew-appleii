# Vintage Apple emulators and related software

![Apple I](images/i.png "Apple I")
![Apple \]\[](images/ii.png "Apple II")
![Apple \]\[+](images/ii+.png "Apple II+")
![Apple \]\[e](images/iie.png "Apple IIe")
![Jobs and Woz](images/jobs_woz.png "Jobs and Woz")
![Apple //e Platinum](images/iiee.png "Apple //e Platinum")
![Apple //c](images/iic.png "Apple //c")
![Apple ///+](images/iii+.png "Apple ///+")
![Apple //GS](images/iigs.png "Apple //GS")


## Requirements

[Homebrew](http://brew.sh).


## Installation

    brew tap lifepillar/appleii


## How to install formulas and casks

    brew install <formula or cask>

In some cases, a formula and a cask have the same name (e.g., `openemulator`).
You may pass `--formula` or `--cask` to `brew install` to disambiguate. Refer
to Homebrew's documentation for further details about these and other commands,
or if you are unfamiliar with the terminology.

Examples:

    brew install --formula openemulator
    brew install --cask openemulator
    brew install cadius
    brew install gsport


## Contributions

They are welcome! If you know of some program that is not included here, please
let me know!


## FAQ

_Why isn't [cc65](https://cc65.github.io/cc65/) in this repository?_

cc65 is already in Homebrew! (`brew install cc65`)

_Why isn't [Virtual \]\[](http://www.virtualii.com) in this repository?_

Virtual ][ is already in Homebrew Cask! (`brew install --cask virtual-ii`)


## Credits

The images in this repository have been generated with B. Buckels's `b2d` and
`a2b` programs. Original files are all from
[apple-history](http://apple-history.com), with the exception of the Apple I
(original from
[Wikipedia](https://en.wikipedia.org/wiki/File:Apple_I_Computer.jpg)) and the
Apple ][e (courtesy of [W.
Warby](https://www.flickr.com/photos/wwarby/16614254568/)). The picture of Jobs
and Woz is in so many places that I don't know whether it is copyrighted or may
be considered in the public domain.
