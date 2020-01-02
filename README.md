# Insurgence Installation Helpers

This is a repo for making it easier to install the game of [Insurgence](https://p-insurgence.com). 

There may be additions from time to time in order to make installation easier on other platforms

## Installing on MacOs
**Requires MacOS Version Lower then Catalina (10.15) as the drop of support on 32bit applications makes the game unsupported.**

This installer is based on a shell script forked from [The Unofficial Urainum on MacOS installer](https://github.com/microbug/pokemon-uranium-on-macos) by [microbug](https://github.com/microbug) on github

The general flow of the installation process is installing homebrew for ease of package management then installing [XQuartz](https://www.xquartz.org), [Wine on the Staging Branch](https://www.winehq.org), and [Winetricks](https://github.com/Winetricks/winetricks). This group of software allows the creation of a configured wine directory for specifically running the RPG Maker Games on MacOS. The full specs for how it is configured is available on microbug's original repo as I \[Levi506\] do not own a mac, but have at least a passing understanding from Linux and other unix based bash terminals. This script's addition is the factor of acquiring the game from the website and unzipping it to where it needs to be and installing fonts for ease of use.

There are more details on what the script is doing on microbug's repo however he is a general breakdown for those worried about harming their macs.

### What this script is doing
The First Task is creating the directory pkmn_insurg in your home folder if this fails the install script will fail to run. This will generally only happen on subsequent runs.
    This task is invisible on the list but is vital none the less.

The Second Task the install script will do is install [Homebrew](https://brew.sh) or update it if it is already installed
    This is a Package Manager for macOS akin to for linux Linux of Pacman, Apt, DPKG, Yum, etc. This is important for the installer to work as it is what is used to acquire all the dependencies used to run the game.

The Third Task Homebrew updates it's local package lists so we can acquire the most recent versions of the software.

The Fourth Task [XQuartz](https://www.xquartz.org) is installed as a secondary graphics driver for the task Fifth task to install

The Fifth Task is installation on [Wine Staging](https://wiki.winehq.org/Wine-Staging) which is a version of Wine that puts a bit more emphasis on speed over prefected emulation so it isn' perfectly one to one, but should allow for less lag on the part of Wine in general.

The Sixth Task is the installation of [Winetricks](https://github.com/Winetricks/winetricks) in order to Set up a more customizations to the Wine Environment for better speed and stable function.

The Seventh Task is putting it all together and setting up the Environment

The Eighth Task Clones the Run Script from the macOS assets on this repo in order to launch the game in the directory. Then creates a shortcut on the desktop to this script.

The Ninth is clearing caches for that sweet ram 

The Tenth is installing the game to the wine directory in order to be able to launch the game with the command and then removes the zip download from the website
    *Note: If the website is down this task will fail.*