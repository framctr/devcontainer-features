#!/bin/bash

set -e

. ./library_scripts.sh

# nanolayer is a cli utility which keeps container layers as small as possible
# source code: https://github.com/devcontainers-contrib/nanolayer
# `ensure_nanolayer` is a bash function that will find any existing nanolayer installations, 
# and if missing - will download a temporary copy that automatically get deleted at the end 
# of the script
ensure_nanolayer nanolayer_location "v0.5.0"

$nanolayer_location install apt-get pipx,python3-dev

if [ "$VERSION" != "latest" ] ; then
    pipx install "${PACKAGE}"=="${VERSION}"
else
    pipx install "$PACKAGE"
fi

echo 'Done!'
