#!/bin/sh
set -e

local_bin_dir="/usr/local/bin"

if [ "${VERSION}" = "latest" ] ; then
   VERSION=curl -s https://api.github.com/repos/rancher/rke/releases/latest | grep "tag_name" | cut -d : -f 2,3 | tr -d \" | tr -d , | tr -d ' '
fi

wget -O- https://github.com/rancher/rke/releases/download/${VERSION}/rke_linux-amd64 > rke
chmod 755 rke
mv rke ${local_bin_dir}

echo 'Done!'