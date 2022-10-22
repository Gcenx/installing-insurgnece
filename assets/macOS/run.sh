#!/bin/sh

# Exit on error
set -e

export WINEPREFIX="$HOME/pkmn_insurg"

GAMEPATH="$WINEPREFIX/drive_c/Program Files (x86)/Pokemon Insurgence/Game.exe"
# If the main wine path couldn't be found.
if [ ! -x "$(command -v wine)" ]; then
    echo "wine could not be found. This likely means your installation was incomplete."
    exit 1
fi
if [ ! -f "$GAMEPATH" ]; then
    echo "The game files could not be found. This likely means your installation was incomplete."
    exit 1
fi

if [[ $# -eq 1 && $1 == "tail" ]] ; then
    "wine" "$GAMEPATH"
else
    "wine" "$GAMEPATH" &
    exit
fi
