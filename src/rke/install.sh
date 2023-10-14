#!/bin/sh
set -e

local_bin_dir="/usr/local/bin"

. ./library_scripts.sh

# nanolayer is a cli utility which keeps container layers as small as possible
# source code: https://github.com/devcontainers-contrib/nanolayer
# `ensure_nanolayer` is a bash function that will find any existing nanolayer installations, 
# and if missing - will download a temporary copy that automatically get deleted at the end 
# of the script
ensure_nanolayer nanolayer_location "v0.5.0"

$nanolayer_location install apt-get wget,curl

if [ "${VERSION}" = "latest" ] ; then
   VERSION=$(curl -s https://api.github.com/repos/rancher/rke/releases/latest | grep "tag_name" | cut -d : -f 2,3 | tr -d \" | tr -d , | tr -d ' ')
fi

wget -O- https://github.com/rancher/rke/releases/download/${VERSION}/rke_linux-amd64 > rke
chmod 755 rke
mv rke ${local_bin_dir}

echo 'Done!'