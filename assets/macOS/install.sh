#!/usr/bin/env bash

write_red_bold () {
    printf "\\033[00;31m\\033[1m%s\\033[0m\\n" "$1"
}

write_bold () {
    printf "\\033[1m%b\\033[0m\\n" "$1"
}

print_step () {
    printf "\\n\\033[31m\\033[1m##### OVERALL INSTALLATION STEP %s #####\\033[0m\\n" "$1"
}

write_bold "Unofficial Pokémon Insurgence Wine Installation Tool"
write_bold "Based on the Unofficial Pkmn Uranium Installer https://github.com/microbug/pokemon-uranium-on-macos"

if [ -d "$HOME/pkmn_insurg" ]; then
    write_red_bold "Error: ~/pkmn_insurg already exists, please move or delete it before continuing"
    exit 1
fi

print_step 1
if [ -x "$(command -v brew)" ]; then
    write_bold "Homebrew is already installed! Good for you, Homebrew is awesome."
else
    write_bold "Homebrew not installed, installing now"
    write_red_bold "Accept all prompts and provide your password when it's asked for"
    HOMEBREW_INSTALL_SCRIPT=$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install) || exit 1
    /usr/bin/ruby -e "$HOMEBREW_INSTALL_SCRIPT"
    brew analytics off
fi

print_step 2
write_bold "Updating Homebrew"
brew update

print_step 3
write_bold "Tapping homebrew/versions"
brew tap homebrew/cask-versions

print_step 4
write_bold "Installing XQuartz"
brew cask install xquartz

print_step 5
write_bold "Installing Wine Staging"
brew cask install wine-staging

print_step 6
write_bold "Installing Winetricks"
brew install winetricks

print_step 7
write_bold "Creating virtual Windows installation at ~/pkmn_insurg"
write_red_bold "Remember to accept all prompts to install Mono and/or Gecko, you may be asked several times"
write_bold "Lots of Wine logs (may look like nonsense) coming up..."
export PATH=$PATH:"/Applications/Wine Staging.app/Contents/Resources/wine/bin/"
mkdir ~/pkmn_insurg
export WINEPREFIX=~/pkmn_insurg
cd $WINEPREFIX || exit
wineboot
wineserver -w  # Wait for process to finish before continuing
winetricks directplay directmusic dsound d3dx9_43 macdriver=x11 ddr=opengl win10 devenum dmsynth quartz
sleep 5  # Let Wine finish spewing logs

print_step 8
write_bold "Adding game start script"
curl -s -o "$HOME/pkmn_insurg/Run Pokémon Insurgence.command" "https://gitlab.com/levi506/installing-insurgnece/raw/master/assets/macOS/run.sh"
chmod +x "$HOME/pkmn_insurg/Run Pokémon Insurgence.command"
ln -s "$HOME/pkmn_insurg/Run Pokémon Insurgence.command" "$HOME/Desktop/Run Pokémon Insurgence.command"

print_step 9
write_bold "Clearing caches"
rm -rf ~/.cache/wine ~/.cache/winetricks
rm -rf $(brew --cache)

print_step 10
write_bold "Installing Insurg"
curl -O "https://www.p-insurgence.com/releases/1.2.5/Pokemon Insurgence 1.2.5 Core.zip" -o 
unzip "Pokemon Insurgence 1.2.5 Core.zip" -d "$HOME/pkmn_insurg/drive_c/Program Files (x86)/"
rm -rf "Pokemon Insurgence 1.2.5 Core.zip"

write_bold "Done!"
write_red_bold "Wait for all Wine configuration to finish (wait for any remaining windows to close), then REBOOT and check the guide on the Pokemon Insurgence Forums for next steps"
