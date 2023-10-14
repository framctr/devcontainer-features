#!/bin/sh
set -e

local_bin_dir="/usr/local/bin"

wget -O- https://github.com/projectcalico/calico/releases/latest/download/calicoctl-linux-amd64 > calicoctl
mv calicoctl ${local_bin_dir}/calicoctl
chmod +x ${local_bin_dir}/calicoctl

echo 'Done!'