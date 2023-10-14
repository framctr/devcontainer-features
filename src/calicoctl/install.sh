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

$nanolayer_location install apt-get wget

wget -O- https://github.com/projectcalico/calico/releases/latest/download/calicoctl-linux-amd64 > calicoctl
mv calicoctl ${local_bin_dir}/calicoctl
chmod +x ${local_bin_dir}/calicoctl

echo 'Done!'