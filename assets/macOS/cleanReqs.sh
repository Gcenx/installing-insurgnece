#!/usr/bin/env bash

write_red_bold () {
    printf "\\033[00;31m\\033[1m%s\\033[0m\\n" "$1"
}

write_bold () {
    printf "\\033[1m%b\\033[0m\\n" "$1"
}

print_step () {
    printf "\\n\\033[31m\\033[1m##### OVERALL CLEANUP STEP %s #####\\033[0m\\n" "$1"
}


print_step 2
write_bold "Updating Homebrew"
brew update

print_step 3
write_bold "Tapping homebrew/versions"
brew tap homebrew/cask-versions

print_step 4
write_bold "Removing XQuartz"
brew uninstall --cask xquartz

print_step 5
write_bold "Removing Wine installs"
brew uninstall --cask wine-stable
brew uninstall --cask wine-devel
brew uninstall --cask wine-staging
brew uninstall --cast wine-crossover

print_step 6
write_bold "Removing Winetricks"
brew uninstall winetricks

write_bold "Done!"
