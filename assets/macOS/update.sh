#!/bin/sh

# Error when any command fails. Prevents incomplete installs.
set -e

write_red_bold () {
    printf "\\033[00;31m\\033[1m%s\\033[0m\\n" "$1"
}

write_bold () {
    printf "\\033[1m%b\\033[0m\\n" "$1"
}

print_step () {
    printf "\\n\\033[31m\\033[1m##### OVERALL INSTALLATION STEP %s #####\\033[0m\\n" "$1"
}

if [ ! -d "$HOME/pkmn_insurg" ]; then
    echo "The game directory not found. Please use the install script instead."
    exit 1
fi

if [ -d "$HOME/pkmn_insurg/drive_c/Program Files (x86)/Pokemon Insurgence 1.2.5 Core" ]; then
    print_step 1
    write_bold "Updating Dir"
    mv -f "$HOME/pkmn_insurg/drive_c/Program Files (x86)/Pokemon Insurgence 1.2.5 Core" "$HOME/pkmn_insurg/drive_c/Program Files (x86)/Pokemon Insurgence"
fi

if [ ! -d "$HOME/pkmn_insurg/drive_c/Program Files (x86)/Pokemon Insurgence" ]; then
    echo "Install not found. Please use the install script instead."
    exit 1
fi

brew install wget

print_step 2
write_bold "Updating Run Script"
rm -f "$HOME/pkmn_insurg/Run-Pokémon-Insurgence.command"
wget -qcO "$HOME/pkmn_insurg/Run-Pokémon-Insurgence.command" "https://gitlab.com/levi506/installing-insurgnece/raw/master/assets/macOS/run.sh"
chmod +x "$HOME/pkmn_insurg/Run-Pokémon-Insurgence.command"
rm -f "$HOME/Desktop/Run-Pokémon-Insurgence.command"
ln -s "$HOME/pkmn_insurg/Run-Pokémon-Insurgence.command" "$HOME/Desktop/Run-Pokémon-Insurgence.command"

print_step 3
write_bold "Updating Game Files."
wget -c "https://p-insurgence.com/releases/1.2.7/Pokemon Insurgence 1.2.7 Patch.zip"
unzip -uo "Pokemon Insurgence 1.2.7 Patch.zip" -d "$HOME/pkmn_insurg/drive_c/Program Files (x86)/Pokemon Insurgence"
mv -f "Pokemon Insurgence 1.2.7 Patch.zip" "$HOME/pkmn_insurg/drive_c/Program Files (x86)/"

echo "1.2.7" > "$HOME/pkmn_insurg/version"
write_bold "Finished updating to 1.2.7! You can now play the game by running the shortcut on your desktop."
