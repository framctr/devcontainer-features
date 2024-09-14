#!/bin/bash

set -e

. ./library_scripts.sh

# nanolayer is a cli utility which keeps container layers as small as possible
# source code: https://github.com/devcontainers-contrib/nanolayer
# `ensure_nanolayer` is a bash function that will find any existing nanolayer installations, 
# and if missing - will download a temporary copy that automatically get deleted at the end 
# of the script
ensure_nanolayer nanolayer_location "v0.5.0"

$nanolayer_location install apt-get pip,python3-dev

# --break-system-packages required by latest Debian-based distros to install the package system-wide
if [ "$VERSION" != "latest" ] ; then
    pip install "${PACKAGE}"=="${VERSION}" --break-system-packages
else
    pip install "$PACKAGE" --break-system-packages
fi

echo 'Done!'
