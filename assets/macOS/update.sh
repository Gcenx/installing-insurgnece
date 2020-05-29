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


if [[ $SHELL == *"zsh" ]] ;
then
    write_red_bold "Error: You appear to be on MacOS Catalina or later. In this release, Apple has discontinued support for 32 bit applications, and as such Pokémon Insurgence will not be able to run."
    write_bold "(if you are on an older version than Catalina and upgraded your shell to ZSH, run export SHELL='' before running the install command.)"
    exit 1
fi

print_step 1
write_bold "Updating Dir"
mv -f "$HOME/pkmn_insurg/drive_c/Program Files (x86)/Pokemon Insurgence 1.2.5 Core" "$HOME/pkmn_insurg/drive_c/Program Files (x86)/Pokemon Insurgence"

print_step 2
write_bold "Updating Run Script"
rm -f "$HOME/pkmn_insurg/Run-Pokémon-Insurgence.command"
curl -s -o "$HOME/pkmn_insurg/Run-Pokémon-Insurgence.command" "https://gitlab.com/levi506/installing-insurgnece/raw/master/assets/macOS/run.sh"
chmod +x "$HOME/pkmn_insurg/Run-Pokémon-Insurgence.command"
ln -s "$HOME/pkmn_insurg/Run-Pokémon-Insurgence.command" "$HOME/Desktop/Run-Pokémon-Insurgence.command"

print_step 3
write_bold "Updating Insurg"
curl -O "https://p-insurgence.com/releases/1.2.6/Pokemon Insurgence 1.2.6 Patch.zip"
unzip -u "Pokemon Insurgence 1.2.6 Patch.zip" -d "$HOME/pkmn_insurg/drive_c/Program Files (x86)/Pokemon Insurgence"
mv -f "Pokemon Insurgence 1.2.6 Patch.zip" "$HOME/pkmn_insurg/drive_c/Program Files (x86)/"