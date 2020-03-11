#!/usr/bin/env bash

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
cd "$SCRIPTPATH"
export WINEPREFIX="$SCRIPTPATH"
"/Applications/Wine Stable.app/Contents/Resources/wine/bin/wine" "$(pwd)/drive_c/Program Files (x86)/Pokemon Insurgence 1.2.5 Core/Game.exe" &
exit

