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


print_step 1
if [ -x "$(command -v brew)" ]; then
    write_bold "Homebrew is already installed! Good for you, Homebrew is awesome."
else
    write_bold "Homebrew not installed, installing now"
    write_red_bold "Accept all prompts and provide your password when it's asked for"
    HOMEBREW_INSTALL_SCRIPT=$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh) || exit 1
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
write_bold "Installing Wine Stable"
brew cask install wine-stable

print_step 6
write_bold "Installing Winetricks"
brew install winetricks

