#!/usr/bin/env bash

# Exit on error
set -e

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
cd "$SCRIPTPATH"
export WINEPREFIX="$SCRIPTPATH"

# By default we'd prefer the use of the primary wine path.
WINEPATH="wine"
GAMEPATH="$(pwd)/drive_c/Program Files (x86)/Pokemon Insurgence 1.2.5 Core/Game.exe"
# If the main wine path couldn't be found.
if [ ! -x "$(command -v wine)" ]; then
    # Attempt to resolve the full wine path
    WINEPATH="/Applications/Wine Stable.app/Contents/Resources/wine/bin/wine"
    # If this also doesn't exist, exit out.
    if [ ! -f "$WINEPATH" ]; then
        echo "Wine could not be found. This likely means your installation was incomplete."
        exit 1
    fi
fi
if [ ! -f "$GAMEPATH" ]; then
    echo "The game files could not be found. This likely means your installation was incomplete."
    exit 1
fi


$WINEPATH $GAMEPATH &
exit

